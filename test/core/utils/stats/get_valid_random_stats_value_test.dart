import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/stats/get_valid_random_stats_value.dart';

void main() {
  group("getValidRandomStatsValue:", () {
    test("defaultMinValue for stats is 10", () {
      expect(defaultMinValue, 10);
    });

    test("randomStatsMaxValue is 70", () {
      expect(randomStatsMaxValue, 70);
    });

    test("getValidRandomStatsValue returns a value between 10 and 70", () {
      final value = getValidRandomStatsValue();
      assert(value <= 70 && value >= 10);
    });
  });
}
