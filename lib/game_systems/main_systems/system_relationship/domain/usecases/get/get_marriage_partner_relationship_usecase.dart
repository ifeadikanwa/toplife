import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/repository/relationship_repository.dart';

class GetMarriagePartnerRelationshipUsecase {
  final RelationshipRepository _relationshipRepository;

  const GetMarriagePartnerRelationshipUsecase(this._relationshipRepository);

  Future<Relationship?> execute({required int personID}) {
    return _relationshipRepository.getMarriagePartnerRelationship(personID);
  }
}
