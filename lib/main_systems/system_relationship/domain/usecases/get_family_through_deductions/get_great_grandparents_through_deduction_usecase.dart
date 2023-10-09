import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_platonic_relationship_type_pair.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_grandparents_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_parents_through_deduction_usecase.dart';

class GetGreatGrandParentsThroughDeductionUsecase {
  final GetParentsThroughDeductionUsecase _getParentsThroughDeductionUsecase;
  final GetGrandParentsThroughDeductionUsecase
      _getGrandParentsThroughDeductionUsecase;

  const GetGreatGrandParentsThroughDeductionUsecase(
    this._getParentsThroughDeductionUsecase,
    this._getGrandParentsThroughDeductionUsecase,
  );

  Future<List<PersonPlatonicRelationshipTypePair>> execute({
    required int personID,
  }) async {
    //greatGrandParents are the parents of a person's grandparents
    final List<PersonPlatonicRelationshipTypePair> greatGrandParents = [];

    //helper inner function
    void addToGreatGrandParentsList({
      required Person person,
      required bool addAsStepGreatGrandParent,
    }) {
      greatGrandParents.add(
        PersonPlatonicRelationshipTypePair(
          person: person,
          platonicRelationshipType: (addAsStepGreatGrandParent)
              ? PlatonicRelationshipType.stepGreatGrandParent
              : PlatonicRelationshipType.greatGrandParent,
        ),
      );
    }

    //get person's grandparents
    final List<PersonPlatonicRelationshipTypePair> allPersonsGrandParents =
        await _getGrandParentsThroughDeductionUsecase.execute(
      personID: personID,
    );

    //get parents of each person's grandparent
    for (var personsGrandParent in allPersonsGrandParents) {
      //
      final List<PersonPlatonicRelationshipTypePair>
          parentsOfPersonsGrandParent =
          await _getParentsThroughDeductionUsecase.execute(
        personID: personsGrandParent.person.id,
      );

      //add each to greatGrandParents
      for (var parentOfPersonsGrandParent in parentsOfPersonsGrandParent) {
        //if current person's grandparent is a step grandparent:
        //add all their parents as step greatGrandParent
        if (personsGrandParent.platonicRelationshipType ==
            PlatonicRelationshipType.stepGrandParent) {
          addToGreatGrandParentsList(
            person: parentOfPersonsGrandParent.person,
            addAsStepGreatGrandParent: true,
          );
        }
        //Not person's step grandparent:
        //if the parent of person's grandparent is a step parent, then they are your step GreatGrandParent
        else if (parentOfPersonsGrandParent.platonicRelationshipType ==
            PlatonicRelationshipType.stepParent) {
          addToGreatGrandParentsList(
            person: parentOfPersonsGrandParent.person,
            addAsStepGreatGrandParent: true,
          );
        }
        //Not person's step grandparent:
        //also not step parent of person's grandparent, we add as just GreatGrandParent
        else {
          addToGreatGrandParentsList(
            person: parentOfPersonsGrandParent.person,
            addAsStepGreatGrandParent: false,
          );
        }
      }
    }

    return greatGrandParents;
  }
}
