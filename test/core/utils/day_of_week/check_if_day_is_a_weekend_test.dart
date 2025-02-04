import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/day_of_week/check_if_day_is_a_weekend.dart';

void main() {
  group("checkIfDayIsAWeekend: ", () {
    test("Monday - Friday will return false", () {
      //Day 1 = monday, Day 5 = friday
      for (int i = 1; i <= 5; i++) {
        expect(
          checkIfDayIsAWeekend(day: i),
          false,
          reason: "Cause: $i",
        );
      }
    });

    test("Saturday will return true", () {
      //Day 6 = Saturday
      expect(
        checkIfDayIsAWeekend(day: 6),
        true,
      );
    });

    test("Sunday will return true", () {
      //Day 7 = sunday
      expect(
        checkIfDayIsAWeekend(day: 7),
        true,
      );
    });
  });
}
