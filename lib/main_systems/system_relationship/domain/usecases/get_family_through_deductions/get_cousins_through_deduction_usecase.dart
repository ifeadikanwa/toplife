import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_platonic_relationship_type_pair.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_children_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_piblings_through_deduction_usecase.dart';

class GetCousinsThroughDeductionUsecase {
  final GetChildrenThroughDeductionUsecase _getChildrenThroughDeductionUsecase;
  final GetPiblingsThroughDeductionUsecase _getPiblingsThroughDeductionUsecase;

  const GetCousinsThroughDeductionUsecase(
    this._getChildrenThroughDeductionUsecase,
    this._getPiblingsThroughDeductionUsecase,
  );

  Future<List<PersonPlatonicRelationshipTypePair>> execute({
    required int personID,
    required bool onlyLivingPeople,
  }) async {
    //Cousins are the children of a person's piblings
    final List<PersonPlatonicRelationshipTypePair> cousins = [];

    //helper inner function
    void addToCousinsList({
      required Person person,
      required bool addAsStepCousin,
    }) {
      cousins.add(
        PersonPlatonicRelationshipTypePair(
          person: person,
          platonicRelationshipType: (addAsStepCousin)
              ? PlatonicRelationshipType.stepCousin
              : PlatonicRelationshipType.cousin,
        ),
      );
    }

    //get person's piblngs
    final List<PersonPlatonicRelationshipTypePair> allPiblings =
        await _getPiblingsThroughDeductionUsecase.execute(
      personID: personID,
      onlyLivingPeople: false,
    );

    //get children of each piblings
    for (var pibling in allPiblings) {
      //
      final List<PersonPlatonicRelationshipTypePair> piblingsChildren =
          await _getChildrenThroughDeductionUsecase.execute(
        personID: pibling.person.id,
        onlyLivingPeople: false,
      );

      //add each child to cousins
      for (var piblingChild in piblingsChildren) {
        //if current pibling is a step pibling:
        //add all their children as step cousin
        if (pibling.platonicRelationshipType ==
            PlatonicRelationshipType.stepPibling) {
          addToCousinsList(
            person: piblingChild.person,
            addAsStepCousin: true,
          );
        }
        //Not a step pibling:
        //if the child is a step Child of the pibling, then they are your step Cousin
        else if (piblingChild.platonicRelationshipType ==
            PlatonicRelationshipType.stepChild) {
          addToCousinsList(
            person: piblingChild.person,
            addAsStepCousin: true,
          );
        }
        //Not a step pibling:
        //also not pibling's step child, we add as just Cousin
        else {
          addToCousinsList(
            person: piblingChild.person,
            addAsStepCousin: false,
          );
        }
      }
    }

    //return based on request

    return (onlyLivingPeople)
        ? cousins.where((pair) => pair.person.dead == false).toList()
        : cousins;
  }
}
