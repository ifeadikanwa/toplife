import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/date_and_time/clock_time_in_minutes.dart';
import 'package:toplife/game_systems/main_systems/system_event/event_manager/manage_events/check_if_event_is_open.dart';

void main() {
  group("CheckIfEventIsOpen:", () {
    final CheckIfEventIsOpen checkIfEventIsOpen = CheckIfEventIsOpen();

    test(
      "if the current time is 9am, the event starts at 10am and it takes 10 minutes to travel there with 30 minutes allowance time, then it return false.",
      () {
        final result = checkIfEventIsOpen.execute(
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
        final result = checkIfEventIsOpen.execute(
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
        final result = checkIfEventIsOpen.execute(
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
}
