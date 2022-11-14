import 'package:toplife/core/utils/date_and_time/clock_time_in_minutes.dart';
import 'package:toplife/main_systems/system_event/constants/event_type.dart';
import 'package:toplife/main_systems/system_event/domain/model/event.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/event_person_pair.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_person/constants/sexuality.dart';
import 'package:toplife/main_systems/system_person/constants/zodiac_sign.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';

class ActivitiesTestList {
  static final testEvent = Event(
    gameID: 1,
    eventType: EventType.birthdayParty.name,
    eventDay: 34,
    mainPersonID: 2,
    relationshipToMainPlayer: InformalRelationshipType.parent.name,
    journalEntryOnly: false,
    performed: false,
  );
  static final testPerson = Person(
    id: 2,
    gameID: 1,
    firstName: "Ify",
    lastName: "Eze",
    dayOfBirth: 21,
    gender: Gender.Female.name,
    subjectPronoun: Gender.Female.subjectPronoun,
    objectPronoun: Gender.Female.objectPronoun,
    possessivePronoun: Gender.Female.possessivepronoun,
    sexuality: Sexuality.Straight.name,
    state: "state",
    country: "country",
    money: 120,
    zodiacSign: ZodiacSign.Libra.name,
    importantStatus: null,
    custodianID: 2,
    transportMode: "bus",
    hasDriversLicense: true,
    hasFertilityIssues: false,
    onBirthControl: false,
    isSterile: false,
    sickly: false,
    rebellious: true,
    dead: false,
  );

  static final eventPersonPairsList = [
    EventPersonPair(
      event: testEvent.copyWith(
        startTime: ClockTimeInMinutes.oneAM,
        endTime: ClockTimeInMinutes.twelvePM,
      ),
      person: testPerson.copyWith(firstName: "Sandra"),
    ),
    EventPersonPair(
      event: testEvent.copyWith(
        startTime: ClockTimeInMinutes.sevenPM,
        endTime: ClockTimeInMinutes.elevenPM,
        eventType: EventType.funeral.name,
      ),
      person: testPerson.copyWith(firstName: "Jason"),
    ),
    EventPersonPair(
      event: testEvent.copyWith(
        startTime: ClockTimeInMinutes.twelveAM,
        endTime: ClockTimeInMinutes.nineAM,
        eventType: EventType.graduation.name,
      ),
      person: testPerson.copyWith(firstName: "Augustine"),
    ),
  ];
}
