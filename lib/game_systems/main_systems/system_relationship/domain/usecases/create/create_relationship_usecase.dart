import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/existing_relationship_override_instruction.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/repository/relationship_repository.dart';

class CreateRelationshipUsecase {
  final RelationshipRepository _relationshipRepository;

  const CreateRelationshipUsecase(this._relationshipRepository);

  Future<Relationship> execute({
    required Relationship relationship,
    required ExistingRelationshipOverrideInstruction
        existingRelationshipOverrideInstruction,
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
      //record we are going to put in the db
      Relationship updatedRelationship = dbRelationship;

      //Manipulate it based on requests:

      switch (existingRelationshipOverrideInstruction) {
        
        //override nothing
        case ExistingRelationshipOverrideInstruction.nothing:
          //do nothing
          break;

        //override only platonic type
        case ExistingRelationshipOverrideInstruction
              .onlyPlatonicRelationshipType:

          //-update existing record with only platonic rel type
          updatedRelationship = updatedRelationship.copyWith(
            platonicRelationshipType: relationship.platonicRelationshipType,
          );
          break;

        //override only romantic type
        case ExistingRelationshipOverrideInstruction
              .onlyRomanticRelationshipType:
          //-update existing record with only romantic rel type
          updatedRelationship = updatedRelationship.copyWith(
            romanticRelationshipType: relationship.romanticRelationshipType,
          );
          break;

        //override both platonic and romantic type
        case ExistingRelationshipOverrideInstruction
              .platonicAndRomanticRelationshipType:

          //-update existing record with both platonic & romantic rel type
          updatedRelationship = updatedRelationship.copyWith(
            platonicRelationshipType: relationship.platonicRelationshipType,
            romanticRelationshipType: relationship.romanticRelationshipType,
          );
          break;

        //override everything
        case ExistingRelationshipOverrideInstruction.everything:
          //-change person id arrangement to match db record while copying
          updatedRelationship = relationship.copyWith(
            firstPersonId: dbRelationship.firstPersonId,
            secondPersonId: dbRelationship.secondPersonId,
          );
          break;
      }

      //update record in database
      await _relationshipRepository.updateRelationship(updatedRelationship);

      return updatedRelationship;
    }
  }
}
