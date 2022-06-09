import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/date_and_time/pad_time.dart';

void main() {
  group("padTime function", () {
    test(
        "padding single digit -> 5 returns a string equivalent with a leading zero -> 05",
        () {
      const String correctValue = "05";

      final String results = padTime(time: 5);

      expect(results, correctValue);
    });

    test(
        "padding double digit -> 45 returns a string equivalent of the double digit -> 45",
        () {
      const String correctValue = "45";

      final String results = padTime(time: 45);

      expect(results, correctValue);
    });

    test(
        "padding triple digit -> 425 returns a string equivalent of the triple digit -> 425",
        () {
      const String correctValue = "425";

      final String results = padTime(time: 425);

      expect(results, correctValue);
    });
  });
}
