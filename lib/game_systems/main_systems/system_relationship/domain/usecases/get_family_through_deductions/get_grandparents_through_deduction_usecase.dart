import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/model/info_models/person_platonic_relationship_type_pair.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_parents_through_deduction_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/vital_status.dart';

class GetGrandParentsThroughDeductionUsecase {
  final GetParentsThroughDeductionUsecase _getParentsThroughDeductionUsecase;

  const GetGrandParentsThroughDeductionUsecase(
    this._getParentsThroughDeductionUsecase,
  );

  Future<List<PersonPlatonicRelationshipTypePair>> execute({
    required int personID,
    required VitalStatus includeOnly,
  }) async {
    //GrandParents are the parents of a person's parents
    final List<PersonPlatonicRelationshipTypePair> grandParents = [];

    //helper inner function
    void addToGrandParentsList({
      required Person person,
      required bool addAsStepGrandParent,
    }) {
      grandParents.add(
        PersonPlatonicRelationshipTypePair(
          person: person,
          platonicRelationshipType: (addAsStepGrandParent)
              ? PlatonicRelationshipType.stepGrandParent
              : PlatonicRelationshipType.grandParent,
        ),
      );
    }

    //get person's parents
    final List<PersonPlatonicRelationshipTypePair> allPersonsParents =
        await _getParentsThroughDeductionUsecase.execute(
      personID: personID,
      includeOnly: VitalStatus.livingAndDead,
    );

    //get parents of each person's parent
    for (var personsParent in allPersonsParents) {
      //
      final List<PersonPlatonicRelationshipTypePair> parentsOfPersonsParent =
          await _getParentsThroughDeductionUsecase.execute(
        personID: personsParent.person.id,
        includeOnly: VitalStatus.livingAndDead,
      );

      //add each to grandParents
      for (var parentOfPersonsParent in parentsOfPersonsParent) {
        //if current person's parent is a step parent:
        //add all their parents as step grandParent
        if (personsParent.platonicRelationshipType ==
            PlatonicRelationshipType.stepParent) {
          addToGrandParentsList(
            person: parentOfPersonsParent.person,
            addAsStepGrandParent: true,
          );
        }
        //Not person's step parent:
        //if the parent of person's parent is a step parent, then they are your step GrandParent
        else if (parentOfPersonsParent.platonicRelationshipType ==
            PlatonicRelationshipType.stepParent) {
          addToGrandParentsList(
            person: parentOfPersonsParent.person,
            addAsStepGrandParent: true,
          );
        }
        //Not person's step parent:
        //also not step parent of person's parent, we add as just GrandParent
        else {
          addToGrandParentsList(
            person: parentOfPersonsParent.person,
            addAsStepGrandParent: false,
          );
        }
      }
    }

    //return based on request
    switch (includeOnly) {
      // return all
      case VitalStatus.livingAndDead:
        return grandParents;

      // return only living
      case VitalStatus.living:
        return grandParents.where((pair) => pair.person.dead == false).toList();

      // return only dead
      case VitalStatus.dead:
        return grandParents.where((pair) => pair.person.dead == true).toList();
    }
  }
}
