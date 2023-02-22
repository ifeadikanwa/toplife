import 'package:toplife/main_systems/system_relationship/data/repository/relationship_repositories.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

class UpdatePartnerRelationshipUsecase {
  final RelationshipRepositories _relationshipRepositories;

  const UpdatePartnerRelationshipUsecase({
    required RelationshipRepositories relationshipRepositories,
  }) : _relationshipRepositories = relationshipRepositories;

  Future<void> execute(Partner partner) async {
    return await _relationshipRepositories.partnerRepositoryImpl
        .updatePartner(partner);
  }
}