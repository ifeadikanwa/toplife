import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/date_and_time/convert_minutes_to_truncated_hours.dart';

void main() {
  group("convertMinutesToTruncatedHours:", () {
    test(
      "630 minutes is equal to 10 hours",
      () => expect(
        convertMinutesToTruncatedHours(630),
        10,
      ),
    );

    test(
      "-630 minutes is equal to 10 hours",
      () => expect(
        convertMinutesToTruncatedHours(630),
        10,
      ),
    );

    test(
      "0 minutes is equal to 0 hours",
      () => expect(
        convertMinutesToTruncatedHours(0),
        0,
      ),
    );

    test(
      "1550 minutes is equal to 25 hours",
      () => expect(
        convertMinutesToTruncatedHours(1550),
        25,
      ),
    );
  });
}
