import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/constants/vital_status.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/person_platonic_relationship_type_pair.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_parents_through_deduction_usecase.dart';

class GetAllParentAdditionsToTheFamilyFromFamilyMembersSpouseUsecase {
  final GetParentsThroughDeductionUsecase _getParentsThroughDeductionUsecase;

  const GetAllParentAdditionsToTheFamilyFromFamilyMembersSpouseUsecase(
    this._getParentsThroughDeductionUsecase,
  );

  //only parents of step parents and step grandparents get added to the family through npc marriage
  Future<List<PersonPlatonicRelationshipTypePair>> execute({
    required int spouseID,
    required PlatonicRelationshipType spouseRelationshipToPlayer,
  }) async {
    final Set<PersonPlatonicRelationshipTypePair> stepGrandParents = {};
    final Set<PersonPlatonicRelationshipTypePair> stepGreatGrandParents = {};

    //we get all living AND dead parents so we can catch all predecessors even if their parents are dead

    if (spouseRelationshipToPlayer == PlatonicRelationshipType.stepParent) {
      //get living AND dead step grandparents
      stepGrandParents.addAll(
        await getParentsAsSpecifiedType(
          personID: spouseID,
          platonicRelationshipType: PlatonicRelationshipType.stepGrandParent,
        ),
      );

      //then get living AND dead step greatgrandparents
      for (var stepGrandParent in stepGrandParents) {
        //add to main set
        stepGreatGrandParents.addAll(
          await getParentsAsSpecifiedType(
            personID: stepGrandParent.person.id,
            platonicRelationshipType:
                PlatonicRelationshipType.stepGreatGrandParent,
          ),
        );
      }
    } else if (spouseRelationshipToPlayer ==
        PlatonicRelationshipType.stepGrandParent) {
      //get living AND dead step greatgrandparents
      stepGreatGrandParents.addAll(
        await getParentsAsSpecifiedType(
          personID: spouseID,
          platonicRelationshipType:
              PlatonicRelationshipType.stepGreatGrandParent,
        ),
      );
    }

    //return combo of both lists
    return [
      ...stepGrandParents,
      ...stepGreatGrandParents,
    ];
  }

  //helper function to do repeating task
  Future<List<PersonPlatonicRelationshipTypePair>> getParentsAsSpecifiedType({
    required int personID,
    required PlatonicRelationshipType platonicRelationshipType,
  }) async {
    //get living AND dead parents
    final List<Person> aliveParents =
        (await _getParentsThroughDeductionUsecase.execute(
      personID: personID,
      includeOnly: VitalStatus.livingAndDead,
    ))
            .map((e) => e.person)
            .toList();

    //map and return
    return aliveParents
        .map(
          (person) => PersonPlatonicRelationshipTypePair(
            person: person,
            platonicRelationshipType: platonicRelationshipType,
          ),
        )
        .toList();
  }
}
