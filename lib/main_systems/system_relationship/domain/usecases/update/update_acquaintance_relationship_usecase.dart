import 'package:toplife/main_systems/system_relationship/data/repository/relationship_repositories.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/acquaintance.dart';

class UpdateAcquaintanceRelationshipUsecase {
  final RelationshipRepositories _relationshipRepositories;

  const UpdateAcquaintanceRelationshipUsecase({
    required RelationshipRepositories relationshipRepositories,
  }) : _relationshipRepositories = relationshipRepositories;

  Future<void> execute(Acquaintance acquaintance) async {
    return await _relationshipRepositories.acquaintanceRepositoryImpl.updateAcquaintance(
      acquaintance,
    );
  }
}
