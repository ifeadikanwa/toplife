import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_event/constants/event_category.dart';
import 'package:toplife/main_systems/system_event/constants/event_type.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/util/event_util.dart';

void main() {
  group("Event util:", () {
    test(
      "morning event start times are 9am - 11am",
      () {
        expect(EventUtil.morningEventStartTimes, [540, 600, 660]);
      },
    );

    test(
      "afternoon event start times are 12pm - 4pm",
      () {
        expect(EventUtil.afternoonEventStartTimes, [720, 780, 840, 900, 960]);
      },
    );

    test(
      "night event start times are 7pm - 10pm",
      () {
        expect(EventUtil.nightEventStartTimes, [1140, 1200, 1260, 1320]);
      },
    );

    test(
      "get random event start time return a number in the morning event start times if canBeMorning is true",
      () {
        expect(
            EventUtil.getRandomEventStartTime(
              canBeMorning: true,
              canBeAfternoon: false,
              canBeNight: false,
            ),
            isIn(EventUtil.morningEventStartTimes));
      },
    );

    test(
      "get random event start time return a number in the afternoon event start times if canBeAfternoon is true",
      () {
        expect(
            EventUtil.getRandomEventStartTime(
              canBeMorning: false,
              canBeAfternoon: true,
              canBeNight: false,
            ),
            isIn(EventUtil.afternoonEventStartTimes));
      },
    );

    test(
      "get random event start time return a number in the night event start times if canBeNight is true",
      () {
        expect(
            EventUtil.getRandomEventStartTime(
              canBeMorning: false,
              canBeAfternoon: false,
              canBeNight: true,
            ),
            isIn(EventUtil.nightEventStartTimes));
      },
    );

    test(
      "get random event start time return a number in the multiple event start times list if multiple canBe args are true",
      () {
        expect(
            EventUtil.getRandomEventStartTime(
              canBeMorning: true,
              canBeAfternoon: true,
              canBeNight: false,
            ),
            isIn([
              ...EventUtil.morningEventStartTimes,
              ...EventUtil.afternoonEventStartTimes
            ]));
      },
    );

    test(
      "ONE MORE TIME, get random event start time return a number in the multiple event start times list if multiple canBe args are true",
      () {
        expect(
            EventUtil.getRandomEventStartTime(
              canBeMorning: true,
              canBeAfternoon: true,
              canBeNight: true,
            ),
            isIn([
              ...EventUtil.morningEventStartTimes,
              ...EventUtil.afternoonEventStartTimes,
              ...EventUtil.nightEventStartTimes,
            ]));
      },
    );

    test(
      "get random event start time returns a random afternoon start time if no canBe arg is true",
      () {
        expect(
          EventUtil.getRandomEventStartTime(
            canBeMorning: false,
            canBeAfternoon: false,
            canBeNight: false,
          ),
          isIn(EventUtil.afternoonEventStartTimes),
        );
      },
    );

    test(
        "getEventTypeNamesInCategory return event type names in that event category",
        () {
      final List<String> eventTypeNames = EventUtil.getEventTypeNamesInCategory(
        EventCategory.unmovableAutonomousEvent,
      );

      for (var eventTypeName in eventTypeNames) {
        final EventType? eventType =
            EventType.values.asNameMap()[eventTypeName];
        expect(
          eventType,
          isNotNull,
          reason: "$eventTypeName is not a valid event type",
        );

        expect(
          eventType?.eventCategory,
          EventCategory.unmovableAutonomousEvent,
          reason: "Event type does not have the correct event category",
        );
      }
    });
  });
}
