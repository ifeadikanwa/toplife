import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/model/info_models/person_platonic_relationship_type_pair.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_children_through_deduction_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/vital_status.dart';

class GetGrandChildrenThroughDeductionUsecase {
  final GetChildrenThroughDeductionUsecase _getChildrenThroughDeductionUsecase;

  const GetGrandChildrenThroughDeductionUsecase(
    this._getChildrenThroughDeductionUsecase,
  );

  Future<List<PersonPlatonicRelationshipTypePair>> execute({
    required int personID,
    required VitalStatus includeOnly,
  }) async {
    //GrandChildren are the children of a person's children
    final List<PersonPlatonicRelationshipTypePair> grandChildren = [];

    //helper inner function
    void addToGrandChildrenList({
      required Person person,
      required bool addAsStepGrandChild,
    }) {
      grandChildren.add(
        PersonPlatonicRelationshipTypePair(
          person: person,
          platonicRelationshipType: (addAsStepGrandChild)
              ? PlatonicRelationshipType.stepGrandChild
              : PlatonicRelationshipType.grandChild,
        ),
      );
    }

    //get person's children
    final List<PersonPlatonicRelationshipTypePair> personsChildren =
        await _getChildrenThroughDeductionUsecase.execute(
            personID: personID, includeOnly: VitalStatus.livingAndDead);

    //get children of each person's child
    for (var personsChild in personsChildren) {
      //
      final List<PersonPlatonicRelationshipTypePair> childrenOfPersonsChild =
          await _getChildrenThroughDeductionUsecase.execute(
              personID: personsChild.person.id,
              includeOnly: VitalStatus.livingAndDead);

      //add each child to grandChildren
      for (var childOfPersonsChild in childrenOfPersonsChild) {
        //if current person's child is a step child:
        //add all their children as step grandChildren
        if (personsChild.platonicRelationshipType ==
            PlatonicRelationshipType.stepChild) {
          addToGrandChildrenList(
            person: childOfPersonsChild.person,
            addAsStepGrandChild: true,
          );
        }
        //Not a step child:
        //if the child is a step Child of the person's child, then they are your step GrandChild
        else if (childOfPersonsChild.platonicRelationshipType ==
            PlatonicRelationshipType.stepChild) {
          addToGrandChildrenList(
            person: childOfPersonsChild.person,
            addAsStepGrandChild: true,
          );
        }
        //Not a step child:
        //also not step child of person's child, we add as just GrandChild
        else {
          addToGrandChildrenList(
            person: childOfPersonsChild.person,
            addAsStepGrandChild: false,
          );
        }
      }
    }

    //return based on request
    switch (includeOnly) {
      // return all
      case VitalStatus.livingAndDead:
        return grandChildren;

      // return only living
      case VitalStatus.living:
        return grandChildren
            .where((pair) => pair.person.dead == false)
            .toList();

      // return only dead
      case VitalStatus.dead:
        return grandChildren.where((pair) => pair.person.dead == true).toList();
    }
  }
}
