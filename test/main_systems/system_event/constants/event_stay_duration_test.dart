import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_event/constants/event_stay_duration.dart';

void main() {
  group("Event stay duration:", () {
    test(
      "thirtyMinutes full name and duration in minutes are correct",
      () {
        expect(
          EventStayDuration.thirtyMinutes.fullName,
          "Thirty minutes",
          reason: "Cause: fullname",
        );

        expect(
          EventStayDuration.thirtyMinutes.durationInMinutes,
          30,
          reason: "Cause: duration in minutes",
        );
      },
    );

    test(
      "oneHour full name and duration in minutes are correct",
      () {
        expect(
          EventStayDuration.oneHour.fullName,
          "One hour",
          reason: "Cause: fullname",
        );

        expect(
          EventStayDuration.oneHour.durationInMinutes,
          60,
          reason: "Cause: duration in minutes",
        );
      },
    );

    test(
      "tillTheEnd full name and duration in minutes are correct",
      () {
        expect(
          EventStayDuration.tillTheEnd.fullName,
          "Till the end",
          reason: "Cause: fullname",
        );

        expect(
          EventStayDuration.tillTheEnd.durationInMinutes,
          null,
          reason: "Cause: duration in minutes",
        );
      },
    );
  });
}
