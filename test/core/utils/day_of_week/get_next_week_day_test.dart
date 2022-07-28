import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/day_of_week/day_of_week.dart';
import 'package:toplife/core/utils/day_of_week/get_next_week_day.dart';

void main() {
  group("getNextWeekDay:", () {
    test(
        "if current day is tuesday and we skip two days then next week day is friday",
        () {
      final result = getNextWeekDay(2, 2);
      final int dayOfWeek = result % 7;
      expect(DayOfWeek.values[dayOfWeek], DayOfWeek.Friday);
    });
    test("if current day is sunday then next week day is monday", () {
      final result = getNextWeekDay(14, 0);
      final int dayOfWeek = result % 7;
      expect(DayOfWeek.values[dayOfWeek], DayOfWeek.Monday);
    });

    test("if current day is monday then next week day is tuesday", () {
      final result = getNextWeekDay(15, 0);
      final int dayOfWeek = result % 7;
      expect(DayOfWeek.values[dayOfWeek], DayOfWeek.Tuesday);
    });

    test("if current day is tuesday then next week day is wednesday", () {
      final result = getNextWeekDay(16, 0);
      final int dayOfWeek = result % 7;
      expect(DayOfWeek.values[dayOfWeek], DayOfWeek.Wednesday);
    });

    test("if current day is wednesday then next week day is thursday", () {
      final result = getNextWeekDay(17, 0);
      final int dayOfWeek = result % 7;
      expect(DayOfWeek.values[dayOfWeek], DayOfWeek.Thursday);
    });

    test("if current day is thursday then next week day is friday", () {
      final result = getNextWeekDay(18, 0);
      final int dayOfWeek = result % 7;
      expect(DayOfWeek.values[dayOfWeek], DayOfWeek.Friday);
    });

    test("if current day is friday then next week day is monday", () {
      final result = getNextWeekDay(19, 0);
      final int dayOfWeek = result % 7;
      expect(DayOfWeek.values[dayOfWeek], DayOfWeek.Monday);
    });

    test("if current day is saturday then next week day is monday", () {
      final result = getNextWeekDay(20, 0);
      final int dayOfWeek = result % 7;
      expect(DayOfWeek.values[dayOfWeek], DayOfWeek.Monday);
    });
  });
}
