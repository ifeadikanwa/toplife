import 'package:toplife/main_systems/system_relationship/data/repository/relationship_repositories.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/partner.dart';

class GetCurrentPartnerUsecase {
  final RelationshipRepositories _relationshipRepositories;

  const GetCurrentPartnerUsecase({
    required RelationshipRepositories relationshipRepositories,
  }) : _relationshipRepositories = relationshipRepositories;

  Future<Partner?> execute(int mainPersonID) async {
    return await _relationshipRepositories.partnerRepositoryImpl
        .getCurrentPartner(mainPersonID);
  }
}
