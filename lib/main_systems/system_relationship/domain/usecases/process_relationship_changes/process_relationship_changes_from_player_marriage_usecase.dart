import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_platonic_relationship_type_pair.dart';
import 'package:toplife/main_systems/system_relationship/constants/existing_relationship_override_instruction.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/create/create_multiple_relationships_from_person_platonic_relationship_type_pair_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_special_cases/get_players_living_step_family_and_inlaws_using_their_spouse_usecase.dart';
import 'package:toplife/main_systems/system_relationship/util/label/get_list_of_names_and_platonic_relationship_labels.dart';

class ProcessRelationshipChangesFromPlayerMarriageUsecase {
  final JournalUsecases _journalUsecases;
  final GetPlayersLivingStepFamilyAndInlawsUsingTheirSpouseUsecase
      _getPlayersLivingStepFamilyAndInlawsUsingTheirSpouseUsecase;
  final CreateMultipleRelationshipsFromPersonPlatonicRelationshipTypePairUsecase
      _createMultipleRelationshipsFromPersonPlatonicRelationshipTypePairUsecase;

  ProcessRelationshipChangesFromPlayerMarriageUsecase(
    this._journalUsecases,
    this._getPlayersLivingStepFamilyAndInlawsUsingTheirSpouseUsecase,
    this._createMultipleRelationshipsFromPersonPlatonicRelationshipTypePairUsecase,
  );

  Future<void> execute({
    required Game currentGame,
    required int playerPersonID,
    required Person spousePerson,
  }) async {
    //!Handle the marriage outside of this usecase, most likey in the caller of this usecase

    //instructions for creating all relationships
    const ExistingRelationshipOverrideInstruction
        existingRelationshipOverrideInstruction =
        ExistingRelationshipOverrideInstruction.onlyPlatonicRelationshipType;

    //
    //

    //get all step family and in laws
    final List<PersonPlatonicRelationshipTypePair> playerStepFamilyAndInlaws =
        await _getPlayersLivingStepFamilyAndInlawsUsingTheirSpouseUsecase
            .execute(
      playerPersonID: playerPersonID,
      spousePersonID: spousePerson.id,
    );

    //create relationship for all step family and inlaws
    //if a romantic relatonship already exist with the person, we DONT touch it
    await _createMultipleRelationshipsFromPersonPlatonicRelationshipTypePairUsecase
        .execute(
      playerPersonID: playerPersonID,
      personPlatonicRelationshipTypePairList: playerStepFamilyAndInlaws,
      existingRelationshipOverrideInstruction:
          existingRelationshipOverrideInstruction,
    );

    //
    //

    //Build string:
    final StringBuffer newFamilyAdditionStringBuffer = StringBuffer();
    //building the string for journal entry
    final String introString =
        "New additions to the family from my marriage to ${spousePerson.firstName} ${spousePerson.lastName}:\n";

    newFamilyAdditionStringBuffer.write(introString);

    //add all the new family members to string
    newFamilyAdditionStringBuffer.write(
      getListOfNamesAndPlatonicRelationshipLabels(
        playerStepFamilyAndInlaws,
      ),
    );

    //Log in journal, only if there was at least one addition
    if (playerStepFamilyAndInlaws.isNotEmpty) {
      await _journalUsecases.addToJournalUsecase.execute(
        gameID: currentGame.id,
        day: currentGame.currentDay,
        mainPlayerID: playerPersonID,
        entry: newFamilyAdditionStringBuffer.toString(),
      );
    }
  }
}
