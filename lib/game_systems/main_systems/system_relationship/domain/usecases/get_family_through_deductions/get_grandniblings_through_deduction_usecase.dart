import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/model/info_models/person_platonic_relationship_type_pair.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_children_through_deduction_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_niblings_through_deduction_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/vital_status.dart';

class GetGrandNiblingsThroughDeductionUsecase {
  final GetChildrenThroughDeductionUsecase _getChildrenThroughDeductionUsecase;
  final GetNiblingsThroughDeductionUsecase _getNiblingsThroughDeductionUsecase;

  const GetGrandNiblingsThroughDeductionUsecase(
    this._getChildrenThroughDeductionUsecase,
    this._getNiblingsThroughDeductionUsecase,
  );

  Future<List<PersonPlatonicRelationshipTypePair>> execute({
    required int personID,
    required VitalStatus includeOnly,
  }) async {
    //GrandNiblings are the children of a person's niblings
    final List<PersonPlatonicRelationshipTypePair> grandNiblings = [];

    //helper inner function
    void addToGrandNiblingsList({
      required Person person,
      required bool addAsStepGrandNibling,
    }) {
      grandNiblings.add(
        PersonPlatonicRelationshipTypePair(
          person: person,
          platonicRelationshipType: (addAsStepGrandNibling)
              ? PlatonicRelationshipType.stepGrandNibling
              : PlatonicRelationshipType.grandNibling,
        ),
      );
    }

    //get person's niblings
    final List<PersonPlatonicRelationshipTypePair> allNiblings =
        await _getNiblingsThroughDeductionUsecase.execute(
      personID: personID,
      includeOnly: VitalStatus.livingAndDead,
    );

    //get children of each nibling
    for (var nibling in allNiblings) {
      //
      final List<PersonPlatonicRelationshipTypePair> niblingsChildren =
          await _getChildrenThroughDeductionUsecase.execute(
        personID: nibling.person.id,
        includeOnly: VitalStatus.livingAndDead,
      );

      //add each child to grandNiblings
      for (var niblingChild in niblingsChildren) {
        //if current nibling is a step nibling:
        //add all their children as step grandNibling
        if (nibling.platonicRelationshipType ==
            PlatonicRelationshipType.stepNibling) {
          addToGrandNiblingsList(
            person: niblingChild.person,
            addAsStepGrandNibling: true,
          );
        }
        //Not a step nibling:
        //if the child is a step Child of the nibling, then they are your step GrandNibling
        else if (niblingChild.platonicRelationshipType ==
            PlatonicRelationshipType.stepChild) {
          addToGrandNiblingsList(
            person: niblingChild.person,
            addAsStepGrandNibling: true,
          );
        }
        //Not a step nibling:
        //also not nibling's step child, we add as just GrandNibling
        else {
          addToGrandNiblingsList(
            person: niblingChild.person,
            addAsStepGrandNibling: false,
          );
        }
      }
    }

    //return based on request
    switch (includeOnly) {
      // return all
      case VitalStatus.livingAndDead:
        return grandNiblings;

      // return only living
      case VitalStatus.living:
        return grandNiblings
            .where((pair) => pair.person.dead == false)
            .toList();

      // return only dead
      case VitalStatus.dead:
        return grandNiblings.where((pair) => pair.person.dead == true).toList();
    }
  }
}
