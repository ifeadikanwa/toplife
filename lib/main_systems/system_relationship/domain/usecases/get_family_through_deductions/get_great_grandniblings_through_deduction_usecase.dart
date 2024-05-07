import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/person_platonic_relationship_type_pair.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_children_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_grandniblings_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_person/constants/vital_status.dart';

class GetGreatGrandNiblingsThroughDeductionUsecase {
  final GetChildrenThroughDeductionUsecase _getChildrenThroughDeductionUsecase;
  final GetGrandNiblingsThroughDeductionUsecase
      _getGrandNiblingsThroughDeductionUsecase;

  const GetGreatGrandNiblingsThroughDeductionUsecase(
    this._getChildrenThroughDeductionUsecase,
    this._getGrandNiblingsThroughDeductionUsecase,
  );

  Future<List<PersonPlatonicRelationshipTypePair>> execute({
    required int personID,
    required VitalStatus includeOnly,
  }) async {
    //GreatGrandNiblings are the children of a person's greatGrand niblings
    final List<PersonPlatonicRelationshipTypePair> greatGrandNiblings = [];

    //helper inner function
    void addToGreatGrandNiblingsList({
      required Person person,
      required bool addAsStepGreatGrandNibling,
    }) {
      greatGrandNiblings.add(
        PersonPlatonicRelationshipTypePair(
          person: person,
          platonicRelationshipType: (addAsStepGreatGrandNibling)
              ? PlatonicRelationshipType.stepGreatGrandNibling
              : PlatonicRelationshipType.greatGrandNibling,
        ),
      );
    }

    //get person's grand niblings
    final List<PersonPlatonicRelationshipTypePair> allGrandNiblings =
        await _getGrandNiblingsThroughDeductionUsecase.execute(
      personID: personID,
      includeOnly: VitalStatus.livingAndDead,
    );

    //get children of each grand nibling
    for (var grandNibling in allGrandNiblings) {
      //
      final List<PersonPlatonicRelationshipTypePair> grandNiblingsChildren =
          await _getChildrenThroughDeductionUsecase.execute(
        personID: grandNibling.person.id,
        includeOnly: VitalStatus.livingAndDead,
      );

      //add each child to greatGrandNiblings
      for (var grandNiblingChild in grandNiblingsChildren) {
        //if current grand nibling is a step grand nibling:
        //add all their children as step greatGrandNibling
        if (grandNibling.platonicRelationshipType ==
            PlatonicRelationshipType.stepGrandNibling) {
          addToGreatGrandNiblingsList(
            person: grandNiblingChild.person,
            addAsStepGreatGrandNibling: true,
          );
        }
        //Not a step grand nibling:
        //if the child is a step Child of the grand nibling, then they are your step GreatGrandNibling
        else if (grandNiblingChild.platonicRelationshipType ==
            PlatonicRelationshipType.stepChild) {
          addToGreatGrandNiblingsList(
            person: grandNiblingChild.person,
            addAsStepGreatGrandNibling: true,
          );
        }
        //Not a step grand nibling:
        //also not grand nibling's step child, we add as just GreatGrandNibling
        else {
          addToGreatGrandNiblingsList(
            person: grandNiblingChild.person,
            addAsStepGreatGrandNibling: false,
          );
        }
      }
    }

    //return based on request
    switch (includeOnly) {
      // return all
      case VitalStatus.livingAndDead:
        return greatGrandNiblings;

      // return only living
      case VitalStatus.living:
        return greatGrandNiblings
            .where((pair) => pair.person.dead == false)
            .toList();

      // return only dead
      case VitalStatus.dead:
        return greatGrandNiblings
            .where((pair) => pair.person.dead == true)
            .toList();
    }
  }
}
