import 'package:toplife/main_systems/system_relationship/data/repository/relationship_repositories.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/sibling.dart';

class GetSiblingsUsecase {
  final RelationshipRepositories _relationshipRepositories;

  const GetSiblingsUsecase({
    required RelationshipRepositories relationshipRepositories,
  }) : _relationshipRepositories = relationshipRepositories;

  Future<List<Sibling>> execute(int mainPersonID) async {
    return await _relationshipRepositories.siblingRepositoryImpl.getAllSiblings(
      mainPersonID,
    );
  }
}
