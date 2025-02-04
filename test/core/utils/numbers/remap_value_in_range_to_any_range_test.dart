import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/numbers/remap_value_in_range_to_any_range.dart';
import 'package:toplife/core/utils/stats/stats_range/stats_range.dart';

void main() {
  group("Remap value in range to any range:", () {
    test(
        'if given 20 in a 0 - 300 range, and new range is 0 - 100, we get 6 after truncating value',
        () {
      expect(
        remapValueInRangeToAnyRange(
          oldStatsRange: const StatsRange(min: 0, max: 300),
          oldValue: 20,
          newStatsRange: const StatsRange(min: 0, max: 100),
        ).toInt(),
        6,
      );
    });

    test(
        'if given 17 in a 0 - 100 range, and new range is 0 - 100, we get 17 after truncating value',
        () {
      expect(
        remapValueInRangeToAnyRange(
          oldStatsRange: const StatsRange(min: 0, max: 100),
          oldValue: 17,
          newStatsRange: const StatsRange(min: 0, max: 100),
        ).toInt(),
        17,
      );
    });

    test(
        'if given -50 in a -80 -> -20 range, and new range is 250 -> 400, we get 325 after truncating value',
        () {
      expect(
        remapValueInRangeToAnyRange(
          oldStatsRange: const StatsRange(min: -80, max: -20),
          oldValue: -50,
          newStatsRange: const StatsRange(min: 250, max: 400),
        ).toInt(),
        325,
      );
    });

    test("if old range min is equal to old range max we get 0", () {
      expect(
        remapValueInRangeToAnyRange(
          oldStatsRange: const StatsRange(min: 50, max: 50),
          oldValue: 20,
          newStatsRange: const StatsRange(min: 100, max: 400),
        ).toInt(),
        0,
      );
    });

    test(
        "if min is greater than max in old range, it does nothing to correct this and gives us the expected value",
        () {
      expect(
        remapValueInRangeToAnyRange(
          oldStatsRange: const StatsRange(min: 60, max: 20),
          oldValue: 50,
          newStatsRange: const StatsRange(min: 0, max: 100),
        ).toInt(),
        25,
      );
    });

    test(
        "if min is greater than max in new range, it does nothing to correct this and gives us the expected value",
        () {
      expect(
        remapValueInRangeToAnyRange(
          oldStatsRange: const StatsRange(min: 60, max: 180),
          oldValue: 100,
          newStatsRange: const StatsRange(min: 70, max: 10),
        ).toInt(),
        50,
      );
    });

    test(
        "if min is greater than max in old and new range, it does nothing to correct this and gives us the expected value",
        () {
      expect(
        remapValueInRangeToAnyRange(
          oldStatsRange: const StatsRange(min: 50, max: 10),
          oldValue: 20,
          newStatsRange: const StatsRange(min: 100, max: 0),
        ).toInt(),
        25,
      );
    });
  });
}
