import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/date_and_time/get_clock_time.dart';

void main() {
  group("getClockTime function:", () {
   test("given 6 minutes we get 12:06 AM", () {
      const int timeInMinutes = 6;

      const String correctClockTime = "12:06 AM";

      final String result = getClockTime(timeInMinutes: timeInMinutes);

      expect(result, correctClockTime);
    }); 

    test("given 345 minutes we get 05:45 AM", () {
      const int timeInMinutes = 345;

      const String correctClockTime = "05:45 AM";

      final String result = getClockTime(timeInMinutes: timeInMinutes);

      expect(result, correctClockTime);
    });

    test("given 730 minutes we get 12:10 PM", () {
      const int timeInMinutes = 730;

      const String correctClockTime = "12:10 PM";

      final String result = getClockTime(timeInMinutes: timeInMinutes);

      expect(result, correctClockTime);
    });

    test("given 950 minutes we get 03:50 PM", () {
      const int timeInMinutes = 950;

      const String correctClockTime = "03:50 PM";

      final String result = getClockTime(timeInMinutes: timeInMinutes);

      expect(result, correctClockTime);
    });

     test("given 1440 minutes we get 12:00 AM", () {
      const int timeInMinutes = 1440;

      const String correctClockTime = "12:00 AM";

      final String result = getClockTime(timeInMinutes: timeInMinutes);

      expect(result, correctClockTime);
    });
  });
}
