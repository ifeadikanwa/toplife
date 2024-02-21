import 'package:toplife/core/data_source/drift_database/database_provider.dart';

class GetTotalRomanticRelationshipDuration {
  const GetTotalRomanticRelationshipDuration();

  int execute({
    required int currentDay,
    required Relationship relationship,
  }) {
    //first we add the cumulative duration, this is the length of all past relationships
    int totalDuration = relationship.romanceCumulativeDuration;

    //check if it is active
    if (relationship.activeRomance) {
      //add the length of the current
      totalDuration += currentDay - relationship.romanceStartDay;
    }

    //return
    return totalDuration;
  }
}
