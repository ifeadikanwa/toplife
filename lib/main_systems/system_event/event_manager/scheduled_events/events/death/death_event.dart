//the called dialogs already check for context mount status
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:toplife/main_systems/system_age/age.dart';
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
import 'package:toplife/main_systems/system_relationship/constants/partner_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';
import 'package:toplife/main_systems/system_relationship/util/get_relationship_label_from_any_relationship_pair.dart';

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
    if (mainPlayerID != deathEvent.mainPersonId) {
      //clean up from the event queue
      npcEventCleanup(
        deadPersonID: deathEvent.mainPersonId,
        gameID: deathEvent.gameId,
      );

      //get people involved
      final Person? mainPlayerPerson =
          await _personUsecases.getPersonUsecase.execute(
        personID: mainPlayerID,
      );

      final RelationshipPair? relationshipPair = await _relationshipUsecases
          .getRelationshipPairBasedOnTypeUsecase
          .execute(
        personUsecases: _personUsecases,
        mainPersonID: mainPlayerID,
        relationshipPersonID: deathEvent.mainPersonId,
        informalRelationshipType: deathEvent.relationshipToMainPlayer,
      );

      //if all people involved are valid
      if (mainPlayerPerson != null && relationshipPair != null) {
        final Person deadPerson = relationshipPair.person;

        //update as dead
        await _personUsecases.updatePersonUsecase.execute(
          person: deadPerson.copyWith(
            dead: true,
          ),
        );

        //reduce player wellbeing
        await reducePlayerMoodForMourning(
          mainPlayerID: mainPlayerID,
          relationshipPair: relationshipPair,
        );

        //get relationship label and event description
        final String relationshipLabel =
            getRelationshipLabelFromAnyRelationshipPair(
          relationshipPair: relationshipPair,
          onlyActivePartnerWanted: false,
        );

        final String deathCause = causeOfDeath ??
            DeathDescriptions.getRandomDeathCause(
              deadPerson.gender,
            );

        final String firstPersonEventDesc =
            "My $relationshipLabel, ${deadPerson.firstName} has died. $deathCause.";

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
        final mainPlayerDaysLived = _ageUsecases.getDaysLivedUsecase.execute(
          dayOfBirth: mainPlayerPerson.dayOfBirth,
          currentDay: deathEvent.eventDay,
        );

        if (mainPlayerDaysLived < Age.newYoungAdultDaysLived) {
          await npcPlannedFuneral.run(
            context: context,
            mainPlayerID: mainPlayerID,
            deathEvent: deathEvent,
            firstPersonEventDescription: firstPersonEventDesc,
          );
        }
        //if the main player is young adult and above
        else {
          //parent
          if (relationshipPair.relationship is Parent) {
            await familyPlannedFuneral.run(
              context: context,
              mainPlayerID: mainPlayerID,
              deathEvent: deathEvent,
              firstPersonEventDescription: firstPersonEventDesc,
              deadPerson: deadPerson,
              playerCountry: playerCountry,
            );
          }
          //partner
          else if (relationshipPair.relationship is Partner) {
            final Partner partner = relationshipPair.relationship as Partner;

            if (partner.isActive &&
                partner.partnerRelationshipType ==
                    PartnerRelationshipType.married.name) {
              await playerPlannedFuneral.run(
                context: context,
                mainPlayerID: mainPlayerID,
                deathEvent: deathEvent,
                firstPersonEventDescription: firstPersonEventDesc,
                playerCountry: playerCountry,
              );
            } else {
              await npcPlannedFuneral.run(
                context: context,
                mainPlayerID: mainPlayerID,
                deathEvent: deathEvent,
                firstPersonEventDescription: firstPersonEventDesc,
              );
            }
          }
          //child
          else if (relationshipPair.relationship is Child) {
            //if child is baby - teen or ya> with no spouse
            final int childDaysLived = _ageUsecases.getDaysLivedUsecase.execute(
              dayOfBirth: deadPerson.dayOfBirth,
              currentDay: deathEvent.eventDay,
            );

            final childPartner =
                await _relationshipUsecases.getCurrentPartnerUsecase.execute(
              deadPerson.id,
            );

            final bool childIsAMinor =
                childDaysLived < Age.newYoungAdultDaysLived;

            final bool childIsAnAdultWithNoSpouse =
                childDaysLived > Age.newYoungAdultDaysLived &&
                    (childPartner == null ||
                        childPartner.partnerRelationshipType !=
                            PartnerRelationshipType.married.name);

            if (childIsAMinor || childIsAnAdultWithNoSpouse) {
              await playerPlannedFuneral.run(
                context: context,
                mainPlayerID: mainPlayerID,
                deathEvent: deathEvent,
                firstPersonEventDescription: firstPersonEventDesc,
                playerCountry: playerCountry,
              );
            } else {
              await npcPlannedFuneral.run(
                context: context,
                mainPlayerID: mainPlayerID,
                deathEvent: deathEvent,
                firstPersonEventDescription: firstPersonEventDesc,
              );
            }
          }
          //any other relationship type
          else {
            await npcPlannedFuneral.run(
              context: context,
              mainPlayerID: mainPlayerID,
              deathEvent: deathEvent,
              firstPersonEventDescription: firstPersonEventDesc,
            );
          }
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
    required RelationshipPair relationshipPair,
  }) async {
    //parent
    if (relationshipPair.relationship is Parent) {
      await _personUsecases.updateMoodStatsUsecase.execute(
        mainPersonID: mainPlayerID,
        change: -60,
        override: false,
      );
    }
    //child
    else if (relationshipPair.relationship is Child) {
      await _personUsecases.updateMoodStatsUsecase.execute(
        mainPersonID: mainPlayerID,
        change: -70,
        override: false,
      );
    }
    //partner
    else if (relationshipPair.relationship is Partner) {
      final Partner partner = relationshipPair.relationship as Partner;

      if (partner.isActive) {
        await _personUsecases.updateMoodStatsUsecase.execute(
          mainPersonID: mainPlayerID,
          change: -60,
          override: false,
        );
      } else {
        await _personUsecases.updateMoodStatsUsecase.execute(
          mainPersonID: mainPlayerID,
          change: -30,
          override: false,
        );
      }
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
}
