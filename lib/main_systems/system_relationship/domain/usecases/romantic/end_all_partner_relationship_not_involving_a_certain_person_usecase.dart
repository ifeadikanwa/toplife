import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/data/repository/relationship_repositories.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/romantic/end_partner_relationship_usecase.dart';

class EndAllPartnerRelationshipsNotInvolvingACertainPersonUsecase {
  final RelationshipRepositories _relationshipRepositories;
  final EndPartnerRelationshipUsecase _endPartnerRelationshipUsecase;

  const EndAllPartnerRelationshipsNotInvolvingACertainPersonUsecase({
    required RelationshipRepositories relationshipRepositories,
    required EndPartnerRelationshipUsecase endPartnerRelationshipUsecase,
  })  : _relationshipRepositories = relationshipRepositories,
        _endPartnerRelationshipUsecase = endPartnerRelationshipUsecase;

  Future<void> execute({
    required int mainPersonID,
    required int partnerID,
    required int currentDay,
  }) async {
    //get all the active relationships for a main person
    //if the other person isnt the partner:
    //update the relationship to end

    //End all the main persons relationship
    final List<Partner> mainPersonActiveRelationships =
        await _relationshipRepositories.partnerRepositoryImpl
            .getAllActivePartners(mainPersonID);

    for (var relationship in mainPersonActiveRelationships) {
      if (relationship.partnerId != partnerID) {
        _endPartnerRelationshipUsecase.execute(
          firstPartnerID: relationship.mainPersonId,
          secondPartnerID: relationship.partnerId,
          currentDay: currentDay,
        );
      }
    }

    //End all the partners relationship
    final List<Partner> partnerActiveRelationships =
        await _relationshipRepositories.partnerRepositoryImpl
            .getAllActivePartners(partnerID);

    for (var relationship in partnerActiveRelationships) {
      if (relationship.partnerId != mainPersonID) {
        _endPartnerRelationshipUsecase.execute(
          firstPartnerID: relationship.mainPersonId,
          secondPartnerID: relationship.partnerId,
          currentDay: currentDay,
        );
      }
    }
  }
}
