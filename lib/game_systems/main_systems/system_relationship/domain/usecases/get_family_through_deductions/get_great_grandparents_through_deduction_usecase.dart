import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/model/info_models/person_platonic_relationship_type_pair.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_grandparents_through_deduction_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_parents_through_deduction_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/vital_status.dart';

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
    required VitalStatus includeOnly,
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
      includeOnly: VitalStatus.livingAndDead,
    );

    //get parents of each person's grandparent
    for (var personsGrandParent in allPersonsGrandParents) {
      //
      final List<PersonPlatonicRelationshipTypePair>
          parentsOfPersonsGrandParent =
          await _getParentsThroughDeductionUsecase.execute(
        personID: personsGrandParent.person.id,
        includeOnly: VitalStatus.livingAndDead,
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

    //return based on request
    switch (includeOnly) {
      // return all
      case VitalStatus.livingAndDead:
        return greatGrandParents;

      // return only living
      case VitalStatus.living:
        return greatGrandParents
            .where((pair) => pair.person.dead == false)
            .toList();

      // return only dead
      case VitalStatus.dead:
        return greatGrandParents
            .where((pair) => pair.person.dead == true)
            .toList();
    }
  }
}
