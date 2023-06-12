import 'package:toplife/core/utils/stats/stats_range/stats_range.dart';

class StatsRangeConstants {
  static const StatsRange defaultRange = StatsRange(
    min: 0,
    max: 100,
  );

  static const StatsRange positivePercentageRange = StatsRange(
    min: 0,
    max: 100,
  );

 static const StatsRange negativePercentageRange = StatsRange(
    min: -100,
    max: 0,
  );

  static const StatsRange relationshipRange = StatsRange(
    min: -100,
    max: 100,
  );
}
