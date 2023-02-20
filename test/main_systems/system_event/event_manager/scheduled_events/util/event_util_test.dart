import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/util/event_util.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

void main() {
  group("Event util:", () {
    const person = Person(
      id: 1,
      gameId: 2,
      firstName: "Ify",
      lastName: "Eze",
      dayOfBirth: 21,
      gender: "gender",
      subjectPronoun: "subject",
      objectPronoun: "object",
      possessivePronoun: "possessive",
      sexuality: "sexuality",
      birthState: "Ontario",
      birthCountry: "Canada",
      currentState: "Ontario",
      currentCountry: "Canada",
      money: 120,
      zodiacSign: "sign",
      hasDriversLicense: true,
      transportMode: "bus",
      hasFertilityIssues: false,
      onBirthControl: false,
      isSterile: false,
      sickly: false,
      rebellious: true,
      dead: false,
    );

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
      "check if player can attend returns true if the two countries are the same",
      () {
        expect(
          EventUtil.checkIfPlayerCanAttendEvent(
            mainPlayerPerson: person.copyWith(currentCountry: "Canada"),
            eventMainPerson: person.copyWith(currentCountry: "Canada"),
          ),
          true,
        );
      },
    );

    test(
      "check if player can attend returns false if the two countries are NOT the same",
      () {
        expect(
          EventUtil.checkIfPlayerCanAttendEvent(
            mainPlayerPerson: person.copyWith(currentCountry: "Canada"),
            eventMainPerson: person.copyWith(currentCountry: "USA"),
          ),
          false,
        );
      },
    );
  });
}
