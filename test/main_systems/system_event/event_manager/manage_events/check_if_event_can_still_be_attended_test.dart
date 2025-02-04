import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/date_and_time/clock_time_in_minutes.dart';
import 'package:toplife/game_systems/main_systems/system_event/event_manager/manage_events/check_if_event_can_still_be_attended.dart';

void main() {
  group("CheckIfEventCanStillBeAttended:", () {
    final CheckIfEventCanStillBeAttended checkIfEventCanStillBeAttended =
        CheckIfEventCanStillBeAttended();

    test(
      "if the current time is 12pm, the event ends at 1pm and it takes 30 minutes to travel there, then it return true.",
      () {
        final result = checkIfEventCanStillBeAttended.execute(
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
        final result = checkIfEventCanStillBeAttended.execute(
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
        final result = checkIfEventCanStillBeAttended.execute(
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
}
