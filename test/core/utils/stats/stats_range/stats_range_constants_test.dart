import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/stats/stats_range/stats_range.dart';
import 'package:toplife/core/utils/stats/stats_range/stats_range_constants.dart';

void main() {
  group("Stats Range Constants:", () {
    test("default range has correct values", () {
      expect(
        StatsRangeConstants.defaultRange,
        const StatsRange(
          min: 0,
          max: 100,
        ),
      );
    });

    test("percentage range has correct values", () {
      expect(
        StatsRangeConstants.positivePercentageRange,
        const StatsRange(
          min: 0,
          max: 100,
        ),
      );
    });

    test("negative percentage range has correct values", () {
      expect(
        StatsRangeConstants.negativePercentageRange,
        const StatsRange(
          min: -100,
          max: 0,
        ),
      );
    });

    test("relationship range has correct values", () {
      expect(
        StatsRangeConstants.relationshipRange,
        const StatsRange(
          min: -100,
          max: 100,
        ),
      );
    });
  });
}
