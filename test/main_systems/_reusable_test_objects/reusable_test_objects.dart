import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_relationship_pair.dart';

class ReusableTestObjects {
  static const Person testPerson = Person(
    id: 0,
    gameId: 1,
    firstName: "firstName",
    lastName: "lastName",
    dayOfBirth: 0,
    gender: "gender",
    subjectPronoun: "subjectPronoun",
    objectPronoun: "objectPronoun",
    possessivePronoun: "possessivePronoun",
    sexuality: "sexuality",
    currentState: "currentState",
    currentCountry: "currentCountry",
    birthState: "birthState",
    birthCountry: "birthCountry",
    money: 0,
    emotionalState: "emotionalState",
    zodiacSign: "zodiacSign",
    hasDriversLicense: true,
    transportMode: "transportMode",
    drivingMode: "drivingMode",
    hasFertilityIssues: true,
    onBirthControl: false,
    isSterile: false,
    sickly: true,
    dead: false,
  );

  static const Relationship testRelationship = Relationship(
    firstPersonId: 0,
    secondPersonId: 0,
    platonicRelationshipType: "",
    romanticRelationshipType: "",
    previousFamilialRelationship: "",
    interestedInRelationship: true,
    level: 100,
    activeRomance: false,
    isCoParent: false,
  );

  static const PersonRelationshipPair testPersonRelationshipPair =
      PersonRelationshipPair(
    person: ReusableTestObjects.testPerson,
    relationship: ReusableTestObjects.testRelationship,
  );
}
