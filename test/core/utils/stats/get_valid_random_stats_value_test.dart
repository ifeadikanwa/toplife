import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/stats/get_valid_random_stats_value.dart';

void main() {
  group("getValidRandomStatsValue:", () {
    test("defaultMinValue for stats is 10", () {
      expect(defaultMinValue, 10);
    });

    test("defaultMaxValue is 100", () {
      expect(defaultMaxValue, 100);
    });

    test("getValidRandomStatsValue returns a value between 10 and 100", () {
      final value = getValidRandomStatsValue();
      assert(value <= 100 && value >= 10);
    });

    test(
        "getValidRandomStatsValue betweem 60 and 80 returns a value between 60 and 80",
        () {
      final value = getValidRandomStatsValue(minValue: 60, maxValue: 80);
      assert(value <= 80 && value >= 60);
    });

    test(
        "getValidRandomStatsValue betweem 90 and 250 returns a value between 90 and 100",
        () {
      final value = getValidRandomStatsValue(minValue: 90, maxValue: 250);
      assert(value <= 100 && value >= 90);
    });

    test(
      "getValidRandomStatsValue returns the min value if the min value given is greater than the max value",
      () {
        const min = 80;
        const max = 60;
        final value = getValidRandomStatsValue(minValue: min, maxValue: max);
        expect(value, min);
      },
    );

    test(
      "getValidRandomStatsValue returns the 100 if the min value given is greater than 100",
      () {
        const min = 130;
        final value = getValidRandomStatsValue(minValue: min);
        expect(value, 100);
      },
    );

    test(
      "getValidRandomStatsValue returns the 100 if the max value and min value given is greater than 100",
      () {
        final value = getValidRandomStatsValue(minValue: 160, maxValue: 231);
        expect(value, 100);
      },
    );
  });
}
