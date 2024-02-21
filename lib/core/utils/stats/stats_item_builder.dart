import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/utils/stats/stats_range/stats_range_constants.dart';
import 'package:toplife/core/utils/stats/stats_item.dart';

class StatsItemBuilder {
  //Default
  static StatsItem defaultStat({
    required String statsName,
    required int statsLevel,
  }) {
    return StatsItem(
      statsName: statsName,
      statsLevel: statsLevel,
      statsRange: StatsRangeConstants.defaultRange,
      positiveIsAlwaysGreen: false,
    );
  }

  //Relationship
  static StatsItem relationshipStat({
    required int relationshipAmount,
  }) {
    return StatsItem(
      statsName: TextConstants.relationship,
      statsLevel: relationshipAmount,
      statsRange: StatsRangeConstants.relationshipRange,
      positiveIsAlwaysGreen: true,
    );
  }
}
