import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/model/info_models/person_platonic_relationship_type_pair.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/usecases/get_family_special_cases/get_players_living_step_family_and_inlaws_using_their_spouse_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/usecases/relationship_converters/convert_temporary_familial_relationship_to_past_family_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/util/label/get_list_of_names_and_platonic_relationship_labels.dart';

class ProcessRelationshipChangesFromPlayerDivorceUsecase {
  final GetPlayersLivingStepFamilyAndInlawsUsingTheirSpouseUsecase
      _getPlayersLivingStepFamilyAndInlawsUsingTheirSpouseUsecase;
  final JournalUsecases _journalUsecases;

  final ConvertTemporaryFamilialRelationshipToPastFamilyUsecase
      _convertTemporaryFamilialRelationshipToPastFamilyUsecase;

  ProcessRelationshipChangesFromPlayerDivorceUsecase(
    this._getPlayersLivingStepFamilyAndInlawsUsingTheirSpouseUsecase,
    this._convertTemporaryFamilialRelationshipToPastFamilyUsecase,
    this._journalUsecases,
  );

  Future<void> execute({
    required Game currentGame,
    required int playerPersonID,
    required Person spousePerson,
  }) async {
    //!Handle the divorce outside of this usecase, most likey in the caller of this usecase
    //
    //

    //STEP FAMILY AND INLAWS:
    //get all step family and inlaws
    final List<PersonPlatonicRelationshipTypePair> playerStepFamilyAndInLaws =
        await _getPlayersLivingStepFamilyAndInlawsUsingTheirSpouseUsecase
            .execute(
      playerPersonID: playerPersonID,
      spousePersonID: spousePerson.id,
    );

    //convert each to past family
    for (var temporaryFamilyMember in playerStepFamilyAndInLaws) {
      //convert to past family
      await _convertTemporaryFamilialRelationshipToPastFamilyUsecase.execute(
        firstPersonID: playerPersonID,
        secondPersonID: temporaryFamilyMember.person.id,
      );
    }

    //REPORT IN JOURNAL:
    final StringBuffer familyLossAfterDivorceStringBuffer = StringBuffer();
    //building the string for journal entry
    final String introString =
        "Broken family ties after my divorce from ${spousePerson.firstName} ${spousePerson.lastName}:\n";

    familyLossAfterDivorceStringBuffer.write(introString);

    //add all the new family members to string
    familyLossAfterDivorceStringBuffer.write(
      getListOfNamesAndPlatonicRelationshipLabels(
        playerStepFamilyAndInLaws,
      ),
    );

    //Log in journal, only if there was at least one addition
    if (playerStepFamilyAndInLaws.isNotEmpty) {
      await _journalUsecases.addToJournalUsecase.execute(
        gameID: currentGame.id,
        day: currentGame.currentDay,
        mainPlayerID: playerPersonID,
        entry: familyLossAfterDivorceStringBuffer.toString(),
      );
    }
  }
}
