import 'package:toplife/main_systems/system_relationship/data/repository/relationship_repositories.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/child.dart';

class UpdateChildRelationshipUsecase {
  final RelationshipRepositories _relationshipRepositories;

  const UpdateChildRelationshipUsecase({
    required RelationshipRepositories relationshipRepositories,
  }) : _relationshipRepositories = relationshipRepositories;

  Future<void> execute(Child child) async {
    return await _relationshipRepositories.childRepositoryImpl.updateChild(
      child,
    );
  }
}
