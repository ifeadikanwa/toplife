import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/data/repository/relationship_repositories.dart';

class GetPiblingsUsecase {
  final RelationshipRepositories _relationshipRepositories;

  const GetPiblingsUsecase({
    required RelationshipRepositories relationshipRepositories,
  }) : _relationshipRepositories = relationshipRepositories;

  Future<List<Relative>> execute(int mainPersonID) async {
    return await _relationshipRepositories.relativeRepositoryImpl
        .getAllPiblings(mainPersonID);
  }
}
