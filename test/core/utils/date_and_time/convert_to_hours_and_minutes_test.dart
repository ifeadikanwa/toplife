import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/date_and_time/convert_to_hours_and_minutes.dart';
import 'package:toplife/core/utils/date_and_time/time.dart';

void main() {
  group("convertToHoursAndMinutes Function:", () {
    test(
      "given 1150 minutes we get 19 hours and 10 minutes",
      () {
        const int minutesTimeToConvert = 1150;

        const Time correctTime = Time(hours: 19, minutes: 10);

        final results =
            convertToHoursAndMinutes(timeInMinutes: minutesTimeToConvert);

        expect(results, correctTime);
      },
    );

   test(
      "given 0 minutes we get 0 hours and 0 minutes",
      () {
        const int minutesTimeToConvert = 0;

        const Time correctTime = Time(hours: 0, minutes: 0);

        final results =
            convertToHoursAndMinutes(timeInMinutes: minutesTimeToConvert);

        expect(results, correctTime);
      },
    );

    test(
      "given 1440 minutes we get 24 hours and 0 minutes",
      () {
        const int minutesTimeToConvert = 1440;

        const Time correctTime = Time(hours: 24, minutes: 0);

        final results =
            convertToHoursAndMinutes(timeInMinutes: minutesTimeToConvert);

        expect(results, correctTime);
      },
    );

    test(
      "given 734 minutes we get 12 hours and 14 minutes",
      () {
        const int minutesTimeToConvert = 734;

        const Time correctTime = Time(hours: 12, minutes: 14);

        final results =
            convertToHoursAndMinutes(timeInMinutes: minutesTimeToConvert);

        expect(results, correctTime);
      },
    );
  });
}
