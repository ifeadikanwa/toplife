import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/relationship_repository.dart';

class GetAllFriendsUsecase {
  final RelationshipRepository _relationshipRepository;

  GetAllFriendsUsecase(this._relationshipRepository);

  Future<List<Relationship>> execute({required int personID}) {
    return _relationshipRepository.getAllFriendsOf(personID);
  }
}
