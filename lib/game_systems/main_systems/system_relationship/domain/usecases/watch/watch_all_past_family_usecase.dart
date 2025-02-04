import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/repository/relationship_repository.dart';

class WatchAllPastFamilyUsecase {
  final RelationshipRepository _relationshipRepository;

  const WatchAllPastFamilyUsecase(this._relationshipRepository);

  Stream<List<Relationship>> execute({required int personID}) {
    return _relationshipRepository.watchAllPastFamilyOf(personID);
  }
}
