import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/numbers/remap_value_in_range_to_percentage_range.dart';
import 'package:toplife/core/utils/stats/stats_range/stats_range.dart';

void main() {
  group("Remap values in range to percentage range:", () {
    test(
        "given a negative min value, a positive max value, and a negative range value, we get the correct answer",
        () {
      expect(
        remapValueInRangeToPercentageRange(
          statsRange: const StatsRange(min: -50, max: 200),
          rangeValue: -10,
        ),
        -20,
      );
    });

    test(
        "given a negative min value, a positive max value, and a positive range value, we get the correct answer",
        () {
      expect(
        remapValueInRangeToPercentageRange(
          statsRange: const StatsRange(min: -50, max: 200),
          rangeValue: 50,
        ),
        25,
      );
    });



    test(
        "given a negative min value, a negative max value, and a negative range value, we get the correct answer",
        () {
      expect(
        remapValueInRangeToPercentageRange(
          statsRange: const StatsRange(min: -150, max: -100),
          rangeValue: -130,
        ),
        -40,
      );
    });

     test(
        "given a positive min value, a positive max value, and a positive range value, we get the correct answer",
        () {
      expect(
        remapValueInRangeToPercentageRange(
          statsRange: const StatsRange(min: 80, max: 140),
          rangeValue: 125,
        ),
        75,
      );
    });
  });
}
