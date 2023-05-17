import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/date_and_time/convert_hours_to_minutes.dart';

void main() {
  group("convertHoursToMinutes:", () {
    test(
      "4 hours is equal to 240 minutes",
      () => expect(
        convertHoursToMinutes(4),
        240,
      ),
    );

    test(
      "-4 hours is equal to 240 minutes",
      () => expect(
        convertHoursToMinutes(-4),
        240,
      ),
    );

    test(
      "64 hours is equal to 3840 minutes",
      () => expect(
        convertHoursToMinutes(64),
        3840,
      ),
    );
  });
}
