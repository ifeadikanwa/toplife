import 'package:toplife/main_systems/system_relationship/data/repository/relationship_repositories.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/inlaw.dart';

class UpdateInLawRelationshipUsecase {
  final RelationshipRepositories _relationshipRepositories;

  const UpdateInLawRelationshipUsecase({
    required RelationshipRepositories relationshipRepositories,
  }) : _relationshipRepositories = relationshipRepositories;

  Future<void> execute(InLaw inLaw) async {
    return await _relationshipRepositories.inLawRepositoryImpl.updateInLaw(
      inLaw,
    );
  }
}
