import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';

void main() {
  group("crossCheckStats:", () {
    test("maxStatsValue should be defined as 100", () {
      expect(maxStatsValue, 100);
    });

    test("crossCheckStat returns maxStatValue if stat is greater than the max",
        () {
      expect(crossCheckStat(150), maxStatsValue);
    });

    test("crossCheckStat returns null if stat is null", () {
      expect(crossCheckStat(null), null);
    });

    test(
        "crossCheckStat returns original stat if it is less or equal to the maxStatValue",
        () {
      expect(crossCheckStat(46), 46);
    });

    test("crossCheckStat returns 0 if stat is less than 0", () {
      expect(crossCheckStat(-34), 0);
    });
  });
}
