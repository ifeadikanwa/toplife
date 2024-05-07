import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/constants/vital_status.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/person_relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/relationship_repository.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get/get_person_relationship_pairs_from_relationships_usecase.dart';

class GetAllAcquaintancesUsecase {
  final RelationshipRepository _relationshipRepository;
  final GetPersonRelationshipPairsFromRelationshipsUsecase
      _getPersonRelationshipPairsFromRelationshipsUsecase;

  const GetAllAcquaintancesUsecase(
    this._relationshipRepository,
    this._getPersonRelationshipPairsFromRelationshipsUsecase,
  );

  Future<List<PersonRelationshipPair>> execute({
    required int personId,
    required VitalStatus includeOnly,
  }) async {
    //
    final List<Relationship> allAcquaintanceRelationships =
        await _relationshipRepository.getAllAcquaintancesOf(personId);

    //return person relationship pairs
    return _getPersonRelationshipPairsFromRelationshipsUsecase.execute(
      mainPersonId: personId,
      relationships: allAcquaintanceRelationships,
      includeOnly: includeOnly,
    );
  }
}
