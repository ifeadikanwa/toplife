//check if the main player is in the same country as the birthday celebrant.
//if they are in different countries the player cannot attend the event because of Location//comunicate that to them
//if they are in the same country then run they can attend

//the called dialogs already check for context mount status
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:toplife/core/dialogs/custom_dialogs/attend_event_dialog/attend_party_event/attend_party_event_dialog.dart';
import 'package:toplife/core/dialogs/result_dialog.dart';
import 'package:toplife/core/utils/words/sentence_util.dart';
import 'package:toplife/main_systems/system_age/age.dart';
import 'package:toplife/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/main_systems/system_event/constants/event_stay_duration.dart';
import 'package:toplife/main_systems/system_event/constants/party_event_activity.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/attend_party/attend_party.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/attend_party/get_first_person_party_partner_attendance_description.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/attend_party/get_first_person_gift_reaction.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/attend_party/get_first_person_party_description.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/attend_party/perform_party_activity.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/util/event_util.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/util/standard_event_sentences.dart';
import 'package:toplife/main_systems/system_location/location_manager.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';
import 'package:toplife/main_systems/system_relationship/util/get_relationship_label.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/info_models/storeroom_item_pair.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';

class BirthdayPartyEvent {
  final PersonUsecases _personUsecases;
  final RelationshipUsecases _relationshipUsecases;
  final ShopAndStorageUsecases _shopAndStorageUsecases;
  final AgeUsecases _ageUsecases;
  final PerformPartyActivity _performPartyActivity;
  final AttendParty _attendParty;
  final GetFirstPersonPartyPartnerAttendanceDescription
      _getFirstPersonPartyPartnerAttendanceDescription;

  const BirthdayPartyEvent(
    this._personUsecases,
    this._relationshipUsecases,
    this._shopAndStorageUsecases,
    this._ageUsecases,
    this._performPartyActivity,
    this._attendParty,
    this._getFirstPersonPartyPartnerAttendanceDescription,
  );
  static const resultTitle = "Party time!";

  Future<void> execute({
    required BuildContext context,
    required Event birthdayEvent,
    required int mainPlayerID,
  }) async {
    //check if player can attend event

    //show dialog that takes in how long the player wants to stay(1 hr, 2 hrs, till end),
    //optional(you have to signify if you don't want it) -> gifts player wants to give, money slider for if player wants to gift cash,

    //player response triggers another function that takes it in response and creates event result pop up

    final relationshipPair = await _relationshipUsecases
        .getRelationshipPairBasedOnTypeUsecase
        .execute(
      personUsecases: _personUsecases,
      mainPersonID: mainPlayerID,
      relationshipPersonID: birthdayEvent.mainPersonId,
      informalRelationshipType: birthdayEvent.relationshipToMainPlayer,
    );

    final Person? mainPlayerPerson =
        await _personUsecases.getPersonUsecase.execute(
      personID: mainPlayerID,
    );

    if (relationshipPair != null && mainPlayerPerson != null) {
      final Person birthdayPerson = relationshipPair.person;

      bool playerCanAttendBirthdayPerty = EventUtil.checkIfPlayerCanAttendEvent(
        mainPlayerPerson: mainPlayerPerson,
        eventMainPerson: birthdayPerson,
      );

      if (playerCanAttendBirthdayPerty) {
        //get event title and description
        final relationshipLabel = getRelationshipLabel(
          relationshipPair: relationshipPair,
          onlyActivePartnerWanted: false,
        );

        final String secondPersonEventDesc =
            "Your $relationshipLabel, ${birthdayPerson.firstName}'s birthday party is happening right now.";

        //check if there is an active partner
        final Partner? currentPartner = await _relationshipUsecases
            .getCurrentPartnerUsecase
            .execute(mainPlayerID);

        //get player currency
        final playerCountry = LocationManager.getCountryClass(
          countryName: mainPlayerPerson.currentCountry,
        );

        //get player money
        final playerMaxMoney =
            await _personUsecases.getPlayerMoneyUsecase.execute(
          relationshipUsecases: _relationshipUsecases,
          mainPlayerID: mainPlayerID,
        );

        //get valid gift options
        final giftOptionsInStorage =
            await _shopAndStorageUsecases.getStoreroomItemPairsUsecase.execute(
          mainPlayerID,
        );

        //Show dialog
        AttendPartyEventDialog.show(
          context: context,
          event: birthdayEvent,
          mainPlayerID: mainPlayerID,
          eventMainPerson: birthdayPerson,
          eventTitle: "Birthday Party",
          secondPersonEventDescription: secondPersonEventDesc,
          relationshipLabel: relationshipLabel,
          hasActivePartner: currentPartner != null,
          currency: playerCountry.currency,
          maxPlayerMoney: playerMaxMoney,
          giftOptionsInStorage: giftOptionsInStorage,
          attendPartyAlone: attendBirthdayPartyAlone,
          attendPartyWithPartner: attendBirthdayWithPartner,
        );
      } else {
        ResultDialog.show(
          context: context,
          title: StandardEventSentences.playerCantAttendTitle,
          result: StandardEventSentences.getPlayerCantAttendDescription(
            playerCountry: mainPlayerPerson.currentCountry,
            eventMainPersonCountry: birthdayPerson.currentCountry,
          ),
        );
      }
    }
  }

  Future<void> attendBirthdayPartyAlone({
    required BuildContext context,
    required Event event,
    required int mainPlayerID,
    required Person eventMainPerson,
    required String relationshipLabel,
    required EventStayDuration chosenEventStayDuration,
    required StoreroomItemPair? chosenGift,
    required double chosenMoneyGiftAmount,
    required PartyEventActivity chosenPartyEventActivity,
  }) async {
    //perform chosen party activity
    final String partyActivityDesc = await _performPartyActivity.execute(
      mainPlayerID: mainPlayerID,
      chosenPartyEventActivity: chosenPartyEventActivity,
    );

    //get desc
    final String firstPersonPartyDesc = GetFirstPersonPartyDescription.execute(
      eventMainPersonGender: eventMainPerson.gender,
    );

    final String firstPersonGiftReaction = GetFirstPersonGiftReaction.execute(
      eventMainPerson: eventMainPerson,
      chosenGift: chosenGift,
      chosenMoneyGiftAmount: chosenMoneyGiftAmount,
    );

    //get age
    final Age birthdayPersonAge = _ageUsecases.getPersonAgeUsecase.execute(
      dayOfBirth: eventMainPerson.dayOfBirth,
      currentDay: event.eventDay,
    );

    //journal entry
    final String journalEntry =
        "I went to my $relationshipLabel, ${eventMainPerson.firstName}'s ${birthdayPersonAge.lifeStage.stageName.toLowerCase()} birthday party.\n$partyActivityDesc\n$firstPersonPartyDesc.\n$firstPersonGiftReaction.";

    //result desc
    final String firstPersonResultDesc =
        "$firstPersonPartyDesc.\n$firstPersonGiftReaction.";

    //attend party
   await _attendParty.execute(
      context: context,
      event: event,
      mainPlayerID: mainPlayerID,
      chosenEventStayDuration: chosenEventStayDuration,
      chosenGift: chosenGift,
      chosenMoneyGiftAmount: chosenMoneyGiftAmount,
      journalEntry: journalEntry,
      resultTitle: resultTitle,
      secondPersonResultDesc: SentenceUtil.convertFromFirstPersonToSecondPerson(
        firstPersonSentence: firstPersonResultDesc,
      ),
    );
  }

  Future<void> attendBirthdayWithPartner({
    required BuildContext context,
    required Event event,
    required int mainPlayerID,
    required Person eventMainPerson,
    required String relationshipLabel,
    required EventStayDuration chosenEventStayDuration,
    required StoreroomItemPair? chosenGift,
    required double chosenMoneyGiftAmount,
    required PartyEventActivity chosenPartyEventActivity,
  }) async {
    final String firstPersonPartnerAttendanceDesc =
        await _getFirstPersonPartyPartnerAttendanceDescription.execute(
      mainPlayerID: mainPlayerID,
    );

    //perform chosen party activity
    final String partyActivityDesc = await _performPartyActivity.execute(
      mainPlayerID: mainPlayerID,
      chosenPartyEventActivity: chosenPartyEventActivity,
    );

    //get desc
    final String firstPersonPartyDesc = GetFirstPersonPartyDescription.execute(
      eventMainPersonGender: eventMainPerson.gender,
    );

    final String firstPersonGiftReaction = GetFirstPersonGiftReaction.execute(
      eventMainPerson: eventMainPerson,
      chosenGift: chosenGift,
      chosenMoneyGiftAmount: chosenMoneyGiftAmount,
    );

    //get age
    final Age birthdayPersonAge = _ageUsecases.getPersonAgeUsecase.execute(
      dayOfBirth: eventMainPerson.dayOfBirth,
      currentDay: event.eventDay,
    );

    //journal entry
    final String journalEntry =
        "I went to my $relationshipLabel, ${eventMainPerson.firstName}'s ${birthdayPersonAge.lifeStage.stageName.toLowerCase()} birthday party. $firstPersonPartnerAttendanceDesc\n$partyActivityDesc\n$firstPersonPartyDesc.\n$firstPersonGiftReaction.";

    //result desc

    final String secondPersonResultDesc =
        "${SentenceUtil.convertFromFirstPersonToSecondPerson(
      firstPersonSentence: firstPersonPartnerAttendanceDesc,
    )}\n${SentenceUtil.convertFromFirstPersonToSecondPerson(
      firstPersonSentence: firstPersonPartyDesc,
    )}\n${SentenceUtil.convertFromFirstPersonToSecondPerson(
      firstPersonSentence: firstPersonGiftReaction,
    )}";

    //attend party
    await _attendParty.execute(
      context: context,
      event: event,
      mainPlayerID: mainPlayerID,
      chosenEventStayDuration: chosenEventStayDuration,
      chosenGift: chosenGift,
      chosenMoneyGiftAmount: chosenMoneyGiftAmount,
      journalEntry: journalEntry,
      resultTitle: resultTitle,
      secondPersonResultDesc: secondPersonResultDesc,
    );
  }
}
