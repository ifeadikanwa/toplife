import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_person/constants/sexuality.dart';
import 'package:toplife/main_systems/system_person/constants/zodiac_sign.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';

void main() {
  late Person sut;

  setUp(() {
    sut = Person(
      id: 1,
      gameID: 2,
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
      hasDriversLicense: true,
      transportMode: "bus",
      hasFertilityIssues: false,
      onBirthControl: false,
      isSterile: false,
      sickly: false,
      rebellious: true,
      dead: false,
    );
  });

  group(
    "Person:",
    () {
      test("toMap returns map equivalent of object", () {
        final Map<String, Object?> correctMap = {
          "_id": 1,
          "gameID": 2,
          "firstName": "Ify",
          "lastName": "Eze",
          "dayOfBirth": 21,
          "gender": "Female",
          "subjectPronoun": "she",
          "objectPronoun": "her",
          "possessivePronoun": "her",
          "sexuality": "Straight",
          "state": "state",
          "country": "country",
          "money": 120,
          "importantStatus": null,
          "custodianID": 2,
          "zodiacSign": "Libra",
          "hasDriversLicense": 1,
          "transportMode": "bus",
          "hasFertilityIssues": 0,
          "onBirthControl": 0,
          "isSterile": 0,
          "sickly": 0,
          "rebellious": 1,
          "dead": 0,
        };

        expect(sut.toMap(), correctMap);
      });

      test("fromMap returns person object equivalent of map ", () {
        final Map<String, Object?> map = {
          "_id": 1,
          "gameID": 2,
          "firstName": "Ify",
          "lastName": "Eze",
          "dayOfBirth": 21,
          "gender": "Female",
          "subjectPronoun": "she",
          "objectPronoun": "her",
          "possessivePronoun": "her",
          "sexuality": "Straight",
          "state": "state",
          "country": "country",
          "money": 120,
          "importantStatus": null,
          "custodianID": 2,
          "zodiacSign": "Libra",
          "hasDriversLicense": 1,
          "transportMode": "bus",
          "hasFertilityIssues": 0,
          "onBirthControl": 0,
          "isSterile": 0,
          "sickly": 0,
          "rebellious": 1,
          "dead": 0,
        };

        final result = Person.fromMap(personMap: map);

        expect(result, sut);
      });

      test("copyWith creates new object with correct values", () {
        final correctPerson = Person(
          id: 1,
          gameID: 2,
          firstName: "Ify",
          lastName: "Eze",
          dayOfBirth: 21,
          gender: Gender.Female.name,
          subjectPronoun: Gender.Female.subjectPronoun,
          objectPronoun: Gender.Female.objectPronoun,
          possessivePronoun: Gender.Female.possessivepronoun,
          sexuality: Sexuality.Bisexual.name,
          state: "state",
          country: "country",
          money: 80,
          zodiacSign: ZodiacSign.Libra.name,
          importantStatus: "status changed",
          custodianID: 2,
          hasDriversLicense: false,
          transportMode: "train",
          hasFertilityIssues: false,
          onBirthControl: false,
          isSterile: false,
          sickly: false,
          rebellious: false,
          dead: false,
        );

        final result = sut.copyWith(
          sexuality: Sexuality.Bisexual.name,
          importantStatus: "status changed",
          rebellious: false,
          hasDriversLicense: false,
          money: 80,
          transportMode: "train",
        );
        expect(result, correctPerson);
      });

      group("Constants:", () {
        test("id column should be defined as _id", () {
          expect(Person.idColumn, "_id");
        });
      });
    },
  );
}
