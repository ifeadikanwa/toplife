import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/relationship_repository.dart';

class UpdateRelationshipLevelUsecase {
  final RelationshipRepository _relationshipRepository;

  const UpdateRelationshipLevelUsecase(this._relationshipRepository);

  Future<void> execute({
    required int firstPersonID,
    required int secondPersonID,
    required int change,
  }) async {
    //get the relationship record, so that if the id arrangement is different we catch it
    final Relationship? relationshipRecord =
        await _relationshipRepository.getRelationship(
      firstPersonID,
      secondPersonID,
    );

    //if there is a valid record, update it

    if (relationshipRecord != null) {
      await _relationshipRepository.updateRelationship(
        relationshipRecord.copyWith(
          level: relationshipRecord.level + change,
        ),
      );
    }
  }
}
