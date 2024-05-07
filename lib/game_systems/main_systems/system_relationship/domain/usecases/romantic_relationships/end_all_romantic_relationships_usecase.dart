import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/repository/relationship_repository.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/usecases/romantic_relationships/end_romantic_relationship_and_return_updated_object_usecase.dart';

class EndAllActiveRomanticRelationshipsUsecase {
  final RelationshipRepository _relationshipRepository;
  final EndRomanticRelationshipAndReturnUpdatedObjectUsecase
      _endRomanticRelationshipAndReturnUpdatedObjectUsecase;

  const EndAllActiveRomanticRelationshipsUsecase(
    this._relationshipRepository,
    this._endRomanticRelationshipAndReturnUpdatedObjectUsecase,
  );

  Future<void> execute({
    required int mainPersonId,
    required int currentDay,
  }) async {
    //get all active romantic relationships
    final List<Relationship> activeRomanticRelationships =
        await _relationshipRepository.getAllActivePartnersOf(mainPersonId);

    //for every relationship on the list, end it
    for (var activeRomanticRelationship in activeRomanticRelationships) {
      await _endRomanticRelationshipAndReturnUpdatedObjectUsecase.execute(
        firstPersonId: activeRomanticRelationship.firstPersonId,
        secondPersonId: activeRomanticRelationship.secondPersonId,
        currentDay: currentDay,
      );
    }
  }
}
