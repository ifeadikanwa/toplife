import 'package:toplife/main_systems/system_relationship/constants/partner_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/data/repository/relationship_repositories.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/partner.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/romantic/end_all_partner_relationship_not_involving_a_certain_person_usecase.dart';

class CreateExclusiveRomanticRelationshipUsecase {
  final RelationshipRepositories _relationshipRepositories;
  final EndAllPartnerRelationshipsNotInvolvingACertainPersonUsecase
      _endAllPartnerRelationshipsNotInvolvingACertainPersonUsecase;

  const CreateExclusiveRomanticRelationshipUsecase({
    required RelationshipRepositories relationshipRepositories,
    required EndAllPartnerRelationshipsNotInvolvingACertainPersonUsecase
        endAllPartnerRelationshipsNotInvolvingACertainPersonUsecase,
  })  : _relationshipRepositories = relationshipRepositories,
        _endAllPartnerRelationshipsNotInvolvingACertainPersonUsecase =
            endAllPartnerRelationshipsNotInvolvingACertainPersonUsecase;

  Future<void> execute({
    required int mainPersonID,
    required int partnerID,
    String metAt = "Online",
    required PartnerRelationshipType partnerRelationshipType,
    required int currentDay,
  }) async {
    //make sure all active romantic relationships are ended for both partners
    _endAllPartnerRelationshipsNotInvolvingACertainPersonUsecase.execute(
      mainPersonID: mainPersonID,
      partnerID: partnerID,
      currentDay: currentDay,
    );

    //create the relationship from both partners point of view
    _createRomanticRelationship(
      mainPersonID: mainPersonID,
      partnerID: partnerID,
      partnerRelationshipType: partnerRelationshipType,
      currentDay: currentDay,
    );

    _createRomanticRelationship(
      mainPersonID: partnerID,
      partnerID: mainPersonID,
      partnerRelationshipType: partnerRelationshipType,
      currentDay: currentDay,
    );
  }

  Future<void> _createRomanticRelationship({
    required int mainPersonID,
    required int partnerID,
    String metAt = "Online",
    required PartnerRelationshipType partnerRelationshipType,
    required int currentDay,
  }) async {
    final Partner? existingRelationship = await _relationshipRepositories
        .partnerRepositoryImpl
        .getAPartner(mainPersonID, partnerID);

    //If there is an existing relationship edit it
    if (existingRelationship != null) {
      final relationshipIsActive = existingRelationship.isActive;
      final Partner updatedRelationship = existingRelationship.copyWith(
        isActive: true,
        startDay: relationshipIsActive ? null : currentDay,
        endDay: 0,
        relationship: 100,
        partnerRelationshipType: partnerRelationshipType.name,
      );

      await _relationshipRepositories.partnerRepositoryImpl
          .updatePartner(updatedRelationship);
    }
    //if there isn't an existing relationship then create one.
    else {
      final Partner relationship = Partner(
        mainPersonID: mainPersonID,
        partnerID: partnerID,
        partnerRelationshipType: partnerRelationshipType.name,
        isActive: true,
        startDay: currentDay,
        isCoParent: false,
        metAt: metAt,
        relationship: 100,
      );

      await _relationshipRepositories.partnerRepositoryImpl
          .createPartner(relationship);
    }
  }
}
