import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/person_platonic_relationship_type_pair.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_special_cases/get_all_step_family_from_different_generations_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_special_cases/get_children_of_person_not_belonging_to_another_person_usecase.dart';

class GetAllChildrenAdditionsToTheFamilyFromFamilyMembersSpouseUsecase {
  final GetChildrenOfPersonNotBelongingToAnotherPersonUsecase
      _getChildrenOfPersonNotBelongingToAnotherPersonUsecase;
  final GetAllStepFamilyFromDifferentGenerationsUsecase
      _getAllStepFamilyFromDifferentGenerationsUsecase;

  const GetAllChildrenAdditionsToTheFamilyFromFamilyMembersSpouseUsecase(
    this._getChildrenOfPersonNotBelongingToAnotherPersonUsecase,
    this._getAllStepFamilyFromDifferentGenerationsUsecase,
  );

  Future<List<PersonPlatonicRelationshipTypePair>> execute({
    required int playerPersonID,
    required int familyMemberID,
    required int spouseID,
    required PlatonicRelationshipType familyMemberRelationshipToPlayer,
  }) async {
    final List<PersonPlatonicRelationshipTypePair>
        childrenFromDifferentGenerations;

    //we get all living AND dead children so we can catch all descendants even if their parents are dead

    //get all living AND dead children of the spouse not belonging to the player
    final List<Person> childrenOfSpouseNotBelongingToThePlayer =
        await _getChildrenOfPersonNotBelongingToAnotherPersonUsecase.execute(
      belongingToParentID: spouseID,
      notBelongingToParentID: playerPersonID,
      onlyLivingPeople: false,
    );

    //get all living AND dead children of the spouse not belonging to the family member
    final List<Person> childrenOfSpouseNotBelongingToTheFamilyMember =
        await _getChildrenOfPersonNotBelongingToAnotherPersonUsecase.execute(
      belongingToParentID: spouseID,
      notBelongingToParentID: familyMemberID,
      onlyLivingPeople: false,
    );

    //get common children in both list = children not belonging to player and family member
    //go through list for player and bring out elements that exist in list for family member
    final List<Person> childrenOfSpouseNotBelongingToThePlayerAndFamilyMember =
        childrenOfSpouseNotBelongingToThePlayer
            .where(
              (child) => childrenOfSpouseNotBelongingToTheFamilyMember
                  .any((element) => element.id == child.id),
            )
            .toList();

    //get the generations of the step family using the children not belonging to player and family member (step children of family member)
    childrenFromDifferentGenerations =
        await _getAllStepFamilyFromDifferentGenerationsUsecase.execute(
      playerPersonID: playerPersonID,
      parentRelationshipToPlayer: familyMemberRelationshipToPlayer,
      chosenChildrenOfTheParent:
          childrenOfSpouseNotBelongingToThePlayerAndFamilyMember,
    );

    //return
    return childrenFromDifferentGenerations;
  }
}
