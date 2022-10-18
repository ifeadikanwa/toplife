import 'package:toplife/main_systems/system_relationship/data/repository/relationship_repositories.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/child.dart';

class GetChildrenUsecase {
  final RelationshipRepositories _relationshipRepositories;

  const GetChildrenUsecase({
    required RelationshipRepositories relationshipRepositories,
  }) : _relationshipRepositories = relationshipRepositories;

  Future<List<Child>> execute(int mainPersonID) async {
    return await _relationshipRepositories.childRepositoryImpl.getAllChildren(
      mainPersonID,
    );
  }
}
