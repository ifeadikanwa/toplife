import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_platonic_relationship_type_pair.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/npc_union_info.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_special_cases/get_players_living_extended_step_family_and_in_laws_from_union_between_two_npcs_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_converters/convert_temporary_familial_relationship_to_past_family_usecase.dart';
import 'package:toplife/main_systems/system_relationship/util/label/get_list_of_names_and_platonic_relationship_labels.dart';
import 'package:toplife/main_systems/system_relationship/util/label/get_name_and_platonic_relationship_label.dart';

class ProcessRelationshipChangesFromNpcDivorceUsecase {
  final ConvertTemporaryFamilialRelationshipToPastFamilyUsecase
      _convertTemporaryFamilialRelationshipToPastFamilyUsecase;
  final GetPlayersLivingExtendedStepFamilyAndInLawsFromUnionBetweenTwoNpcsUsecase
      _getPlayersLivingExtendedStepFamilyAndInLawsFromUnionBetweenTwoNpcsUsecase;
  final JournalUsecases _journalUsecases;

  const ProcessRelationshipChangesFromNpcDivorceUsecase(
    this._convertTemporaryFamilialRelationshipToPastFamilyUsecase,
    this._getPlayersLivingExtendedStepFamilyAndInLawsFromUnionBetweenTwoNpcsUsecase,
    this._journalUsecases,
  );

  Future<void> execute({
    required Game currentGame,
    required int playerPersonID,
    required int firstNpcPersonID,
    required int secondNpcPersonID,
  }) async {
    //!Handle the divorce outside of this usecase, most likey in the caller of this usecase

    //get all the relationship changes that will come from the union between the two npcs
    //this will tell us what relationships we need to change
    final NpcUnionInfo? npcUnionInfo =
        await _getPlayersLivingExtendedStepFamilyAndInLawsFromUnionBetweenTwoNpcsUsecase
            .execute(
      playerPersonID: playerPersonID,
      firstNpcPersonID: firstNpcPersonID,
      secondNpcPersonID: secondNpcPersonID,
    );

    //if npc union info is valid then there are relationship changes caused by the union
    if (npcUnionInfo != null) {
      final List<PersonPlatonicRelationshipTypePair>
          extendedStepFamilyAndInlaws = npcUnionInfo.familyAdditionsFromUnion;

      //convert every relationship belonging to the extended stepfamily and inlaws to past family relationship
      for (var person in extendedStepFamilyAndInlaws) {
        await _convertTemporaryFamilialRelationshipToPastFamilyUsecase.execute(
          firstPersonID: playerPersonID,
          secondPersonID: person.person.id,
        );
      }

      //Build string:
      final StringBuffer lostFamilyStringBuffer = StringBuffer();
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
          "Broken family ties after the end of the marriage between $familyMemberNameAndLabel and ${npcUnionInfo.outsiderSpouse.firstName} ${npcUnionInfo.outsiderSpouse.lastName}:\n";

      lostFamilyStringBuffer.write(introString);

      //add all the extended step family and in laws to string
      lostFamilyStringBuffer.write(
        getListOfNamesAndPlatonicRelationshipLabels(
          extendedStepFamilyAndInlaws,
        ),
      );

      //Log in journal, only if there was at least one person
      if (extendedStepFamilyAndInlaws.isNotEmpty) {
        await _journalUsecases.addToJournalUsecase.execute(
          gameID: currentGame.id,
          day: currentGame.currentDay,
          mainPlayerID: playerPersonID,
          entry: lostFamilyStringBuffer.toString(),
        );
      }
    }
  }
}
