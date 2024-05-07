import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/repository/relationship_repository.dart';

class GetRelationshipUsecase {
  final RelationshipRepository _relationshipRepository;

  const GetRelationshipUsecase(this._relationshipRepository);

  Future<Relationship?> execute({
    required int firstPersonID,
    required int secondPersonID,
  }) {
    return _relationshipRepository.getRelationship(
      firstPersonID,
      secondPersonID,
    );
  }
}
