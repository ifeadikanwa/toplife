import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/date_and_time/time.dart';

void main() {
  late Time sut;

  setUp(() {
    sut = const Time(hours: 15, minutes: 45);
  });

  group("Time:", () {
    test("Time objects with the same properties values are equal", () {
      const Time anotherObject = Time(hours: 15, minutes: 45);

      expect(sut, anotherObject);
    });

    test("Time objects with the different properties values are not equal", () {
      const Time anotherObject = Time(hours: 4, minutes: 32);

      expect(sut != anotherObject, true);
    });

    test("minutesInAnHour is always 60", () {
      expect(Time.minutesInAnHour, 60);
    });

    test("minutesInADay is always 1440", () {
      expect(Time.minutesInADay, 1440);
    });

    test("hoursInADay is always 24", () {
      expect(Time.hoursInADay, 24);
    });

  });
}
