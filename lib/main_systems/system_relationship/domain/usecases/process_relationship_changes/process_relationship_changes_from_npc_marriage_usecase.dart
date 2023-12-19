import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_platonic_relationship_type_pair.dart';
import 'package:toplife/main_systems/system_relationship/constants/existing_relationship_override_instruction.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/npc_union_info.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/create/create_multiple_relationships_from_person_platonic_relationship_type_pair_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_special_cases/get_players_living_extended_step_family_and_in_laws_from_union_between_two_npcs_usecase.dart';
import 'package:toplife/main_systems/system_relationship/util/get_list_of_names_and_platonic_relationship_labels.dart';
import 'package:toplife/main_systems/system_relationship/util/get_name_and_platonic_relationship_label.dart';

class ProcessRelationshipChangesFromNpcMarriageUsecase {
  final CreateMultipleRelationshipsFromPersonPlatonicRelationshipTypePairUsecase
      _createMultipleRelationshipsFromPersonPlatonicRelationshipTypePairUsecase;
  final GetPlayersLivingExtendedStepFamilyAndInLawsFromUnionBetweenTwoNpcsUsecase
      _getPlayersLivingExtendedStepFamilyAndInLawsFromUnionBetweenTwoNpcsUsecase;
  final JournalUsecases _journalUsecases;

  const ProcessRelationshipChangesFromNpcMarriageUsecase(
    this._createMultipleRelationshipsFromPersonPlatonicRelationshipTypePairUsecase,
    this._getPlayersLivingExtendedStepFamilyAndInLawsFromUnionBetweenTwoNpcsUsecase,
    this._journalUsecases,
  );

  Future<void> execute({
    required Game currentGame,
    required int playerPersonID,
    required int firstNpcPersonID,
    required int secondNpcPersonID,
  }) async {
    //!Handle the marriage outside of this usecase, most likey in the caller of this usecase

    final NpcUnionInfo? npcUnionInfo =
        await _getPlayersLivingExtendedStepFamilyAndInLawsFromUnionBetweenTwoNpcsUsecase
            .execute(
      playerPersonID: playerPersonID,
      firstNpcPersonID: firstNpcPersonID,
      secondNpcPersonID: secondNpcPersonID,
    );

    //if npc union info is valid then there are relationship changes caused by the union
    if (npcUnionInfo != null) {
      final List<PersonPlatonicRelationshipTypePair> allNewFamilyAdditions =
          npcUnionInfo.familyAdditionsFromUnion;

      //create all the relationships with the new family additions
      //if the relationship exist override only platonic rel type
      await _createMultipleRelationshipsFromPersonPlatonicRelationshipTypePairUsecase
          .execute(
        playerPersonID: playerPersonID,
        personPlatonicRelationshipTypePairList: allNewFamilyAdditions,
        existingRelationshipOverrideInstruction:
            ExistingRelationshipOverrideInstruction
                .onlyPlatonicRelationshipType,
      );

      //Build string:
      final StringBuffer newFamilyAdditionStringBuffer = StringBuffer();
      //building the string for journal entry

      final String familyMemberNameAndLabel =
          getNameAndPlatonicRelationshipLabel(
        firstName: npcUnionInfo.connectingSpouse.firstName,
        lastName: npcUnionInfo.connectingSpouse.lastName,
        platonicRelationshipTypeList:
            npcUnionInfo.connectingSpouseRelationshipToPlayer,
        genderString: npcUnionInfo.connectingSpouse.gender,
        previousFamilialRelationship: null,
      );

      final String introString =
          "New additions to the family from marriage between $familyMemberNameAndLabel and ${npcUnionInfo.outsiderSpouse.firstName} ${npcUnionInfo.outsiderSpouse.lastName}:\n";

      newFamilyAdditionStringBuffer.write(introString);

      //add all the new family members to string
      newFamilyAdditionStringBuffer.write(
        getListOfNamesAndPlatonicRelationshipLabels(
          allNewFamilyAdditions,
        ),
      );

      //Log in journal, only if there was at least one addition
      if (allNewFamilyAdditions.isNotEmpty) {
        await _journalUsecases.addToJournalUsecase.execute(
          gameID: currentGame.id,
          day: currentGame.currentDay,
          mainPlayerID: playerPersonID,
          entry: newFamilyAdditionStringBuffer.toString(),
        );
      }
    }
  }
}
