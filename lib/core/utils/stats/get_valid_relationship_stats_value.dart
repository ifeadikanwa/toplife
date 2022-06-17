import 'package:toplife/core/utils/stats/get_valid_random_stats_value.dart';

const relationshipMinValue = 65;
const relationshipMaxValue = 80;
int getValidRelationshipStatsValue() {
  return getValidRandomStatsValue(minValue: relationshipMinValue, maxValue: relationshipMaxValue);
}
