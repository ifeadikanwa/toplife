import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_platonic_relationship_type_pair.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_children_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_siblings_through_deduction_usecase.dart';

class GetNiblingsThroughDeductionUsecase {
  final GetChildrenThroughDeductionUsecase _getChildrenThroughDeductionUsecase;
  final GetSiblingsThroughDeductionUsecase _getSiblingsThroughDeductionUsecase;

  const GetNiblingsThroughDeductionUsecase(
    this._getChildrenThroughDeductionUsecase,
    this._getSiblingsThroughDeductionUsecase,
  );

  Future<List<PersonPlatonicRelationshipTypePair>> execute({
    required int personID,
    required bool onlyLivingPeople,
  }) async {
    //Niblings are the children of a person's siblings
    final List<PersonPlatonicRelationshipTypePair> niblings = [];

    //helper inner function
    void addToNiblingsList({
      required Person person,
      required bool addAsStepNibling,
    }) {
      niblings.add(
        PersonPlatonicRelationshipTypePair(
          person: person,
          platonicRelationshipType: (addAsStepNibling)
              ? PlatonicRelationshipType.stepNibling
              : PlatonicRelationshipType.nibling,
        ),
      );
    }

    //get person's siblings
    final List<PersonPlatonicRelationshipTypePair> allSiblings =
        await _getSiblingsThroughDeductionUsecase.execute(
      personID: personID,
      onlyLivingPeople: false,
    );

    //get children of each sibling
    for (var sibling in allSiblings) {
      //
      final List<PersonPlatonicRelationshipTypePair> siblingsChildren =
          await _getChildrenThroughDeductionUsecase.execute(
        personID: sibling.person.id,
        onlyLivingPeople: false,
      );

      //add each child to niblings
      for (var siblingChild in siblingsChildren) {
        //if current sibling is a step sibling:
        //add all their children as step nibling
        if (sibling.platonicRelationshipType ==
            PlatonicRelationshipType.stepSibling) {
          addToNiblingsList(
            person: siblingChild.person,
            addAsStepNibling: true,
          );
        }
        //Not a step sibling:
        //if the child is a step Child of the sibling, then they are your step Nibling
        else if (siblingChild.platonicRelationshipType ==
            PlatonicRelationshipType.stepChild) {
          addToNiblingsList(
            person: siblingChild.person,
            addAsStepNibling: true,
          );
        }
        //Not a step sibling:
        //also not sibling's step child, we add as just Nibling
        else {
          addToNiblingsList(
            person: siblingChild.person,
            addAsStepNibling: false,
          );
        }
      }
    }

  //return based on request
    return (onlyLivingPeople)
        ? niblings.where((pair) => pair.person.dead == false).toList()
        : niblings;
  }
}
