import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_event/domain/model/event.dart';
import 'package:toplife/main_systems/system_event/util/get_attendable_event_title.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';

void main() {
  group("getAttendableEventTitle:", () {
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

    const person = Person(
      id: 1,
      gameID: 2,
      firstName: "Ify",
      lastName: "Eze",
      dayOfBirth: 21,
      gender: "",
      subjectPronoun: "",
      objectPronoun: "",
      possessivePronoun: "",
      sexuality: "",
      state: "state",
      country: "country",
      money: 120,
      zodiacSign: "",
      importantStatus: null,
      custodianID: 2,
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
