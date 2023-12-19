import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/relationship_repository.dart';

class EndRomanticRelationshipAndReturnUpdatedObjectUsecase {
  final RelationshipRepository _relationshipRepository;

  const EndRomanticRelationshipAndReturnUpdatedObjectUsecase(
    this._relationshipRepository,
  );

  Future<Relationship?> execute({
    required int firstPersonId,
    required int secondPersonId,
    required int currentDay,
  }) async {
    //get the relationship
    final Relationship? relationship =
        await _relationshipRepository.getRelationship(
      firstPersonId,
      secondPersonId,
    );

    //if valid and still active, end the romantic relationship:
    if (relationship != null) {
      //if relationship is active make changes to end it
      if (relationship.activeRomance) {
        //get the new cumulative duration
        //(length of the relationship ending now) + (cumulative length of all past relationships)
        final int cumulativeDuration =
            (currentDay - relationship.romanceStartDay) +
                relationship.romanceCumulativeDuration;

        //update relationship:
        //active romance = false
        // cumulative duration = new duration
        // and end day = current day
        await _relationshipRepository.updateRelationship(
          relationship.copyWith(
            activeRomance: false,
            romanceCumulativeDuration: cumulativeDuration,
            romanceEndDay: currentDay,
          ),
        );

        //return the updated relationship
        return _relationshipRepository.getRelationship(
          firstPersonId,
          secondPersonId,
        );
      }

      //else relationship is NOT active
      //return it as it is
      return relationship;
    }

    //return null
    return null;
  }
}
