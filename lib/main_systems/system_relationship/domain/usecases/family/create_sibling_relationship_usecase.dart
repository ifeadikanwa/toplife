import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/stats/get_valid_random_stats_value.dart';
import 'package:toplife/main_systems/system_relationship/constants/sibling_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/data/repository/relationship_repositories.dart';

class CreateSiblingRelationshipUsecase {
  final RelationshipRepositories _relationshipRepositories;

  const CreateSiblingRelationshipUsecase({
    required RelationshipRepositories relationshipRepositories,
  }) : _relationshipRepositories = relationshipRepositories;

  Future<void> execute({
    required int mainPersonID,
    required int siblingID,
    required SiblingRelationshipType siblingRelationshipType,
  }) async {
    await _relationshipRepositories.siblingRepositoryImpl.createSibling(
      Sibling(
        mainPersonId: mainPersonID,
        siblingId: siblingID,
        siblingRelationshipType: siblingRelationshipType.name,
        relationship: getValidRandomStatsValue(minValue: 40),
      ),
    );
  }
}
