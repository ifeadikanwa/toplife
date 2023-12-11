import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/relationship_repository.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/romantic_relationship_info_repository.dart';

class EndRomanticRelationshipAndReturnUpdatedObjectUsecase {
  final RelationshipRepository _relationshipRepository;
  final RomanticRelationshipInfoRepository _romanticRelationshipInfoRepository;

  const EndRomanticRelationshipAndReturnUpdatedObjectUsecase(
    this._relationshipRepository,
    this._romanticRelationshipInfoRepository,
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

    //if valid
    if (relationship != null) {
      //end the romantic relationship:

      //make inactive
      await _relationshipRepository.updateRelationship(
        relationship.copyWith(
          activeRomance: false,
        ),
      );

      //update romantic relationship info:
      final int? romanticRelationshipInfoID =
          relationship.romanticRelationshipInfoId;

      //if valid
      if (romanticRelationshipInfoID != null) {
        //
        final RomanticRelationshipInfo? romanticRelationshipInfo =
            await _romanticRelationshipInfoRepository
                .getRomanticRelationshipInfo(
          romanticRelationshipInfoID,
        );

        //if valid
        if (romanticRelationshipInfo != null) {
          //get the new cumulative duration
          //(length of the relationship ending now) + (cumulative length of all past relationships)
          final int cumulativeDuration =
              (currentDay - romanticRelationshipInfo.startDay) +
                  romanticRelationshipInfo.cumulativeDuration;

          //update cumulative duration and end day -> to the current day
          await _romanticRelationshipInfoRepository
              .updateRomanticRelationshipInfo(
            romanticRelationshipInfo.copyWith(
              endDay: currentDay,
              cumulativeDuration: cumulativeDuration,
            ),
          );
        }
      }

      //return the updated relationship
      return _relationshipRepository.getRelationship(
        firstPersonId,
        secondPersonId,
      );
    }

    //return null
    return null;
  }
}
