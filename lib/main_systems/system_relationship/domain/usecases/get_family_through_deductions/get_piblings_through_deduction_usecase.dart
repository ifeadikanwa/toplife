import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/person_platonic_relationship_type_pair.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_parents_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_siblings_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_person/constants/vital_status.dart';

class GetPiblingsThroughDeductionUsecase {
  final GetParentsThroughDeductionUsecase _getParentsThroughDeductionUsecase;
  final GetSiblingsThroughDeductionUsecase _getSiblingsThroughDeductionUsecase;

  const GetPiblingsThroughDeductionUsecase(
    this._getParentsThroughDeductionUsecase,
    this._getSiblingsThroughDeductionUsecase,
  );

  Future<List<PersonPlatonicRelationshipTypePair>> execute({
    required int personID,
    required VitalStatus includeOnly,
  }) async {
    //Piblings are the siblings of a person's parents
    final List<PersonPlatonicRelationshipTypePair> piblings = [];

    //helper inner function
    void addToPiblingsList({
      required Person person,
      required bool addAsStepPibling,
    }) {
      piblings.add(
        PersonPlatonicRelationshipTypePair(
          person: person,
          platonicRelationshipType: (addAsStepPibling)
              ? PlatonicRelationshipType.stepPibling
              : PlatonicRelationshipType.pibling,
        ),
      );
    }

    //get person's parents
    final List<PersonPlatonicRelationshipTypePair> allParents =
        await _getParentsThroughDeductionUsecase.execute(
      personID: personID,
      includeOnly: VitalStatus.livingAndDead,
    );

    //get siblings of each parent
    for (var parent in allParents) {
      //
      final List<PersonPlatonicRelationshipTypePair> parentSiblings =
          await _getSiblingsThroughDeductionUsecase.execute(
        personID: parent.person.id,
        includeOnly: VitalStatus.livingAndDead,
      );

      //add each sibling to piblings
      for (var parentSibling in parentSiblings) {
        //if current parent is a step parent:
        //add all their sibling as step pibling
        if (parent.platonicRelationshipType ==
            PlatonicRelationshipType.stepParent) {
          addToPiblingsList(
            person: parentSibling.person,
            addAsStepPibling: true,
          );
        }
        //Not a step parent:
        //if the sibling is a step Sibling of the parent, then they are your step Pibling
        else if (parentSibling.platonicRelationshipType ==
            PlatonicRelationshipType.stepSibling) {
          addToPiblingsList(
            person: parentSibling.person,
            addAsStepPibling: true,
          );
        }
        //Not a step parent:
        //also not parents step sibling, we add as just Pibling
        else {
          addToPiblingsList(
            person: parentSibling.person,
            addAsStepPibling: false,
          );
        }
      }
    }

    //return based on request
    switch (includeOnly) {
      // return all
      case VitalStatus.livingAndDead:
        return piblings;

      // return only living
      case VitalStatus.living:
        return piblings.where((pair) => pair.person.dead == false).toList();

      // return only dead
      case VitalStatus.dead:
        return piblings.where((pair) => pair.person.dead == true).toList();
    }
  }
}
