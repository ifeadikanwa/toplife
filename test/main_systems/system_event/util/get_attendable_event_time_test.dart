import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/date_and_time/clock_time_in_minutes.dart';
import 'package:toplife/main_systems/system_event/domain/model/event.dart';
import 'package:toplife/main_systems/system_event/util/get_attendable_event_time.dart';

void main() {
  group("getAttendableEventTime: ", () {
    const event = Event(
      gameID: 1,
      eventType: "birthday",
      eventDay: 34,
      mainPersonID: 2,
      relationshipToMainPlayer: "friend",
      journalEntryOnly: false,
      performed: false,
      startTime: null,
      endTime: null,
    );
    test(
      "returns: \"Time: -\" if start and end time in event is null",
      () {
        expect(getAttendableEventTime(event: event), "Time: -");
      },
    );

    test(
      "returns: \"Time: -\" if start time is given but end time is null",
      () {
        expect(
            getAttendableEventTime(
                event: event.copyWith(
              startTime: ClockTimeInMinutes.twelveAM,
            )),
            "Time: -");
      },
    );

    test(
      "returns: \"Time: -\" if end time is given but start time is null",
      () {
        expect(
            getAttendableEventTime(
                event: event.copyWith(
              endTime: ClockTimeInMinutes.twelveAM,
            )),
            "Time: -");
      },
    );

    test(
      "returns: \"Time: 06:00 AM - 01:00 PM\" if start time is 6am and end time is 1pm",
      () {
        expect(
            getAttendableEventTime(
                event: event.copyWith(
              startTime: ClockTimeInMinutes.sixAM,
              endTime: ClockTimeInMinutes.onePM,
            )),
            "Time: 06:00 AM - 01:00 PM");
      },
    );
  });
}
