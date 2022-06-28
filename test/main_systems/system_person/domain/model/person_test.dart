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
      sexuality: Sexuality.Straight.name,
      state: "state",
      country: "country",
      zodiacSign: ZodiacSign.Libra.name,
      importantStatus: null,
      custodianID: 2,
      hasFertilityIssues: false,
      onBirthControl: false,
      isSterile: false,
      sickly: false,
      rebellious: true,
      dead: false,
    );
  });

  group(
    "Person",
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
          "sexuality": "Straight",
          "state": "state",
          "country": "country",
          "importantStatus": null,
          "custodianID": 2,
          "zodiacSign": "Libra",
          "hasFertilityIssues": 0,
          "onBirthControl": 0,
          "isSterile": 0,
          "sickly": 0,
          "rebellious": 1,
          "dead": 0,
        };

        expect(sut.toMap(), correctMap);
      });

      test("fromMap returns game object equivalent of map ", () {
        final Map<String, Object?> map = {
          "_id": 1,
          "gameID": 2,
          "firstName": "Ify",
          "lastName": "Eze",
          "dayOfBirth": 21,
          "gender": "Female",
          "subjectPronoun": "she",
          "objectPronoun": "her",
          "sexuality": "Straight",
          "state": "state",
          "country": "country",
          "importantStatus": null,
          "custodianID": 2,
          "zodiacSign": "Libra",
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
          sexuality: Sexuality.Bisexual.name,
          state: "state",
          country: "country",
          zodiacSign: ZodiacSign.Libra.name,
          importantStatus: "status changed",
          custodianID: 2,
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
        );
        expect(result, correctPerson);
      });

      group("Constants", () {
        test("id column should be defined as _id", () {
          expect(Person.idColumn, "_id");
        });
      });
    },
  );
}
