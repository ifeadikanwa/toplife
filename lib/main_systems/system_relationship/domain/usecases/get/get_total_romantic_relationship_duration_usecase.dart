import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/romantic_relationship_info_repository.dart';

class GetTotalRomanticRelationshipDuration {
  final RomanticRelationshipInfoRepository _romanticRelationshipInfoRepository;

  GetTotalRomanticRelationshipDuration(
    this._romanticRelationshipInfoRepository,
  );

  Future<int?> execute({
    required int romanticRelationshipInfoID,
    required int currentDay,
    required bool activeRomance,
  }) async {
    //get the info
    final RomanticRelationshipInfo? romanticRelationshipInfo =
        await _romanticRelationshipInfoRepository
            .getRomanticRelationshipInfo(romanticRelationshipInfoID);

    if (romanticRelationshipInfo != null) {
      //first we add the cumulative duration, this is the length of all past relationships
      int totalDuration = romanticRelationshipInfo.cumulativeDuration;

      //check if it is active
      if (activeRomance) {
        //add the length of the current
        totalDuration += currentDay - romanticRelationshipInfo.startDay;
      }

      //return
      return totalDuration;
    }

    //if there is no valid romantic relationship info
    return null;
  }
}
