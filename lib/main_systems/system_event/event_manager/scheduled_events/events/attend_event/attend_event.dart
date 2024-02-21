//the called dialogs already check for context mount status
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/custom_dialogs/attend_event_dialog/dialog/attend_event_dialog.dart';
import 'package:toplife/core/dialogs/result_dialog.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/utils/numbers/get_random_int_in_positive_range.dart';
import 'package:toplife/core/utils/words/sentence_util.dart';
import 'package:toplife/main_systems/system_age/age.dart';
import 'package:toplife/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/main_systems/system_event/constants/event_type.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/attend_event_detail.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/event_text.dart';
import 'package:toplife/main_systems/system_event/domain/repository/event_repository.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/attend_event/check_if_event_is_party.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/attend_event/event_texts/get_attendable_event_text.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/attend_event/get_first_person_gift_reaction.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/attend_event/get_first_person_party_description.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/attend_event/get_first_person_event_partner_attendance_description.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/attend_event/perform_party_activity.dart';
import 'package:toplife/main_systems/system_event/util/convert_event_type_string_to_enum.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';
import 'package:toplife/main_systems/system_relationship/util/get_platonic_and_romantic_relationship_label_from_string.dart.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';

class AttendEvent {
  final EventRepository _eventRepository;
  final PersonUsecases _personUsecases;
  final RelationshipUsecases _relationshipUsecases;
  final JournalUsecases _journalUsecases;
  final AgeUsecases _ageUsecases;
  final ShopAndStorageUsecases _shopAndStorageUsecases;
  final PerformPartyActivity _performPartyActivity;
  final GetFirstPersonEventPartnerAttendanceDescription
      _getFirstPersonEventPartnerAttendanceDescription;

  const AttendEvent(
    this._eventRepository,
    this._personUsecases,
    this._relationshipUsecases,
    this._journalUsecases,
    this._ageUsecases,
    this._shopAndStorageUsecases,
    this._performPartyActivity,
    this._getFirstPersonEventPartnerAttendanceDescription,
  );

  Future<void> execute({
    required BuildContext context,
    required Event event,
    required int mainPlayerID,
  }) async {
    //*BEFORE ATTEND INPUT:
    //get the event person
    final Person? eventMainPerson =
        await _personUsecases.getPersonUsecase.execute(
      personID: event.mainPersonId,
    );

    //get relationship
    final Relationship? relationship =
        await _relationshipUsecases.getRelationshipUsecase.execute(
      firstPersonID: mainPlayerID,
      secondPersonID: event.mainPersonId,
    );

    //get event type
    final EventType? eventType = convertEventTypeStringToEnum(event.eventType);

    if (eventMainPerson != null && relationship != null && eventType != null) {
      //get relationship label
      final String relationshipLabel =
          getPlatonicAndRomanticRelationshipLabelFromString(
        genderString: eventMainPerson.gender,
        platonicRelationshipTypeString: relationship.platonicRelationshipType,
        romanticRelationshipTypeString: relationship.romanticRelationshipType,
        previousFamilialRelationshipString:
            relationship.previousFamilialRelationship,
        isCoParent: relationship.isCoParent,
        activeRomance: relationship.activeRomance,
      );

      //get age
      final Age eventMainPersonAge = _ageUsecases.getPersonsAgeUsecase.execute(
        dayOfBirth: eventMainPerson.dayOfBirth,
        currentDay: event.eventDay,
      );

      //Get all the event Text for this event
      final EventText eventText = GetAttendableEventText.execute(
        eventType: eventType,
        eventMainPerson: eventMainPerson,
        relationshipLabel: relationshipLabel,
        age: eventMainPersonAge,
      );

      //check if the event is a party
      final bool isParty = checkIfEventIsParty(eventType);

      //*ATTEND INPUT
      //Show dialog and get player input
      final AttendEventDetail? attendEventDetail = await AttendEventDialog.show(
        context: context,
        event: event,
        mainPlayerID: mainPlayerID,
        eventMainPerson: eventMainPerson,
        eventTitle: eventText.eventTitle,
        secondPersonEventDescription: eventText.eventDescription,
        relationshipLabel: relationshipLabel,
        isParty: isParty,
      );

      //if we get valid input from player
      if (attendEventDetail != null) {
        //*AFTER ATTEND INPUT:
        //increase relationship w/ host, wellbeing and hunger
        await _personUsecases.updateHungerStatsUsecase.execute(
          mainPersonID: mainPlayerID,
          change: getRandomIntInPositiveRange(min: 1, max: 30), //1-30
          override: false,
        );

        await _personUsecases.updateMoodStatsUsecase.execute(
          mainPersonID: mainPlayerID,
          change: getRandomIntInPositiveRange(min: 1, max: 20), //1-20
          override: false,
        );

        await _relationshipUsecases.updateRelationshipLevelUsecase.execute(
          firstPersonID: mainPlayerID,
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
          mainPlayerID: mainPlayerID,
          baseAmountToTake: attendEventDetail.moneyGift.toInt(),
          adjustToEconomy: false,
        );

        //get the second part of the entry and result desc:

        //get partner attendance desc if the player attended with partner
        final String firstPersonPartnerAttendanceDesc = (attendEventDetail
                .attendWithPartner)
            ? await _getFirstPersonEventPartnerAttendanceDescription.execute(
                mainPlayerID: mainPlayerID,
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
            mainPlayerID: mainPlayerID,
            chosenPartyEventActivity: attendEventDetail.partyEventActivity,
          );

          //get party desc only if it is a party
          final String firstPersonEventDesc =
              GetFirstPersonPartyDescription.execute(
            eventMainPersonGender: eventMainPerson.gender,
          );

          //get gift reaction only if it was a party
          final String firstPersonGiftReaction =
              GetFirstPersonGiftReaction.execute(
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

        //log in journal
        await _journalUsecases.addToJournalUsecase.execute(
          gameID: event.gameId,
          day: event.eventDay,
          mainPlayerID: mainPlayerID,
          entry: "${eventText.journalEntry}\n$firstPersonSecondPart",
        );

        //mark as performed
        await _eventRepository.updateEvent(
          event.copyWith(
            performed: true,
          ),
        );

        //show result dialog
        return ResultDialog.show(
          context: context,
          title: eventText.resultTitle,
          result: "${eventText.resultDescription}\n$secondPersonSecondPart",
        );
      }
    }
  }
}
