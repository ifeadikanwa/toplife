//the called dialogs already check for context mount status
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:toplife/core/utils/date_and_time/get_clock_time.dart';
import 'package:toplife/main_systems/system_age/life_stage.dart';
import 'package:toplife/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/main_systems/system_event/domain/repository/event_repository.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_scheduler/event_schedulers.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/death/death_descriptions.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/death/family_planned_funeral.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/death/npc_planned_funeral.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/death/player_planned_funeral.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_location/countries/country.dart';
import 'package:toplife/main_systems/system_location/location_manager.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_person/util/get_fullname_string.dart';
import 'package:toplife/main_systems/system_relationship/constants/relationship_category.dart';
import 'package:toplife/main_systems/system_relationship/constants/romantic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';
import 'package:toplife/main_systems/system_relationship/util/check_if_platonic_relationship_type_contains_category.dart';
import 'package:toplife/main_systems/system_relationship/util/get_platonic_and_romantic_relationship_label_from_string.dart.dart';

class DeathEvent {
  final EventRepository _eventRepository;
  final PersonUsecases _personUsecases;
  final RelationshipUsecases _relationshipUsecases;
  final EventSchedulers _eventScheduler;
  final JournalUsecases _journalUsecases;
  final AgeUsecases _ageUsecases;

  const DeathEvent(
    this._eventRepository,
    this._personUsecases,
    this._relationshipUsecases,
    this._eventScheduler,
    this._journalUsecases,
    this._ageUsecases,
  );

  static const resultTitle = "Funeral Arrangements";

  Future<void> execute({
    required BuildContext context,
    required Event deathEvent,
    required int mainPlayerID,
    String? causeOfDeath,
  }) async {
    //if the player isnt the dead person
    if (mainPlayerID != deathEvent.mainPersonId) {
      //clean up from the event queue
      npcEventCleanup(
        deadPersonID: deathEvent.mainPersonId,
        gameID: deathEvent.gameId,
      );

      //end all active romantic relationship deadperson has
      await _relationshipUsecases.endAllActiveRomanticRelationshipsUsecase
          .execute(
        mainPersonId: deathEvent.mainPersonId,
        currentDay: deathEvent.eventDay,
      );

      //get people involved
      final Person? mainPlayerPerson =
          await _personUsecases.getPersonUsecase.execute(
        personID: mainPlayerID,
      );

      //get the dead person
      final Person? deadPerson = await _personUsecases.getPersonUsecase
          .execute(personID: deathEvent.mainPersonId);

      final Relationship? relationship =
          await _relationshipUsecases.getRelationshipUsecase.execute(
        firstPersonID: mainPlayerID,
        secondPersonID: deathEvent.mainPersonId,
      );

      //Things we need to do as long as the dead person is a valid person (whether the have a relationship with th player or not)
      if (deadPerson != null) {
        //get cause of death
        final String deathCause = causeOfDeath ??
            DeathDescriptions.getRandomDeathCause(
              deadPerson.gender,
            );

        //create a death record
        await _personUsecases.createOrUpdateDeathRecordUsecase.execute(
          deathRecord: DeathRecord(
            gameId: deathEvent.gameId,
            personId: deathEvent.mainPersonId,
            dayOfDeath: deathEvent.eventDay,
            state: deadPerson.currentState,
            country: deadPerson.currentCountry,
            causeOfDeath: deathCause,
          ),
        );

        //if all people involved are valid and relationship exists with the player
        if (mainPlayerPerson != null && relationship != null) {
          //update as dead
          await _personUsecases.updatePersonUsecase.execute(
            person: deadPerson.copyWith(
              dead: true,
            ),
          );

          //reduce player wellbeing
          await reducePlayerMoodForMourning(
            mainPlayerID: mainPlayerID,
            relationship: relationship,
          );

          //get relationship label and event description
          final String relationshipLabel =
              getPlatonicAndRomanticRelationshipLabelFromString(
            genderString: deadPerson.gender,
            platonicRelationshipTypeString:
                relationship.platonicRelationshipType,
            romanticRelationshipTypeString:
                relationship.romanticRelationshipType,
            previousFamilialRelationshipString:
                relationship.previousFamilialRelationship,
            isCoParent: relationship.isCoParent,
            activeRomance: relationship.activeRomance,
          );

          final String firstPersonEventDesc =
              "My $relationshipLabel, ${getFullNameString(firstName: deadPerson.firstName, lastName: deadPerson.lastName)} has died. $deathCause.";

          //run the planned funeral
          await runPlannedFuneral(
            context,
            deathEvent,
            mainPlayerPerson,
            deadPerson,
            relationship,
            firstPersonEventDesc,
          );

          //create death record
          await _personUsecases.createOrUpdateDeathRecordUsecase.execute(
            deathRecord: DeathRecord(
              gameId: deathEvent.gameId,
              personId: deadPerson.id,
              dayOfDeath: deathEvent.eventDay,
              state: deadPerson.currentState,
              country: deadPerson.currentCountry,
              causeOfDeath: deathCause,
            ),
          );

          //convert relationship to grave
          await _relationshipUsecases.convertRelationshipToGraveUsecase.execute(
            playerPersonID: mainPlayerPerson.id,
            otherPersonID: deadPerson.id,
            otherPersonGenderString: deadPerson.gender,
          );
        }
      }
    }
  }

  Future<void> npcEventCleanup({
    required int deadPersonID,
    required int gameID,
  }) async {
    //delete all events involving this npc character from the event table
    //make sure it is not the main player

    await _eventRepository.deleteAllEventsInvolvingAPerson(
      personID: deadPersonID,
      gameID: gameID,
    );
  }

  Future<void> reducePlayerMoodForMourning({
    required int mainPlayerID,
    required Relationship relationship,
  }) async {
    //parent
    if (checkIfPlatonicRelationshipTypeStringContainsCategory(
      relationship.platonicRelationshipType,
      RelationshipCategory.parent,
    )) {
      await _personUsecases.updateMoodStatsUsecase.execute(
        mainPersonID: mainPlayerID,
        change: -70,
        override: false,
      );
    }
    //child
    else if (checkIfPlatonicRelationshipTypeStringContainsCategory(
      relationship.platonicRelationshipType,
      RelationshipCategory.child,
    )) {
      await _personUsecases.updateMoodStatsUsecase.execute(
        mainPersonID: mainPlayerID,
        change: -80,
        override: false,
      );
    }
    //partner
    else if (relationship.activeRomance) {
      await _personUsecases.updateMoodStatsUsecase.execute(
        mainPersonID: mainPlayerID,
        change: -60,
        override: false,
      );
    }
    //others
    else {
      await _personUsecases.updateMoodStatsUsecase.execute(
        mainPersonID: mainPlayerID,
        change: -30,
        override: false,
      );
    }
  }

  Future<void> runPlannedFuneral(
    BuildContext context,
    Event deathEvent,
    Person mainPlayerPerson,
    Person deadPerson,
    Relationship relationship,
    String firstPersonEventDesc,
  ) async {
    //get main player country
    final Country playerCountry = LocationManager.getCountryClass(
      countryName: mainPlayerPerson.currentCountry,
    );

    //instantiate all funeral types
    final PlayerPlannedFuneral playerPlannedFuneral = PlayerPlannedFuneral(
      _personUsecases,
      _eventScheduler,
      _journalUsecases,
    );
    final FamilyPlannedFuneral familyPlannedFuneral = FamilyPlannedFuneral(
      _personUsecases,
      _relationshipUsecases,
      _eventScheduler,
      _journalUsecases,
    );
    final NpcPlannedFuneral npcPlannedFuneral = NpcPlannedFuneral(
      _eventScheduler,
      _journalUsecases,
    );

    //if player is baby - teen. all funerals are npc planned

    //if the main player is young adult and above
    if (_ageUsecases.checkIfPersonIsAtLeastThisAgeUsecase.execute(
      currentDay: deathEvent.eventDay,
      dayOfBirth: mainPlayerPerson.dayOfBirth,
      age: LifeStage.youngAdult,
    )) {
      //parent
      if (checkIfPlatonicRelationshipTypeStringContainsCategory(
        relationship.platonicRelationshipType,
        RelationshipCategory.parent,
      )) {
        await familyPlannedFuneral.run(
          context: context,
          mainPlayerID: mainPlayerPerson.id,
          deathEvent: deathEvent,
          firstPersonEventDescription: firstPersonEventDesc,
          deadPerson: deadPerson,
          playerCountry: playerCountry,
        );
      }
      //spouse
      else if (relationship.activeRomance &&
          relationship.romanticRelationshipType ==
              RomanticRelationshipType.married.name) {
        await playerPlannedFuneral.run(
          context: context,
          mainPlayerID: mainPlayerPerson.id,
          deathEvent: deathEvent,
          firstPersonEventDescription: firstPersonEventDesc,
          playerCountry: playerCountry,
        );
      }

      //child
      //if child is married -> npc planned
      //if the child is unmarried -> player planned (this will automatically include minors since they cant marry)
      else if (checkIfPlatonicRelationshipTypeStringContainsCategory(
            relationship.platonicRelationshipType,
            RelationshipCategory.child,
          ) &&
          (await _relationshipUsecases.getMarriagePartnerRelationshipUsecase
                  .execute(
                personID: deadPerson.id,
              )) ==
              null) {
        await playerPlannedFuneral.run(
          context: context,
          mainPlayerID: mainPlayerPerson.id,
          deathEvent: deathEvent,
          firstPersonEventDescription: firstPersonEventDesc,
          playerCountry: playerCountry,
        );
      }
      //any other relationship type
      else {
        await npcPlannedFuneral.run(
          context: context,
          mainPlayerID: mainPlayerPerson.id,
          deathEvent: deathEvent,
          firstPersonEventDescription: firstPersonEventDesc,
        );
      }
    }
    //player is younger than young adult
    else {
      await npcPlannedFuneral.run(
        context: context,
        mainPlayerID: mainPlayerPerson.id,
        deathEvent: deathEvent,
        firstPersonEventDescription: firstPersonEventDesc,
      );
    }
  }

  //helper function all the planned funeral usecases use
  static String getFirstPersonFuneralArrangementString({
    required int funeralDay,
    required int? startTime,
  }) {
    return "I am invited to the funeral event on Day $funeralDay at ${getClockTime(timeInMinutes: startTime ?? 0)}.";
  }
}
