import 'package:toplife/main_systems/system_relationship/data/repository/relationship_repositories.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/relative.dart';

class UpdateRelativeRelationshipUsecase {
  final RelationshipRepositories _relationshipRepositories;

  const UpdateRelativeRelationshipUsecase({
    required RelationshipRepositories relationshipRepositories,
  }) : _relationshipRepositories = relationshipRepositories;

  Future<void> execute(Relative relative) async {
    return await _relationshipRepositories.relativeRepositoryImpl
        .updateRelative(
      relative,
    );
  }
}
