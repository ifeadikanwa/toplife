import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/relationship_repository.dart';

class UpdateRelationshipUsecase {
  final RelationshipRepository _relationshipRepository;

  const UpdateRelationshipUsecase(this._relationshipRepository);

  Future<void> execute({required Relationship relationship}) async {
    //get the relationship record, so that if the id arrangement is different we catch it

    final Relationship? relationshipRecord =
        await _relationshipRepository.getRelationship(
      relationship.firstPersonId,
      relationship.secondPersonId,
    );

    //if there is a valid record, update it

    if (relationshipRecord != null) {
      //copy over the id arrangement of the existing record we found
      await _relationshipRepository.updateRelationship(
        relationship.copyWith(
          firstPersonId: relationshipRecord.firstPersonId,
          secondPersonId: relationshipRecord.secondPersonId,
        ),
      );
    }
  }
}
