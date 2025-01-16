import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/repository/relationship_repository.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/vital_status.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/usecases/get/get_person_relationship_pairs_from_relationships_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/model/info_models/person_relationship_pair.dart';

class GetAllFriendsUsecase {
  final RelationshipRepository _relationshipRepository;
  final GetPersonRelationshipPairsFromRelationshipsUsecase
      _getPersonRelationshipPairsFromRelationshipsUsecase;

  const GetAllFriendsUsecase(
    this._relationshipRepository,
    this._getPersonRelationshipPairsFromRelationshipsUsecase,
  );

  Future<List<PersonRelationshipPair>> execute({
    required int personID,
    required VitalStatus includeOnly,
  }) async {
    final List<Relationship> allFriendRelationships =
        await _relationshipRepository.getAllFriendsOf(personID);

    //return person relationship pairs
    return _getPersonRelationshipPairsFromRelationshipsUsecase.execute(
      mainPersonId: personID,
      relationships: allFriendRelationships,
      includeOnly: includeOnly,
    );
  }
}
