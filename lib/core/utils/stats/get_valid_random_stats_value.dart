import 'dart:math';

import 'package:toplife/core/utils/stats/cross_check_stats.dart';

const defaultMinValue = 10;
const defaultMaxValue = 70;

int getValidRandomStatsValue({
  int minValue = defaultMinValue,
  int maxValue = defaultMaxValue,
}) {
  //correct values if they are over 100
  if (minValue > defaultMaxStatsValue) {
    minValue = 100;
  }
  if (maxValue > defaultMaxStatsValue) {
    maxValue = 100;
  }

  //get the random stats value
  if (maxValue > minValue) {
    return minValue + Random().nextInt(maxValue - minValue);
  } else {
    return minValue;
  }
}
