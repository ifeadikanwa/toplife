import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/model/info_models/person_id_pair.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/model/info_models/person_platonic_relationship_type_pair.dart';
import 'package:toplife/game_systems/main_systems/system_person/util/get_unknown_id_from_person_id_pair.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/repository/relationship_repository.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_parents_through_deduction_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/vital_status.dart';

class GetParentInLawsThroughDeductionUsecase {
  final GetParentsThroughDeductionUsecase _getParentsThroughDeductionUsecase;
  final RelationshipRepository _relationshipRepository;

  const GetParentInLawsThroughDeductionUsecase(
    this._getParentsThroughDeductionUsecase,
    this._relationshipRepository,
  );

  Future<List<PersonPlatonicRelationshipTypePair>> execute({
    required int personID,
    required VitalStatus includeOnly,
  }) async {
    //Parent in laws are person's spouse parents
    List<PersonPlatonicRelationshipTypePair> parentInLaws = [];

    //get spouse
    final Relationship? personsSpouseRelationship =
        await _relationshipRepository.getMarriagePartnerRelationship(personID);

    //if there is a spouse
    if (personsSpouseRelationship != null) {
      //find the spouse person id
      //whichever id is NOT the main person id is the spouse id
      final int spouseID = getUnkownIdFromPersonIdPair(
        personIdPair: PersonIdPair(
          firstId: personsSpouseRelationship.firstPersonId,
          secondId: personsSpouseRelationship.secondPersonId,
        ),
        knownId: personID,
      );

      //get spouses parents
      final List<PersonPlatonicRelationshipTypePair> spousesParents =
          await _getParentsThroughDeductionUsecase.execute(
        personID: spouseID,
        includeOnly: VitalStatus.livingAndDead,
      );

      //add each to the parentinlaws list
      for (var spouseParent in spousesParents) {
        parentInLaws.add(
          PersonPlatonicRelationshipTypePair(
            person: spouseParent.person,
            platonicRelationshipType: PlatonicRelationshipType.parentInLaw,
          ),
        );
      }
    }

    //return based on request
    switch (includeOnly) {
      // return all
      case VitalStatus.livingAndDead:
        return parentInLaws;

      // return only living
      case VitalStatus.living:
        return parentInLaws.where((pair) => pair.person.dead == false).toList();

      // return only dead
      case VitalStatus.dead:
        return parentInLaws.where((pair) => pair.person.dead == true).toList();
    }
  }
}
