import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/data/repository/relationship_repositories.dart';

class EndPartnerRelationshipUsecase {
  final RelationshipRepositories _relationshipRepositories;

  const EndPartnerRelationshipUsecase({
    required RelationshipRepositories relationshipRepositories,
  }) : _relationshipRepositories = relationshipRepositories;

  Future<void> execute({
    required int firstPartnerID,
    required int secondPartnerID,
    required int currentDay,
  }) async {
    //get main person and partner id
    //get their relationship
    //update the relationship to not active
    //reduce relationship level
    //update the end day

    //End relationship from the first person's point of view
    final Partner? firstPersonRelationship = await _relationshipRepositories
        .partnerRepositoryImpl
        .getAPartner(firstPartnerID, secondPartnerID);

    if (firstPersonRelationship != null) {
      final updatedRelationship = firstPersonRelationship.copyWith(
        isActive: false,
        endDay: currentDay,
        relationship: 10,
      );

      await _relationshipRepositories.partnerRepositoryImpl
          .updatePartner(updatedRelationship);
    }

    
    //End relationship from the second person's point of view
    final Partner? secondPersonRelationship = await _relationshipRepositories
        .partnerRepositoryImpl
        .getAPartner(secondPartnerID, firstPartnerID);

    if (secondPersonRelationship != null) {
      final updatedRelationship = secondPersonRelationship.copyWith(
        isActive: false,
        endDay: currentDay,
        relationship: 10,
      );

      await _relationshipRepositories.partnerRepositoryImpl
          .updatePartner(updatedRelationship);
    }
  }
}
