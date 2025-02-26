import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/repository/relationship_repository.dart';

class WatchRelationshipUsecase {
  final RelationshipRepository _relationshipRepository;

  const WatchRelationshipUsecase(this._relationshipRepository);

  Stream<Relationship?> execute({
    required int firstPersonId,
    required int secondPersonId,
  }) {
    return _relationshipRepository.watchRelationship(
      firstPersonId,
      secondPersonId,
    );
  }
}
