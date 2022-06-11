import 'dart:math';

const defaultMinValue = 10;
const randomStatsMaxValue = 70;

int getValidRandomStatsValue({int minValue = defaultMinValue}) {
  return minValue + Random().nextInt(randomStatsMaxValue - minValue);
}
