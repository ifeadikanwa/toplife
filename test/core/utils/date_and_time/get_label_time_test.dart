import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/date_and_time/get_label_time.dart';

void main() {
  group("getLabelTime function:", () {
     test("given 0 minutes we get -", () {
      const int timeInMinutes = 0;

      const String correctLabelTime = "-";

      final String result = getLabelTime(timeInMinutes: timeInMinutes);

      expect(result, correctLabelTime);
    });

    test("given 48 minutes we get 48m", () {
      const int timeInMinutes = 48;

      const String correctLabelTime = "48m";

      final String result = getLabelTime(timeInMinutes: timeInMinutes);

      expect(result, correctLabelTime);
    });

     test("given 432 minutes we get 7h 12m", () {
      const int timeInMinutes = 432;

      const String correctLabelTime = "7h 12m";

      final String result = getLabelTime(timeInMinutes: timeInMinutes);

      expect(result, correctLabelTime);
    });

     test("given 780 minutes we get 13h", () {
      const int timeInMinutes = 780;

      const String correctLabelTime = "13h";

      final String result = getLabelTime(timeInMinutes: timeInMinutes);

      expect(result, correctLabelTime);
    });

    test("if asked to add plus, the returned string contains correct time with plus at the end", () {
      const int timeInMinutes = 810;

      const String correctLabelTime = "13h 30m+";

      final String result = getLabelTime(timeInMinutes: timeInMinutes, addPlus: true);

      expect(result, correctLabelTime);
    });
  });
}
