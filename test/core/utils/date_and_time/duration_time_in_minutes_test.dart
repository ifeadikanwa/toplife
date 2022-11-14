import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/date_and_time/duration_time_in_minutes.dart';

void main() {
  group("TimeInMinutes:", () {
    test("30m is 30 minutes", () {
      expect(DurationTimeInMinutes.thirtyMinutes, 30);
    });

    test("1 hour is 60 minutes", () {
      expect(DurationTimeInMinutes.oneHour, 60);
    });

    test("1h 45m is 105 minutes", () {
      expect(DurationTimeInMinutes.oneHourFortyFiveMinutes, 105);
    });

    test("2 hour is 120 minutes", () {
      expect(DurationTimeInMinutes.twoHours, 120);
    });

    test("3 hour is 180 minutes", () {
      expect(DurationTimeInMinutes.threeHours, 180);
    });

    test("4 hour is 240 minutes", () {
      expect(DurationTimeInMinutes.fourHours, 240);
    });

    test("5 hour is 300 minutes", () {
      expect(DurationTimeInMinutes.fiveHours, 300);
    });

    test("6 hour is 360 minutes", () {
      expect(DurationTimeInMinutes.sixHours, 360);
    });
  });
}
