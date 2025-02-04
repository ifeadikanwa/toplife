import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/day_of_week/day_of_week.dart';
import 'package:toplife/core/utils/day_of_week/get_day_of_the_week.dart';

void main() {
  group("GetDayOfTheWeek:", () {
    test(
      "if dayNumber % 7 is 0, return Sunday",
      () {
        expect(
          getDayOfTheWeek(28),
          DayOfWeek.Sunday,
        );
      },
    );

    test(
      "if dayNumber % 7 is 1, return Monday",
      () {
        expect(
          getDayOfTheWeek(22),
          DayOfWeek.Monday,
        );
      },
    );

    test(
      "if dayNumber % 7 is 2, return Tuesday",
      () {
        expect(
          getDayOfTheWeek(16),
          DayOfWeek.Tuesday,
        );
      },
    );

    test(
      "if dayNumber % 7 is 3, return Wednesday",
      () {
        expect(
          getDayOfTheWeek(31),
          DayOfWeek.Wednesday,
        );
      },
    );

    test(
      "if dayNumber % 7 is 4, return Thursday",
      () {
        expect(
          getDayOfTheWeek(25),
          DayOfWeek.Thursday,
        );
      },
    );

    test(
      "if dayNumber % 7 is 5, return Friday",
      () {
        expect(
          getDayOfTheWeek(19),
          DayOfWeek.Friday,
        );
      },
    );

    test(
      "if dayNumber % 7 is 6, return Saturday",
      () {
        expect(
          getDayOfTheWeek(27),
          DayOfWeek.Saturday,
        );
      },
    );

    test(
      "if dayNumber is a negative number return the result for its positive equivalent",
      () {
        expect(
          getDayOfTheWeek(-28),
          DayOfWeek.Sunday,
        );
      },
    );
  });
}
