import 'package:toplife/core/utils/stats/stats_range/stats_range.dart';

double remapValueInRangeToAnyRange({
  required StatsRange oldStatsRange,
  required int oldValue,
  required StatsRange newStatsRange,
}) {
  //handle possible error cases
  if (oldStatsRange.min == oldStatsRange.max) {
    return 0.0;
  }

  //do calculation
  final int oldScale = oldStatsRange.max - oldStatsRange.min;
  final int newScale = newStatsRange.max - newStatsRange.min;

  final double newValue =
      (((oldValue - oldStatsRange.min) * newScale) / oldScale) +
          newStatsRange.min;

  return newValue;
}
