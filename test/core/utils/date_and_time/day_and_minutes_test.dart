import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/date_and_time/day_and_minutes.dart';

void main() {
  late DayAndMinutes sut;

  setUp(() {
    sut = const DayAndMinutes(day: 25, minutes: 1230, isNewDay: true);
  });

  group("DayAndMinutes:", () {
    test("DayAndMinutes objects with the same properties values are equal", () {
      const DayAndMinutes anotherObject =
          DayAndMinutes(day: 25, minutes: 1230, isNewDay: true);

      expect(sut, anotherObject);
    });

    test(
        "DayAndMinutes objects with the different properties values are not equal",
        () {
      const DayAndMinutes anotherObject =
          DayAndMinutes(day: 23, minutes: 1230, isNewDay: false);

      expect(sut != anotherObject, true);
    });
  });
}
