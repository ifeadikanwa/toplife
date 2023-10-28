import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/relationship_repository.dart';

class CreateRelationshipUsecase {
  final RelationshipRepository _relationshipRepository;

  const CreateRelationshipUsecase(this._relationshipRepository);

  Future<Relationship> execute({
    required Relationship relationship,
  }) async {
    //first check if a record for the 2 people exists
    final Relationship? dbRelationship =
        await _relationshipRepository.getRelationship(
      relationship.firstPersonId,
      relationship.secondPersonId,
    );

    //if the relationship does not exists
    if (dbRelationship == null) {
      //create relationship
      final Relationship createdRelationship =
          await _relationshipRepository.createRelationship(
        relationship,
      );

      return createdRelationship;
    }
    //if the relationship exists
    else {
      //change person id arrangement to match db record
      final Relationship updatedRelationship = relationship.copyWith(
        firstPersonId: dbRelationship.firstPersonId,
        secondPersonId: dbRelationship.secondPersonId,
      );
      //update record in database
      await _relationshipRepository.updateRelationship(updatedRelationship);

      return updatedRelationship;
    }
  }
}
