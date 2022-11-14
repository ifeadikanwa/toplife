import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/date_and_time/clock_time_in_minutes.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_manager.dart';

void main() {
  group("Event manager:", () {
    test(
      "event attendance allowance time is 30 minutes",
      () {
        expect(EventManager.eventAttendanceAllowanceTime, 30);
      },
    );

    group("checkIfEventIsOpen:", () {
      test(
        "if the current time is 9am, the event starts at 10am and it takes 10 minutes to travel there with 30 minutes allowance time, then it return false.",
        () {
          final result = EventManager.checkIfEventIsOpen(
            startTime: ClockTimeInMinutes.tenAM,
            endTime: ClockTimeInMinutes.elevenAM,
            travelTime: 10,
            currentTime: ClockTimeInMinutes.nineAM,
          );

          expect(
            result,
            false,
          );
        },
      );

      test(
        "if the current time is 9:20am, the event starts at 10am and it takes 10 minutes to travel there with 30 minutes allowance time, then it return true.",
        () {
          final result = EventManager.checkIfEventIsOpen(
            startTime: ClockTimeInMinutes.tenAM,
            endTime: ClockTimeInMinutes.elevenAM,
            travelTime: 10,
            currentTime: ClockTimeInMinutes.nineAM + 20,
          );

          expect(
            result,
            true,
          );
        },
      );

      test(
        "if the current time is 10:30am, the event starts at 10am and it takes 10 minutes to travel there with 30 minutes allowance time, then it return true.",
        () {
          final result = EventManager.checkIfEventIsOpen(
            startTime: ClockTimeInMinutes.tenAM,
            endTime: ClockTimeInMinutes.elevenAM,
            travelTime: 10,
            currentTime: ClockTimeInMinutes.tenAM + 30,
          );

          expect(
            result,
            true,
          );
        },
      );
    });

    group("checkIfEventCanStillBeAttended:", () {
       test(
        "if the current time is 12pm, the event ends at 1pm and it takes 30 minutes to travel there, then it return true.",
        () {
          final result = EventManager.checkIfEventCanStillBeAttended(
            startTime: ClockTimeInMinutes.tenAM,
            endTime: ClockTimeInMinutes.onePM,
            travelTime: 30,
            currentTime: ClockTimeInMinutes.twelvePM,
          );

          expect(
            result,
            true,
          );
        },
      );

       test(
        "if the current time is 12:30pm, the event ends at 1pm and it takes 30 minutes to travel there, then it return false.",
        () {
          final result = EventManager.checkIfEventCanStillBeAttended(
            startTime: ClockTimeInMinutes.tenAM,
            endTime: ClockTimeInMinutes.onePM,
            travelTime: 30,
            currentTime: ClockTimeInMinutes.twelvePM + 30,
          );

          expect(
            result,
            false,
          );
        },
      );

       test(
        "if the current time is 2pm, the event ends at 1pm and it takes 30 minutes to travel there, then it return false.",
        () {
          final result = EventManager.checkIfEventCanStillBeAttended(
            startTime: ClockTimeInMinutes.tenAM,
            endTime: ClockTimeInMinutes.onePM,
            travelTime: 30,
            currentTime: ClockTimeInMinutes.twoPM,
          );

          expect(
            result,
            false,
          );
        },
      );
    });
  });
}
