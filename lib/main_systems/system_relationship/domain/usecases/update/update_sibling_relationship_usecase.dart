import 'package:toplife/main_systems/system_relationship/data/repository/relationship_repositories.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

class UpdateSiblingRelationshipUsecase {
  final RelationshipRepositories _relationshipRepositories;

  const UpdateSiblingRelationshipUsecase({
    required RelationshipRepositories relationshipRepositories,
  }) : _relationshipRepositories = relationshipRepositories;

  Future<void> execute(Sibling sibling) async {
    return await _relationshipRepositories.siblingRepositoryImpl.updateSibling(
      sibling,
    );
  }
}
