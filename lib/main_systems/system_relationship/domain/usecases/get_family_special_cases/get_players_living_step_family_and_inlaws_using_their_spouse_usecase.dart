import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/constants/vital_status.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/person_platonic_relationship_type_pair.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_special_cases/get_children_of_person_not_belonging_to_another_person_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_parents_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_siblings_through_deduction_usecase.dart';

class GetPlayersLivingStepFamilyAndInlawsUsingTheirSpouseUsecase {
  final GetParentsThroughDeductionUsecase _getParentsThroughDeductionUsecase;
  final GetSiblingsThroughDeductionUsecase _getSiblingsThroughDeductionUsecase;
  final GetChildrenOfPersonNotBelongingToAnotherPersonUsecase
      _getChildrenOfPersonNotBelongingToAnotherPersonUsecase;

  const GetPlayersLivingStepFamilyAndInlawsUsingTheirSpouseUsecase(
    this._getParentsThroughDeductionUsecase,
    this._getSiblingsThroughDeductionUsecase,
    this._getChildrenOfPersonNotBelongingToAnotherPersonUsecase,
  );

  Future<List<PersonPlatonicRelationshipTypePair>> execute({
    required int playerPersonID,
    required int spousePersonID,
  }) async {
    //all past family list
    final Set<PersonPlatonicRelationshipTypePair> allLivingStepFamilyAndInLaws =
        {};

    //
    //
    //PARENT IN LAWS
    final List<Person> aliveParentInLaws =
        (await _getParentsThroughDeductionUsecase.execute(
      personID: spousePersonID,
      includeOnly: VitalStatus.living,
    ))
            .map((e) => e.person)
            .toList();

    //add to main set
    allLivingStepFamilyAndInLaws.addAll(
      aliveParentInLaws.map(
        (person) => PersonPlatonicRelationshipTypePair(
          person: person,
          platonicRelationshipType: PlatonicRelationshipType.parentInLaw,
        ),
      ),
    );

    //
    //
    //SIBLING IN LAWS
    final List<Person> aliveSiblingInLaws =
        (await _getSiblingsThroughDeductionUsecase.execute(
      personID: spousePersonID,
      includeOnly: VitalStatus.living,
    ))
            .map((e) => e.person)
            .toList();

    //add to main set
    allLivingStepFamilyAndInLaws.addAll(
      aliveSiblingInLaws.map(
        (person) => PersonPlatonicRelationshipTypePair(
          person: person,
          platonicRelationshipType: PlatonicRelationshipType.siblingInLaw,
        ),
      ),
    );

    //we get all living AND dead children so we can catch all descendants even if their parents are dead
    const bool doWeGetOnlyLivingChildren = false;
    //
    //
    //STEP CHILDREN

    final List<Person> deadAndLivingStepChildren =
        await _getChildrenOfPersonNotBelongingToAnotherPersonUsecase.execute(
      belongingToParentID: spousePersonID,
      notBelongingToParentID: playerPersonID,
      onlyLivingPeople: doWeGetOnlyLivingChildren,
    );

    //add ONLY LIVING to main set
    allLivingStepFamilyAndInLaws.addAll(
      deadAndLivingStepChildren.where((person) => person.dead == false).map(
            (person) => PersonPlatonicRelationshipTypePair(
              person: person,
              platonicRelationshipType: PlatonicRelationshipType.stepChild,
            ),
          ),
    );

    //
    //
    //STEP GRAND CHILDREN
    final List<Person> deadAndLivingStepGrandChildren = [];

    for (var stepChild in deadAndLivingStepChildren) {
      //get stepchild's children but take out all children(birth/adopted) they share with the player

      final List<Person> personsChildren =
          await _getChildrenOfPersonNotBelongingToAnotherPersonUsecase.execute(
        belongingToParentID: stepChild.id,
        notBelongingToParentID: playerPersonID,
        onlyLivingPeople: doWeGetOnlyLivingChildren,
      );

      //add to final list
      deadAndLivingStepGrandChildren.addAll(personsChildren);
    }

    //add ONLY LIVING to main set
    allLivingStepFamilyAndInLaws.addAll(
      deadAndLivingStepGrandChildren
          .where((person) => person.dead == false)
          .map(
            (person) => PersonPlatonicRelationshipTypePair(
              person: person,
              platonicRelationshipType: PlatonicRelationshipType.stepGrandChild,
            ),
          ),
    );

    //
    //
    //STEP GREAT GRAND CHILDREN
    final List<Person> deadAndLivingStepGreatGrandChildren = [];

    for (var stepGrandChild in deadAndLivingStepGrandChildren) {
      //get grandstepchild's children but take out all children(birth/adopted) they share with the player

      final List<Person> personsChildren =
          await _getChildrenOfPersonNotBelongingToAnotherPersonUsecase.execute(
        belongingToParentID: stepGrandChild.id,
        notBelongingToParentID: playerPersonID,
        onlyLivingPeople: doWeGetOnlyLivingChildren,
      );

      //add to final list
      deadAndLivingStepGreatGrandChildren.addAll(personsChildren);
    }

    //add ONLY LIVING to main set
    allLivingStepFamilyAndInLaws.addAll(
      deadAndLivingStepGreatGrandChildren
          .where((person) => person.dead == false)
          .map(
            (person) => PersonPlatonicRelationshipTypePair(
              person: person,
              platonicRelationshipType:
                  PlatonicRelationshipType.stepGreatGrandChild,
            ),
          ),
    );

    return allLivingStepFamilyAndInLaws.toList();
  }
}
