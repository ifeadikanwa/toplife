import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/date_and_time/add_time.dart';
import 'package:toplife/core/utils/date_and_time/day_and_minutes.dart';

void main() {
  const int currentTime = 1200; //20:00 PM
  const int currentDay = 23;

  group("addTime Function:", () {
    test(
      "Adding time returns the correct time value within the same day if time doesn't surpass that day",
      () {
        const int minutesToAdd = 110;

        const correctTime = DayAndMinutes(
          day: 23,
          minutes: 1310,
          isNewDay: false,
        );

        final result = addTime(
          currentDay: currentDay,
          currentTimeInMinutes: currentTime,
          timeToAddInMinutes: minutesToAdd,
        );

        expect(result, correctTime);
      },
    );

    test(
      "Adding time returns the correct time value in the another day if time surpass the current day",
      () {
        const int minutesToAdd = 520;

        const correctTime = DayAndMinutes(
          day: 24,
          minutes: 280,
          isNewDay: true,
        );

        final result = addTime(
          currentDay: currentDay,
          currentTimeInMinutes: currentTime,
          timeToAddInMinutes: minutesToAdd,
        );

        expect(result, correctTime);
      },
    );

  });
}
