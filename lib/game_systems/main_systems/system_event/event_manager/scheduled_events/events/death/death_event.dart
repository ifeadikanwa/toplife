import 'package:toplife/core/dialogs/dialog_handler.dart';
import 'package:toplife/core/utils/date_and_time/get_clock_time.dart';
import 'package:toplife/game_systems/game_manager/action_runner/action_runner.dart';
import 'package:toplife/game_systems/game_manager/action_runner/info_models/action_detail.dart';
import 'package:toplife/game_systems/game_manager/action_runner/info_models/action_duration.dart';
import 'package:toplife/game_systems/game_manager/action_runner/info_models/action_result.dart';
import 'package:toplife/game_systems/game_manager/action_runner/info_models/game_action.dart';
import 'package:toplife/game_systems/game_manager/domain/model/info_models/person_game_pair.dart';
import 'package:toplife/game_systems/main_systems/system_age/life_stage.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_event/domain/repository/event_repository.dart';
import 'package:toplife/game_systems/main_systems/system_event/event_manager/scheduled_events/events/death/death_descriptions.dart';
import 'package:toplife/game_systems/main_systems/system_event/event_manager/scheduled_events/events/death/family_planned_funeral.dart';
import 'package:toplife/game_systems/main_systems/system_event/event_manager/scheduled_events/events/death/npc_planned_funeral.dart';
import 'package:toplife/game_systems/main_systems/system_event/event_manager/scheduled_events/events/death/player_planned_funeral.dart';
import 'package:toplife/game_systems/main_systems/system_location/countries/country.dart';
import 'package:toplife/game_systems/main_systems/system_location/location_manager.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/vital_status.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_person/util/get_fullname_string.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/relationship_category.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/romantic_relationship_type.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/model/info_models/person_platonic_relationship_type_pair.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/util/check/check_if_platonic_relationship_type_contains_category.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/util/label/get_platonic_and_romantic_relationship_label_from_string.dart.dart';

class DeathEvent {
  final EventRepository _eventRepository;
  final PersonUsecases _personUsecases;
  final RelationshipUsecases _relationshipUsecases;
  final AgeUsecases _ageUsecases;
  final ActionRunner _actionRunner;
  final PlayerPlannedFuneral _playerPlannedFuneral;
  final FamilyPlannedFuneral _familyPlannedFuneral;
  final NpcPlannedFuneral _npcPlannedFuneral;

  const DeathEvent(
    this._eventRepository,
    this._personUsecases,
    this._relationshipUsecases,
    this._ageUsecases,
    this._actionRunner,
    this._playerPlannedFuneral,
    this._familyPlannedFuneral,
    this._npcPlannedFuneral,
  );

  static const resultTitle = "Funeral Arrangements";

  Future<void> perform({required Event event}) async {
    //event main person
    final Person? eventMainPerson =
        await _personUsecases.getPersonUsecase.execute(
      personID: event.mainPersonId,
    );

    if (eventMainPerson != null) {
      //Action detail
      final ActionDetail actionDetail = ActionDetail(
        actionDuration: ActionDuration.none(),
        gameAction: ExecutiveAction(
          action: (currentGameAndPlayer, dialogHandler) => _execute(
            deathEvent: event,
            deadPerson: eventMainPerson,
            currentPlayerAndGame: currentGameAndPlayer,
            dialogHandler: dialogHandler,
          ),
        ),
      );

      return _actionRunner.performNoTravelAction(
        actionDetail: actionDetail,
      );
    }
  }

  Future<ActionResult> _execute({
    required Event deathEvent,
    required Person deadPerson,
    required PersonGamePair currentPlayerAndGame,
    required DialogHandler dialogHandler,
  }) async {
    final Person currentPlayer = currentPlayerAndGame.person;

    //if the player isn't the dead person
    if (currentPlayer.id != deadPerson.id) {
      //--Things we need to do involving the dead person whether the have a relationship with the player or not:

      //clean up from the event queue
      npcEventCleanup(
        deadPersonID: deathEvent.mainPersonId,
        gameID: deathEvent.gameId,
      );

      //Before ending all romantic relationships we need to know if the dead person has a spouse
      final deadPersonSpouse = await _relationshipUsecases
          .getMarriagePartnerRelationshipUsecase
          .execute(personID: deadPerson.id);

      final bool deadPersonDoesNotHaveASpouse = deadPersonSpouse == null;

      //end all active romantic relationship dead person has
      await _relationshipUsecases.endAllActiveRomanticRelationshipsUsecase
          .execute(
        mainPersonId: deathEvent.mainPersonId,
        currentDay: deathEvent.eventDay,
      );

      //get relationship
      final Relationship? relationship =
          await _relationshipUsecases.getRelationshipUsecase.execute(
        firstPersonID: currentPlayer.id,
        secondPersonID: deathEvent.mainPersonId,
      );

      //get cause of death
      final String deathCause = DeathDescriptions.getRandomDeathCause(
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

      //update as dead
      await _personUsecases.updatePersonUsecase.execute(
        person: deadPerson.copyWith(
          dead: true,
        ),
      );

      //--Things we need to do only if dead person has a relationship with the player:
      if (relationship != null) {
        //reduce player wellbeing
        await reducePlayerMoodForMourning(
          mainPlayerID: currentPlayer.id,
          relationship: relationship,
        );

        //get relationship label and event description
        final String relationshipLabel =
            getPlatonicAndRomanticRelationshipLabelFromString(
          genderString: deadPerson.gender,
          platonicRelationshipTypeString: relationship.platonicRelationshipType,
          romanticRelationshipTypeString: relationship.romanticRelationshipType,
          previousFamilialRelationshipString:
              relationship.previousFamilialRelationship,
          isCoParent: relationship.isCoParent,
          activeRomance: relationship.activeRomance,
        );

        final String firstPersonEventDesc =
            "My $relationshipLabel, ${getFullNameString(firstName: deadPerson.firstName, lastName: deadPerson.lastName)} has died. $deathCause.";

        //convert relationship to grave
        await _relationshipUsecases.convertRelationshipToGraveUsecase.execute(
          playerPersonID: currentPlayer.id,
          otherPersonID: deadPerson.id,
          otherPersonGenderString: deadPerson.gender,
        );

        //run the planned funeral
        return runPlannedFuneral(
          deathEvent,
          currentPlayer,
          deadPerson,
          relationship,
          deadPersonDoesNotHaveASpouse,
          firstPersonEventDesc,
          dialogHandler,
        );
      }
    }

    //if dead person is the player or there is no valid relationship
    //return success with no values
    return ActionResult.successWithNoReportJournalEntryOrDuration();
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
    //What if reduce the mood based on their relationship level with the player:
    //the death of someone you had a positive relationship with will hurt you
    //the death of someone you had a negative relationship with will give you a small mood boost

    late final double moodChange;

    //check if the relationship level is negative
    if (relationship.level.isNegative) {
      //positive mood change
      //1/4 of relationship level -> the highest possible change is +25
      moodChange = relationship.level.abs() * (1 / 4);
    }

    //if relationship is positive
    else {
      //negative mood change
      //3/4 of relationship level -> the highest possible change is -75
      moodChange = -(relationship.level.abs() * (3 / 4));
    }

    //apply mood change
    await _personUsecases.updateMoodStatsUsecase.execute(
      mainPersonID: mainPlayerID,
      change: moodChange.round(),
      override: false,
    );
  }

  //choose what funeral plan and run it
  Future<ActionResult> runPlannedFuneral(
    Event deathEvent,
    Person currentPlayer,
    Person deadPerson,
    Relationship relationship,
    bool deadPersonDoesNotHaveASpouse,
    String firstPersonEventDesc,
    DialogHandler dialogHandler,
  ) async {
    //get main player country
    final Country playerCountry = LocationManager.getCountryClass(
      countryName: currentPlayer.currentCountry,
    );

    //put the funeral runners in declarations for ease of use
    familyPlannedFuneralFunction() => _familyPlannedFuneral.run(
          mainPlayerID: currentPlayer.id,
          deathEvent: deathEvent,
          firstPersonEventDescription: firstPersonEventDesc,
          deadPerson: deadPerson,
          playerCountry: playerCountry,
          dialogHandler: dialogHandler,
        );
    playerPlannedFuneralFunction() => _playerPlannedFuneral.run(
          mainPlayerID: currentPlayer.id,
          deathEvent: deathEvent,
          firstPersonEventDescription: firstPersonEventDesc,
          playerCountry: playerCountry,
          dialogHandler: dialogHandler,
        );
    npcPlannedFuneralFunction() => _npcPlannedFuneral.run(
          mainPlayerID: currentPlayer.id,
          deathEvent: deathEvent,
          firstPersonEventDescription: firstPersonEventDesc,
          dialogHandler: dialogHandler,
        );

    //check if the dead person has a spouse

    //
    //
    //
    //note: if player is baby - teen. all funerals are npc planned

    //if the main player is young adult and above
    if (_ageUsecases.checkIfPersonIsAtLeastThisAgeUsecase.execute(
      currentDay: deathEvent.eventDay,
      dayOfBirth: currentPlayer.dayOfBirth,
      age: LifeStage.youngAdult,
    )) {
      //
      //dead person = parent
      if (checkIfPlatonicRelationshipTypeStringContainsCategory(
        relationship.platonicRelationshipType,
        RelationshipCategory.parent,
      )) {
        //check if the parent has living children
        final List<PersonPlatonicRelationshipTypePair> livingChildren =
            await _relationshipUsecases.getChildrenThroughDeductionUsecase
                .execute(
          personID: deadPerson.id,
          includeOnly: VitalStatus.living,
        );

        //we assume that if there is just one then it is th player, but if there is more than one there are others
        final bool parentHasMoreThanOneLivingChild = livingChildren.length > 1;

        //if the parent has no immediate family except the player (no living children and no spouse) - the player has to plan the funeral
        if (!parentHasMoreThanOneLivingChild && deadPersonDoesNotHaveASpouse) {
          return playerPlannedFuneralFunction();
        }
        //the family plans it
        else {
          return familyPlannedFuneralFunction();
        }
      }

      //
      //dead person = player spouse
      else if (relationship.activeRomance &&
          relationship.romanticRelationshipType ==
              RomanticRelationshipType.married.name) {
        return playerPlannedFuneralFunction();
      }

      //
      //dead person = player child
      //
      //if the child is unmarried -> player planned (this will automatically include minors since they cant marry)
      //if child is married -> npc planned (below)
      else if (checkIfPlatonicRelationshipTypeStringContainsCategory(
            relationship.platonicRelationshipType,
            RelationshipCategory.child,
          ) &&
          (deadPersonDoesNotHaveASpouse)) {
        return playerPlannedFuneralFunction();
      }
    }

    //if you get here: the player is a minor or the npc does not have one of the special case relationships above
    return npcPlannedFuneralFunction();
  }

  //helper function all the planned funeral usecases use
  static String getFirstPersonFuneralArrangementString({
    required int funeralDay,
    required int? startTime,
  }) {
    return "I am invited to the funeral event on Day $funeralDay at ${getClockTime(timeInMinutes: startTime ?? 0)}.";
  }
}
