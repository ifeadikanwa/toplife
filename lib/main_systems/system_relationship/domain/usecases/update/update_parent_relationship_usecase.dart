import 'package:toplife/main_systems/system_relationship/data/repository/relationship_repositories.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/parent.dart';

class UpdateParentRelationshipUsecase {
  final RelationshipRepositories _relationshipRepositories;

  const UpdateParentRelationshipUsecase({
    required RelationshipRepositories relationshipRepositories,
  }) : _relationshipRepositories = relationshipRepositories;

  Future<void> execute(Parent parent) async {
    return await _relationshipRepositories.parentRepositoryImpl.updateParent(
      parent,
    );
  }
}
