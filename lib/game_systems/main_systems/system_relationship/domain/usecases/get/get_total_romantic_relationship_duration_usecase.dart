import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/romantic_relationship_type.dart';

class GetTotalRomanticRelationshipDuration {
  const GetTotalRomanticRelationshipDuration();

  int? execute({
    required int currentDay,
    required Relationship relationship,
  }) {
    //if there is no romantic relationship, return null
    if (relationship.romanticRelationshipType ==
        RomanticRelationshipType.none.name) {
      return null;
    }

    //if there is a romantic relationship, calculate the duration

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
