import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_event/util/get_attendable_event_title.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

void main() {
  group("getAttendableEventTitle:", () {
    const event = Event(
      id: 0,
      gameId: 1,
      eventType: "birthday",
      eventDay: 34,
      mainPersonId: 2,
      relationshipToMainPlayer: "friend",
      journalEntryOnly: false,
      performed: false,
      startTime: null,
      endTime: null,
    );

    const person = Person(
      id: 1,
      gameId: 2,
      firstName: "Ify",
      lastName: "Eze",
      dayOfBirth: 21,
      gender: "",
      subjectPronoun: "",
      objectPronoun: "",
      possessivePronoun: "",
      sexuality: "",
      birthState: "Ontario",
      birthCountry: "Canada",
      currentState: "Ontario",
      currentCountry: "Canada",
      money: 120,
      zodiacSign: "",
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
      "returns correct sentence if event type is valid",
      () {
        expect(
          getAttendableEventTitle(
            eventMainPerson: person,
            event: event,
          ),
          "Ify's Birthday",
        );
      },
    );

    test(
      "returns correct sentence if event type is not valid",
      () {
        expect(
          getAttendableEventTitle(
            eventMainPerson: person,
            event: event.copyWith(
              eventType: "wrong",
            ),
          ),
          "Ify's -",
        );
      },
    );
  });
}
