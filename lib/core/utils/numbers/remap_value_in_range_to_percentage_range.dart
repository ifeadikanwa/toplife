import 'package:toplife/core/utils/numbers/remap_value_in_range_to_any_range.dart';
import 'package:toplife/core/utils/stats/stats_range/stats_range.dart';
import 'package:toplife/core/utils/stats/stats_range/stats_range_constants.dart';

int remapValueInRangeToPercentageRange({
  required StatsRange statsRange,
  required int rangeValue,
}) {
  //check if min is a negative number and max is a positive number
  if (statsRange.min.isNegative && statsRange.max > 0) {
    //we split the oldrange into 2
    //rangemin -> 0 (negative)
    //0 -> rangemax (positive)

    //if range value is negative we use the negative range
    if (rangeValue.isNegative) {
      return remapValueInRangeToAnyRange(
        oldStatsRange: StatsRange(
          min: statsRange.min,
          max: 0,
        ),
        oldValue: rangeValue,
        newStatsRange: StatsRangeConstants.negativePercentageRange,
      ).toInt();
    }

    //else we use the positive range
    else {
      return remapValueInRangeToAnyRange(
        oldStatsRange: StatsRange(
          min: 0,
          max: statsRange.max,
        ),
        oldValue: rangeValue,
        newStatsRange: StatsRangeConstants.positivePercentageRange,
      ).toInt();
    }
  }
  //if min and max are both negative
  else if (statsRange.min.isNegative && statsRange.max.isNegative) {
    //we find the negative percentage
    return -(remapValueInRangeToAnyRange(
      oldStatsRange: statsRange,
      oldValue: rangeValue,
      newStatsRange: StatsRangeConstants.positivePercentageRange,
    ).toInt());
  }

  //if we have an all positive range
  else {
    return remapValueInRangeToAnyRange(
      oldStatsRange: statsRange,
      oldValue: rangeValue,
      newStatsRange: StatsRangeConstants.positivePercentageRange,
    ).toInt();
  }
}
