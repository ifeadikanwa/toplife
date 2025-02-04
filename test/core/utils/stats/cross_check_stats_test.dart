import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/core/utils/stats/stats_range/stats_range.dart';

void main() {
  group("crossCheckStats:", () {
    test("defaultMaxStatsValue should be defined as 100", () {
      expect(defaultMaxStatsValue, 100);
    });

    test("if stat value is less than min, we get min", () {
      expect(
        crossCheckStat(
          stat: -15,
          statsRange: const StatsRange(
            min: -5,
            max: 80,
          ),
        ),
        -5,
      );

      expect(
        crossCheckStat(
          stat: 34,
          statsRange: const StatsRange(
            min: 50,
            max: 200,
          ),
        ),
        50,
      );
    });

     test("if stat value is greater than max, we get max", () {
      expect(
        crossCheckStat(
          stat: 254,
          statsRange: const StatsRange(
            min: -120,
            max: 180,
          ),
        ),
        180,
      );

      expect(
        crossCheckStat(
          stat: 20,
          statsRange: const StatsRange(
            min: 5,
            max: 19,
          ),
        ),
        19,
      );
    });

     test("if stat value is greater than min and less than max, we get stat value", () {
      expect(
        crossCheckStat(
          stat: -15,
          statsRange: const StatsRange(
            min: -50,
            max: 80,
          ),
        ),
        -15,
      );

      expect(
        crossCheckStat(
          stat: 34,
          statsRange: const StatsRange(
            min: 10,
            max: 200,
          ),
        ),
        34,
      );
    });
  });
}
