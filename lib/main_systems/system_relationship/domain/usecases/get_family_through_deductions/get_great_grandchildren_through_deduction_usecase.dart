import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/person_platonic_relationship_type_pair.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_children_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_grandchildren_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_person/constants/vital_status.dart';

class GetGreatGrandChildrenThroughDeductionUsecase {
  final GetGrandChildrenThroughDeductionUsecase
      _getGrandChildrenThroughDeductionUsecase;
  final GetChildrenThroughDeductionUsecase _getChildrenThroughDeductionUsecase;

  const GetGreatGrandChildrenThroughDeductionUsecase(
    this._getGrandChildrenThroughDeductionUsecase,
    this._getChildrenThroughDeductionUsecase,
  );

  Future<List<PersonPlatonicRelationshipTypePair>> execute({
    required int personID,
    required VitalStatus includeOnly,
  }) async {
    //GreatGrandChildren are the children of a person's grandchildren
    final List<PersonPlatonicRelationshipTypePair> greatGrandChildren = [];

    //helper inner function
    void addToGreatGrandChildrenList({
      required Person person,
      required bool addAsStepGreatGrandChild,
    }) {
      greatGrandChildren.add(
        PersonPlatonicRelationshipTypePair(
          person: person,
          platonicRelationshipType: (addAsStepGreatGrandChild)
              ? PlatonicRelationshipType.stepGreatGrandChild
              : PlatonicRelationshipType.greatGrandChild,
        ),
      );
    }

    //get person's grandchildren
    final List<PersonPlatonicRelationshipTypePair> personsGrandChildren =
        await _getGrandChildrenThroughDeductionUsecase.execute(
      personID: personID,
      includeOnly: VitalStatus.livingAndDead,
    );

    //get children of each person's grandchild
    for (var personsGrandChild in personsGrandChildren) {
      //
      final List<PersonPlatonicRelationshipTypePair>
          childrenOfPersonsGrandChild =
          await _getChildrenThroughDeductionUsecase.execute(
        personID: personsGrandChild.person.id,
        includeOnly: VitalStatus.livingAndDead,
      );

      //add each child to greatGrandChildren
      for (var childOfPersonsGrandChild in childrenOfPersonsGrandChild) {
        //if current person's grandchild is a step grandchild:
        //add all their children as step greatGrandChildren
        if (personsGrandChild.platonicRelationshipType ==
            PlatonicRelationshipType.stepGrandChild) {
          addToGreatGrandChildrenList(
            person: childOfPersonsGrandChild.person,
            addAsStepGreatGrandChild: true,
          );
        }
        //Not a step grandchild:
        //if the child is a step Child of the person's grandchild, then they are your step GreatGrandChild
        else if (childOfPersonsGrandChild.platonicRelationshipType ==
            PlatonicRelationshipType.stepChild) {
          addToGreatGrandChildrenList(
            person: childOfPersonsGrandChild.person,
            addAsStepGreatGrandChild: true,
          );
        }
        //Not a step grandchild:
        //also not step child of person's grandchild, we add as just greatGrandChild
        else {
          addToGreatGrandChildrenList(
            person: childOfPersonsGrandChild.person,
            addAsStepGreatGrandChild: false,
          );
        }
      }
    }

    //return based on request
    switch (includeOnly) {
      // return all
      case VitalStatus.livingAndDead:
        return greatGrandChildren;

      // return only living
      case VitalStatus.living:
        return greatGrandChildren
            .where((pair) => pair.person.dead == false)
            .toList();

      // return only dead
      case VitalStatus.dead:
        return greatGrandChildren
            .where((pair) => pair.person.dead == true)
            .toList();
    }
  }
}
