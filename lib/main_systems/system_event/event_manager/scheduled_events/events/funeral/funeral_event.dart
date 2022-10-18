import 'dart:math';

import 'package:flutter/material.dart';
import 'package:toplife/core/dialogs/custom_dialogs/attend_event_dialog/attend_regular_event_dialog.dart';
import 'package:toplife/core/dialogs/result_dialog.dart';
import 'package:toplife/core/utils/chance.dart';
import 'package:toplife/core/utils/words/sentence_util.dart';
import 'package:toplife/main_systems/system_event/constants/event_stay_duration.dart';
import 'package:toplife/main_systems/system_event/domain/model/event.dart';
import 'package:toplife/main_systems/system_event/domain/repository/event_repository.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/funeral/funeral_descriptions.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/util/event_util.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/util/standard_event_sentences.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/partner.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';
import 'package:toplife/main_systems/system_relationship/util/get_active_partner_label.dart';
import 'package:toplife/main_systems/system_relationship/util/get_relationship_label.dart';

class FuneralEvent {
  final EventRepository _eventRepository;
  final PersonUsecases _personUsecases;
  final RelationshipUsecases _relationshipUsecases;
  final JournalUsecases _journalUsecases;

  const FuneralEvent(
    this._eventRepository,
    this._personUsecases,
    this._relationshipUsecases,
    this._journalUsecases,
  );

  static const resultTitle = "R.I.P";

  Future<void> execute({
    required BuildContext context,
    required Event funeralEvent,
    required int mainPlayerID,
  }) async {
    final relationshipPair = await _relationshipUsecases
        .getRelationshipPairBasedOnTypeUsecase
        .execute(
      personUsecases: _personUsecases,
      mainPersonID: mainPlayerID,
      relationshipPersonID: funeralEvent.mainPersonID,
      informalRelationshipType: funeralEvent.relationshipToMainPlayer,
    );

    final Person? mainPlayerPerson =
        await _personUsecases.getPersonUsecase.execute(
      personID: mainPlayerID,
    );

    if (relationshipPair != null && mainPlayerPerson != null) {
      final Person deadPerson = relationshipPair.person as Person;

      final playerCanAttendFuneral = EventUtil.checkIfPlayerCanAttendEvent(
        mainPlayerPerson: mainPlayerPerson,
        eventMainPerson: deadPerson,
      );

      if (playerCanAttendFuneral) {
        final relationshipLabel = getRelationshipLabel(
          relationshipPair: relationshipPair,
          onlyActivePartnerWanted: false,
        );

        final secondPersonEventDesc =
            "Your $relationshipLabel, ${deadPerson.firstName}'s funeral is happening right now.";

        final Partner? currentPartner = await _relationshipUsecases
            .getCurrentPartnerUsecase
            .execute(mainPlayerID);

        AttendRegularEventDialog.show(
          context: context,
          eventTitle: "Funeral",
          eventDescription: secondPersonEventDesc,
          hasActivePartner: (currentPartner != null),
          mainPlayerID: mainPlayerID,
          event: funeralEvent,
          eventMainPerson: deadPerson,
          relationshipLabel: relationshipLabel,
          attendAlone: attendFuneralAlone,
          attendWithPartner: attendFuneralWithPartner,
        );
      } else {
        ResultDialog.show(
          context: context,
          title: StandardEventSentences.playerCantAttendTitle,
          result: StandardEventSentences.getPlayerCantAttendDescription(
            playerCountry: mainPlayerPerson.country,
            eventMainPersonCountry: deadPerson.country,
          ),
        );
      }
    }
  }

  Future<void> attendFuneralAlone({
    required BuildContext context,
    required Event event,
    required int mainPlayerID,
    required Person eventMainPerson,
    required String relationshipLabel,
    required EventStayDuration eventStayDuration,
  }) async {
    //get player travel time: gets the player travel time based on their current settlement and transportation. (in shop and storage?)
    // ignore: todo
    //TODO: move forward in time:
    //a usecase in game that gets the player travel time and uses that to determine the new time after an event has been performed. it takes in the end time of the event and how long the player wants to stay and updates the game time in the usecase.

    //get funeral desc
    final firstPersonFuneralDesc =
        FuneralDescriptions.getRandomFirstPersonFuneralDescription(
      eventMainPerson.gender,
    );

    final journalEntry =
        "I attended my $relationshipLabel, ${eventMainPerson.firstName}'s funeral.\n$firstPersonFuneralDesc";

    final secondPersonResultDesc =
        SentenceUtil.convertFromFirstPersonToSecondPerson(
      firstPersonSentence: firstPersonFuneralDesc,
    );

    attendFuneral(
      context: context,
      funeralEvent: event,
      deadPerson: eventMainPerson,
      mainPlayerID: mainPlayerID,
      journalEntry: journalEntry,
      secondPersonResultDesc: secondPersonResultDesc,
    );
  }

  Future<void> attendFuneralWithPartner({
    required BuildContext context,
    required Event event,
    required int mainPlayerID,
    required Person eventMainPerson,
    required String relationshipLabel,
    required EventStayDuration eventStayDuration,
  }) async {
    // get player travel time: gets the player travel time based on their current settlement and transportation. (in shop and storage?)
    // ignore: todo
    //TODO: move forward in time:
    //a usecase in game that gets the player travel time and uses that to determine the new time after an event has been performed. it takes in the end time of the event and how long the player wants to stay and updates the game time in the usecase.

    final Partner? currentPartner = await _relationshipUsecases
        .getCurrentPartnerUsecase
        .execute(mainPlayerID);

    if (currentPartner != null) {
      final Person? partnerPerson =
          await _personUsecases.getPersonUsecase.execute(
        personID: currentPartner.partnerID,
      );

      if (partnerPerson != null) {
        final partnerRelationshipLabel = getActivePartnerLabel(
          partnerPerson.gender,
          currentPartner.partnerRelationshipType,
        );

        final bool partnerAgreedToCome =
            Chance.getTrueOrFalseBasedOnPercentageChance(
          trueChancePercentage: 70,
        );

        final int currentRelationship = currentPartner.relationship;

        late final String firstPersonPartnerAttendanceDesc;

        if (partnerAgreedToCome) {
          firstPersonPartnerAttendanceDesc =
              "My $partnerRelationshipLabel, ${partnerPerson.firstName} agreed to accompany me.";

          _relationshipUsecases.updatePartnerRelationshipUsecase.execute(
            currentPartner.copyWith(
              relationship: currentRelationship + Random().nextInt(15),
            ),
          );
        } else {
          firstPersonPartnerAttendanceDesc =
              "My $partnerRelationshipLabel, ${partnerPerson.firstName} didn't come with me to the funeral, ${FuneralDescriptions.getRandomFirstPersonPartnerExcuse(partnerPerson.gender)}";

          _relationshipUsecases.updatePartnerRelationshipUsecase.execute(
            currentPartner.copyWith(
              relationship: currentRelationship - Random().nextInt(15),
            ),
          );
        }

        //get funeral desc
        final firstPersonFuneralDesc =
            FuneralDescriptions.getRandomFirstPersonFuneralDescription(
          eventMainPerson.gender,
        );

        final journalEntry =
            "I attended my $relationshipLabel, ${eventMainPerson.firstName}'s funeral. $firstPersonPartnerAttendanceDesc\n$firstPersonFuneralDesc";

        final secondPersonResultDesc =
            "${SentenceUtil.convertFromFirstPersonToSecondPerson(
          firstPersonSentence: firstPersonPartnerAttendanceDesc,
        )}\n${SentenceUtil.convertFromFirstPersonToSecondPerson(
          firstPersonSentence: firstPersonFuneralDesc,
        )}";

        attendFuneral(
          context: context,
          funeralEvent: event,
          deadPerson: eventMainPerson,
          mainPlayerID: mainPlayerID,
          journalEntry: journalEntry,
          secondPersonResultDesc: secondPersonResultDesc,
        );
      }
    }
  }

  Future<void> attendFuneral({
    required BuildContext context,
    required Event funeralEvent,
    required Person deadPerson,
    required int mainPlayerID,
    required String journalEntry,
    required String secondPersonResultDesc,
  }) async {
    //increase wellbeing
    _personUsecases.updateWellbeingStatsUsecase.execute(
      mainPersonID: mainPlayerID,
      change: Random().nextInt(10) + 20, //10-30
    );

    //log in journal
    _journalUsecases.addToJournalUsecase.execute(
      gameID: funeralEvent.gameID,
      day: funeralEvent.eventDay,
      mainPlayerID: mainPlayerID,
      entry: journalEntry,
    );

    //mark as performed
    _eventRepository.updateEvent(
      funeralEvent.copyWith(
        performed: true,
      ),
    );

    //show result dialog

    ResultDialog.show(
      context: context,
      title: resultTitle,
      result: secondPersonResultDesc,
    );
  }
}
