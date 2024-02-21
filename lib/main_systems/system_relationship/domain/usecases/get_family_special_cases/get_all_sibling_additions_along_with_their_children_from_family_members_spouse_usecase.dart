import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_platonic_relationship_type_pair.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_special_cases/get_all_step_family_from_different_generations_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_children_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_siblings_through_deduction_usecase.dart';

class GetAllSiblingAdditionsAlongWithTheirChildrenFromFamilyMembersSpouseUsecase {
  final GetSiblingsThroughDeductionUsecase _getSiblingsThroughDeductionUsecase;
  final GetChildrenThroughDeductionUsecase _getChildrenThroughDeductionUsecase;
  final GetAllStepFamilyFromDifferentGenerationsUsecase
      _getAllStepFamilyFromDifferentGenerationsUsecase;

  const GetAllSiblingAdditionsAlongWithTheirChildrenFromFamilyMembersSpouseUsecase(
    this._getSiblingsThroughDeductionUsecase,
    this._getChildrenThroughDeductionUsecase,
    this._getAllStepFamilyFromDifferentGenerationsUsecase,
  );

  //only siblings of step parents get added to the family through npc marriage
  Future<List<PersonPlatonicRelationshipTypePair>> execute({
    required int playerPersonID,
    required int spouseID,
    required PlatonicRelationshipType spouseRelationshipToPlayer,
  }) async {
    final List<PersonPlatonicRelationshipTypePair> siblingsAndTheirChildren;

    //we get all living AND dead siblings so we can catch all descendants even if their parents are dead

    if (spouseRelationshipToPlayer == PlatonicRelationshipType.stepParent) {
      //It is possible for the step parent sibling to be a child of the player,
      //because as long as the step parent is not the players child they dont get a permanent familial label
      //We need to prepare for that edge case

      //get their living AND dead siblings
      //map to list of person
      final List<Person> allSiblings =
          (await _getSiblingsThroughDeductionUsecase.execute(
        personID: spouseID,
        onlyLivingPeople: false,
      ))
              .map((e) => e.person)
              .toList();

      //get all the players children
      final List<Person> allPlayerChildren =
          (await _getChildrenThroughDeductionUsecase.execute(
        personID: playerPersonID,
        onlyLivingPeople: false,
      ))
              .map((e) => e.person)
              .toList();

      //get all siblings that are not the player's children
      final List<Person> siblingsWithNoRelationToThePlayer = allSiblings
          .where(
            (sibling) =>
                allPlayerChildren.any((element) => element.id != sibling.id),
          )
          .toList();

      //get siblings and their children
      //we send the request through 'stepgrandparent' so it can use that to go down the generation of children starting from the spouses siblings
      //if we do this we get the siblings as stepPiblings and their children as stepCousins, this is what we want
      siblingsAndTheirChildren =
          await _getAllStepFamilyFromDifferentGenerationsUsecase.execute(
        playerPersonID: playerPersonID,
        parentRelationshipToPlayer: PlatonicRelationshipType.stepGrandParent,
        chosenChildrenOfTheParent: siblingsWithNoRelationToThePlayer,
      );

      //return
      return siblingsAndTheirChildren;
    }

    //return empty list if we dont get step parent
    return [];
  }
}
