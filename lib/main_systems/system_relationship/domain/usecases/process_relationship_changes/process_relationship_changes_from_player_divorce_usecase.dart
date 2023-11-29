import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_platonic_relationship_type_pair.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/relationship_repository.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/romantic_relationship_info_repository.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_special_cases/get_players_living_step_family_and_inlaws_using_their_spouse_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_converters/convert_temporary_familial_relationship_to_past_family_usecase.dart';
import 'package:toplife/main_systems/system_relationship/util/get_list_of_names_and_platonic_relationship_labels.dart';

class ProcessRelationshipChangesFromPlayerDivorceUsecase {
  final RelationshipRepository _relationshipRepository;
  final RomanticRelationshipInfoRepository _romanticRelationshipInfoRepository;
  final GetPlayersLivingStepFamilyAndInlawsUsingTheirSpouseUsecase
      _getPlayersLivingStepFamilyAndInlawsUsingTheirSpouseUsecase;
  final JournalUsecases _journalUsecases;

  final ConvertTemporaryFamilialRelationshipToPastFamilyUsecase
      _convertTemporaryFamilialRelationshipToPastFamilyUsecase;

  ProcessRelationshipChangesFromPlayerDivorceUsecase(
    this._relationshipRepository,
    this._romanticRelationshipInfoRepository,
    this._getPlayersLivingStepFamilyAndInlawsUsingTheirSpouseUsecase,
    this._convertTemporaryFamilialRelationshipToPastFamilyUsecase,
    this._journalUsecases,
  );

  Future<void> execute({
    required Game currentGame,
    required int playerPersonID,
    required Person spousePerson,
  }) async {
    //
    //
    //SPOUSE:
    //get relationship with spouse
    final Relationship? playerSpouseRelationship =
        await _relationshipRepository.getRelationship(
      playerPersonID,
      spousePerson.id,
    );

    //if valid
    if (playerSpouseRelationship != null) {
      //end the romantic relationship:

      //make inactive
      await _relationshipRepository.updateRelationship(
        playerSpouseRelationship.copyWith(
          activeRomance: false,
        ),
      );

      //put end day in romantic relationship info
      final int? romanticRelationshipInfoID =
          playerSpouseRelationship.romanticRelationshipInfoId;

      //if valid
      if (romanticRelationshipInfoID != null) {
        //
        final RomanticRelationshipInfo? romanticRelationshipInfo =
            await _romanticRelationshipInfoRepository
                .getRomanticRelationshipInfo(
          romanticRelationshipInfoID,
        );
        
        //if valid
        if (romanticRelationshipInfo != null) {
          //update end day to the current day
          await _romanticRelationshipInfoRepository
              .updateRomanticRelationshipInfo(
            romanticRelationshipInfo.copyWith(
              endDay: currentGame.currentDay,
            ),
          );
        }
      }
    }

    //STEP FAMILY AND INLAWS:
    //get all step family and inlaws
    final List<PersonPlatonicRelationshipTypePair> playerStepFamilyAndInLaws =
        await _getPlayersLivingStepFamilyAndInlawsUsingTheirSpouseUsecase.execute(
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
        mainPlayerID: currentGame.currentPlayerID,
        entry: familyLossAfterDivorceStringBuffer.toString(),
      );
    }
  }
}
