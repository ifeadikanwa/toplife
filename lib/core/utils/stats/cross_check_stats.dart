import 'package:toplife/core/utils/stats/stats_range/stats_range.dart';

const int defaultMaxStatsValue = 100;

int crossCheckStat({
  required int stat,
  required StatsRange statsRange,
}) {
  //if it is less than min
  if (stat < statsRange.min) {
    return statsRange.min;
  }
  //if it is greater than max
  else if (stat > statsRange.max) {
    return statsRange.max;
  }
  //if it gets here it is in the range
  else {
    return stat;
  }
}
