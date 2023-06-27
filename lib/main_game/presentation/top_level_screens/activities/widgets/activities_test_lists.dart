import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/utils/date_and_time/clock_time_in_minutes.dart';
import 'package:toplife/main_systems/system_event/constants/event_type.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/event_person_pair.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_person/constants/sexuality.dart';
import 'package:toplife/main_systems/system_person/constants/zodiac_sign.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';

class ActivitiesTestList {
  static final testEvent = Event(
    id: DatabaseConstants.dummyId,
    gameId: 1,
    eventType: EventType.birthdayParty.name,
    eventDay: 34,
    mainPersonId: 2,
    relationshipToMainPlayer: InformalRelationshipType.parent.name,
    journalEntryOnly: false,
    performed: false,
  );
  static final testPerson = Person(
    id: 2,
    gameId: 1,
    firstName: "Ify",
    lastName: "Eze",
    dayOfBirth: 21,
    gender: Gender.Female.name,
    subjectPronoun: Gender.Female.subjectPronoun,
    objectPronoun: Gender.Female.objectPronoun,
    possessivePronoun: Gender.Female.possessivepronoun,
    sexuality: Sexuality.Straight.name,
    birthState: "Ontario",
    birthCountry: "Canada",
    currentState: "Ontario",
    currentCountry: "Canada",
    money: 120,
    zodiacSign: ZodiacSign.Libra.name,
    transportMode: "bus",
    hasDriversLicense: true,
    hasFertilityIssues: false,
    onBirthControl: false,
    isSterile: false,
    sickly: false,
    dead: false,
  );

  static final eventPersonPairsList = [
    EventPersonPair(
      event: testEvent.copyWith(
        startTime:const Value (ClockTimeInMinutes.oneAM),
        endTime: const Value(ClockTimeInMinutes.twelvePM),
      ),
      person: testPerson.copyWith(firstName: "Sandra"),
    ),
    EventPersonPair(
      event: testEvent.copyWith(
        startTime: const Value(ClockTimeInMinutes.sevenPM),
        endTime: const Value(ClockTimeInMinutes.elevenPM),
        eventType: EventType.funeral.name,
      ),
      person: testPerson.copyWith(firstName: "Jason"),
    ),
    EventPersonPair(
      event: testEvent.copyWith(
        startTime: const Value(ClockTimeInMinutes.twelveAM),
        endTime:const Value (ClockTimeInMinutes.nineAM),
        eventType: EventType.graduation.name,
      ),
      person: testPerson.copyWith(firstName: "Augustine"),
    ),
  ];
}
