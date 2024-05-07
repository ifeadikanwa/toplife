import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/chance.dart';
import 'package:toplife/game_systems/main_systems/system_age/age.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_person/util/get_fullname_string.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/existing_relationship_override_instruction.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/util/check/check_if_platonic_relationship_type_contains.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/util/get_acquaintance_relationship_from_template.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/util/label/get_platonic_and_romantic_relationship_label_from_string.dart.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/model/info_models/school_precollege_info.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/create/create_state_precollege_school_and_register_person_usecase.dart';

class RegisterNPCAtPrecollegeUsecase {
  final CreateStatePrecollegeSchoolAndRegisterPersonUsecase
      _createStatePrecollegeSchoolAndRegisterPersonUsecase;

  final PersonUsecases _personUsecases;
  final RelationshipUsecases _relationshipUsecases;
  final AgeUsecases _ageUsecases;

  final JournalUsecases _journalUsecases;

  const RegisterNPCAtPrecollegeUsecase(
    this._createStatePrecollegeSchoolAndRegisterPersonUsecase,
    this._personUsecases,
    this._relationshipUsecases,
    this._ageUsecases,
    this._journalUsecases,
  );

  Future<void> execute({
    required int currentPlayerID,
    required int npcPersonID,
    required int currentDay,
  }) async {
    //get the npc person info
    final Person? npcPerson = await _personUsecases.getPersonUsecase.execute(
      personID: npcPersonID,
    );

    //get player person info
    final Person? currentPlayerPerson =
        await _personUsecases.getPersonUsecase.execute(
      personID: currentPlayerID,
    );

    //if we have a valid npc and player
    if (npcPerson != null && currentPlayerPerson != null) {
      //create state precollege school and register the npc
      final SchoolPrecollegeInfo? schoolPrecollegeInfo =
          await _createStatePrecollegeSchoolAndRegisterPersonUsecase.execute(
        personID: npcPersonID,
        currentDay: currentDay,
        generateRandomGrades: true,
      );

      //if npc was successfully registered
      if (schoolPrecollegeInfo != null) {
        //get the npc age
        final Age npcAge = _ageUsecases.getPersonsAgeUsecase.execute(
          currentDay: currentDay,
          dayOfBirth: npcPerson.dayOfBirth,
        );

        //get the player age
        final Age playerAge = _ageUsecases.getPersonsAgeUsecase.execute(
          currentDay: currentDay,
          dayOfBirth: currentPlayerPerson.dayOfBirth,
        );

        //check if the npc goes to the same school as the player
        final bool npcIsRegisteredAtPlayerCurrentSchool =
            npcAge.lifeStage == playerAge.lifeStage &&
                npcPerson.currentState == currentPlayerPerson.currentState &&
                npcPerson.currentCountry == currentPlayerPerson.currentCountry;

        //check if there is a relationship
        final Relationship? existingRelationship =
            await _relationshipUsecases.getRelationshipUsecase.execute(
          firstPersonID: currentPlayerPerson.id,
          secondPersonID: npcPerson.id,
        );

        //if there is no relationship and the npc goes to the player school we want to create an acquaintance relationship
        if (existingRelationship == null &&
            npcIsRegisteredAtPlayerCurrentSchool) {
          await _relationshipUsecases.createRelationshipUsecase.execute(
            relationship: getAcquaintanceRelationshipFromTemplate(
              firstPersonID: currentPlayerID,
              secondPersonID: npcPerson.id,
              interestedInRelationship:
                  Chance.getTrueOrFalseBasedOnPercentageChance(
                trueChancePercentage: 75,
              ),
            ),
            existingRelationshipOverrideInstruction:
                ExistingRelationshipOverrideInstruction.nothing,
          );
        }

        //
        //
        //Journal:
        String journalEntryString = "";

        final String fullName = getFullNameString(
          firstName: npcPerson.firstName,
          lastName: npcPerson.lastName,
        );

        //set journal string:
        //if there is a non-acquaintance relationship
        if (existingRelationship != null &&
            !checkIfPlatonicRelationshipTypeStringContains(
              existingRelationship.platonicRelationshipType,
              PlatonicRelationshipType.acquaintance,
            )) {
          //get relationship label
          final String relationshipLabel =
              getPlatonicAndRomanticRelationshipLabelFromString(
            genderString: npcPerson.gender,
            platonicRelationshipTypeString:
                existingRelationship.platonicRelationshipType,
            romanticRelationshipTypeString:
                existingRelationship.romanticRelationshipType,
            previousFamilialRelationshipString:
                existingRelationship.previousFamilialRelationship,
            isCoParent: existingRelationship.isCoParent,
            activeRomance: existingRelationship.activeRomance,
          );

          journalEntryString =
              "My $relationshipLabel, $fullName is now attending ${schoolPrecollegeInfo.school.name}.";
        }
        //if there is no non-acquaintance relationship, we only want to report to the player if they are attending the same school.
        else if (npcIsRegisteredAtPlayerCurrentSchool) {
          journalEntryString = "$fullName is a new student at my school.";
        }

        //if we have a valid journal entry
        if (journalEntryString.isNotEmpty) {
          //Log in journal
          await _journalUsecases.addToJournalUsecase.execute(
            gameID: currentPlayerPerson.gameId,
            day: currentDay,
            mainPlayerID: currentPlayerPerson.id,
            entry: journalEntryString,
          );
        }
      }
    }
  }
}
