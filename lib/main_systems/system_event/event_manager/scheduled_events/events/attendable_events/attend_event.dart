import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/dialog_handler.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/utils/numbers/get_random_int_in_positive_range.dart';
import 'package:toplife/core/utils/words/sentence_util.dart';
import 'package:toplife/game_manager/action_runner/action_runner.dart';
import 'package:toplife/game_manager/action_runner/info_models/action_detail.dart';
import 'package:toplife/game_manager/action_runner/info_models/action_duration.dart';
import 'package:toplife/game_manager/action_runner/info_models/action_result.dart';
import 'package:toplife/game_manager/action_runner/info_models/game_action.dart';
import 'package:toplife/game_manager/action_runner/info_models/report.dart';
import 'package:toplife/game_manager/domain/model/info_models/person_game_pair.dart';
import 'package:toplife/main_systems/system_event/constants/event_type.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/attend_event_detail.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/event_text.dart';
import 'package:toplife/main_systems/system_event/domain/repository/event_repository.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/attendable_events/util/get_first_person_gift_reaction.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/attendable_events/util/get_first_person_party_description.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/attendable_events/util/get_first_person_event_partner_attendance_description.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/attendable_events/util/perform_party_activity.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/settlement.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';
import 'package:toplife/main_systems/system_transportation/domain/model/travel_detail.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/transportation_usecases.dart';

class AttendEvent {
  final EventRepository _eventRepository;
  final PersonUsecases _personUsecases;
  final RelationshipUsecases _relationshipUsecases;
  final ShopAndStorageUsecases _shopAndStorageUsecases;
  final PerformPartyActivity _performPartyActivity;
  final GetFirstPersonEventPartnerAttendanceDescription
      _getFirstPersonEventPartnerAttendanceDescription;
  final ActionRunner _actionRunner;
  final TransportationUsecases _transportationUsecases;

  const AttendEvent(
    this._eventRepository,
    this._personUsecases,
    this._relationshipUsecases,
    this._shopAndStorageUsecases,
    this._performPartyActivity,
    this._getFirstPersonEventPartnerAttendanceDescription,
    this._actionRunner,
    this._transportationUsecases,
  );

  Future<void> perform({
    required Event event,
    required Person eventMainPerson,
    required EventText eventText,
    required bool isParty,
    required EventType eventType,
    required AttendEventDetail attendEventDetail,
  }) async {
    //start & end time
    final int? eventStartTime = event.startTime;
    final int? eventEndTime = event.endTime;

    if (eventStartTime != null && eventEndTime != null) {
      //get main persons settlement
      final Settlement eventMainPersonSettlement =
          await _transportationUsecases.getTravellerSettlement.execute(
        travellerPersonID: eventMainPerson.id,
      );

      //set action duration
      //END TIME = TIME THE PLAYER WANTS TO EXIT
      final ActionDuration actionDuration = ActionDuration.timed(
        startTimeInMinutes: eventStartTime,
        endTimeInMinutes: attendEventDetail.exitTimeInMinutes,
      );

      //Action detail
      //attendable event is timed
      final ActionDetail actionDetail = ActionDetail(
        actionDuration: actionDuration,
        gameAction: PlayerAction.doDefaultAlways(
          defaultPerformance: (currentGameAndPlayer, dialogHandler) => _execute(
            event: event,
            eventMainPerson: eventMainPerson,
            currentPlayerAndGame: currentGameAndPlayer,
            eventText: eventText,
            attendEventDetail: attendEventDetail,
            isParty: isParty,
            eventType: eventType,
            dialogHandler: dialogHandler,
          ),
        ),
      );

      //Travel detail
      final TravelDetail travelDetail = TravelDetail(
        destinationCountryString: eventMainPerson.currentCountry,
        destinationStateString: eventMainPerson.currentState,
        destinationSettlementString: eventMainPersonSettlement.name,
      );

      return _actionRunner.performTwoWayTravelAction(
        actionDetail: actionDetail,
        travelDetail: travelDetail,
      );
    }
  }

  Future<ActionResult> _execute({
    required Event event,
    required Person eventMainPerson,
    required PersonGamePair currentPlayerAndGame,
    required EventText eventText,
    required AttendEventDetail attendEventDetail,
    required bool isParty,
    required EventType eventType,
    required DialogHandler dialogHandler,
  }) async {
    //
    final Person currentPlayer = currentPlayerAndGame.person;

    //increase relationship w/ host, wellbeing and hunger
    await _personUsecases.updateHungerStatsUsecase.execute(
      mainPersonID: currentPlayer.id,
      change: getRandomIntInPositiveRange(min: 1, max: 30), //1-30
      override: false,
    );

    await _personUsecases.updateMoodStatsUsecase.execute(
      mainPersonID: currentPlayer.id,
      change: getRandomIntInPositiveRange(min: 1, max: 20), //1-20
      override: false,
    );

    await _relationshipUsecases.updateRelationshipLevelUsecase.execute(
      firstPersonID: currentPlayer.id,
      secondPersonID: event.mainPersonId,
      change: getRandomIntInPositiveRange(min: 10, max: 20),
    );

    //remove chosen gift from storage
    if (attendEventDetail.itemGift != null) {
      await _shopAndStorageUsecases.useStoreroomItemUsecase.execute(
        storeroomItemID: attendEventDetail.itemGift!.storeroomItem.id,
      );
    }

    //remove chosen money gift from account
    await _personUsecases.takeMoneyFromPlayerUsecase.execute(
      mainPlayerID: currentPlayer.id,
      baseAmountToTake: attendEventDetail.moneyGift.toInt(),
      adjustToEconomy: false,
    );

    //get the second part of the entry and result desc:

    //get partner attendance desc if the player attended with partner
    final String firstPersonPartnerAttendanceDesc =
        (attendEventDetail.attendWithPartner)
            ? await _getFirstPersonEventPartnerAttendanceDescription.execute(
                mainPlayerID: currentPlayer.id,
                eventType: eventType,
              )
            : TextConstants.emptyString;

    //Build second part
    late final String firstPersonSecondPart;
    late final String secondPersonSecondPart;

    //for party event
    if (isParty) {
      //perform chosen party activity
      final String partyActivityDesc = await _performPartyActivity.execute(
        mainPlayerID: currentPlayer.id,
        chosenPartyEventActivity: attendEventDetail.partyEventActivity,
      );

      //get party desc only if it is a party
      final String firstPersonEventDesc =
          GetFirstPersonPartyDescription.execute(
        eventMainPersonGender: eventMainPerson.gender,
      );

      //get gift reaction only if it was a party
      final String firstPersonGiftReaction = GetFirstPersonGiftReaction.execute(
        eventMainPerson: eventMainPerson,
        chosenGift: attendEventDetail.itemGift,
        chosenMoneyGiftAmount: attendEventDetail.moneyGift,
      );

      //Build second part
      firstPersonSecondPart =
          "$firstPersonPartnerAttendanceDesc\n$partyActivityDesc\n$firstPersonEventDesc.\n$firstPersonGiftReaction.";

      // i do this so the sentence converter isnt affected by the new line symbol
      secondPersonSecondPart =
          "${SentenceUtil.convertFromFirstPersonToSecondPerson(
        firstPersonSentence: firstPersonPartnerAttendanceDesc,
      )}\n${SentenceUtil.convertFromFirstPersonToSecondPerson(
        firstPersonSentence: partyActivityDesc,
      )}\n${SentenceUtil.convertFromFirstPersonToSecondPerson(
        firstPersonSentence: firstPersonEventDesc,
      )}.\n${SentenceUtil.convertFromFirstPersonToSecondPerson(
        firstPersonSentence: firstPersonGiftReaction,
      )}.";
    }
    //For NON-party event
    else {
      //Build second part
      firstPersonSecondPart = firstPersonPartnerAttendanceDesc;

      // i do this so the sentence converter isnt affected by the new line symbol
      secondPersonSecondPart =
          SentenceUtil.convertFromFirstPersonToSecondPerson(
        firstPersonSentence: firstPersonPartnerAttendanceDesc,
      );
    }

    //mark event as performed
    await _eventRepository.updateEvent(
      event.copyWith(
        performed: true,
      ),
    );

    //final journal entry
    final String journalEntry =
        "${eventText.journalEntry}\n$firstPersonSecondPart";

    //final result description
    final String resultDescription =
        "${eventText.resultDescription}\n$secondPersonSecondPart";

    //prep report
    final Report resultReport = Report(
      dialog: dialogHandler.showResultDialog(
        title: eventText.resultTitle,
        result: resultDescription,
      ),
    );

    //send success action result
    return ActionResult.successWithReportJournalEntryButNoDuration(
      report: resultReport,
      journalEntry: journalEntry,
    );
  }
}
