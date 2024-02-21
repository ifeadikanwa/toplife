import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/relationship_repository.dart';

class WatchAllRelationshipsInvolvingUsecase {
  final RelationshipRepository _relationshipRepository;

  const WatchAllRelationshipsInvolvingUsecase(this._relationshipRepository);

  Stream<List<Relationship>> execute({required int personID}) {
    return _relationshipRepository.watchAllRelationshipsInvolving(personID);
  }
}
