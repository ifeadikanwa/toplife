import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_platonic_relationship_types_list_pair.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/create_basic_parent_introduction_string.dart';

void main() {
  group("createBasicParentIntroductionString: ", () {
    const Person testPerson = Person(
      id: 1,
      gameId: 2,
      hasDriversLicense: false,
      firstName: "FirstName",
      lastName: "LastName",
      dayOfBirth: 34,
      gender: "Female",
      subjectPronoun: "subjectPronoun",
      objectPronoun: "objectPronoun",
      possessivePronoun: "possessivePronoun",
      sexuality: "sexuality",
      birthState: "Ontario",
      birthCountry: "Canada",
      currentState: "Ontario",
      currentCountry: "Canada",
      money: 120,
      emotionalState: "normal",
      zodiacSign: "zodiacSign",
      transportMode: "bus",
      drivingMode: "drivingMode",
      hasFertilityIssues: true,
      onBirthControl: false,
      isSterile: false,
      sickly: true,
      dead: false,
    );
    test(
        "given empty parents with relationships list and empty parent without relationship, we get the correct string",
        () {
      final List<PersonPlatonicRelationshipTypesListPair>
          parentsWithRelationship = [];

      final List<Person> parentsWithoutRelationship = [];

      const correctResult = "";

      expect(
        createBasicParentIntroductionString(
          parentsWithRelationshipList: parentsWithRelationship,
          parentsWithoutRelationshipList: parentsWithoutRelationship,
        ),
        correctResult,
      );
    });

    group("given empty parents with relationships list, and: ", () {
      //with
      final List<PersonPlatonicRelationshipTypesListPair>
          parentsWithRelationship = [];
      test("a single parent without relationship, we get the correct string",
          () {
        final List<Person> parentsWithoutRelationship = [
          testPerson.copyWith(
            firstName: "John",
            lastName: "Freso",
          ),
        ];

        const correctResult = "John Freso, ";

        expect(
          createBasicParentIntroductionString(
            parentsWithRelationshipList: parentsWithRelationship,
            parentsWithoutRelationshipList: parentsWithoutRelationship,
          ),
          correctResult,
        );
      });

      test("multiple parents without relationship, we get the correct string",
          () {
        final List<Person> parentsWithoutRelationship = [
          testPerson.copyWith(
            firstName: "John",
            lastName: "Freso",
          ),
          testPerson.copyWith(
            firstName: "Debra",
            lastName: "Dopr",
          ),
          testPerson.copyWith(
            firstName: "Veronica",
            lastName: "Kolp",
          ),
        ];

        const correctResult = "John Freso, Debra Dopr, and Veronica Kolp, ";

        expect(
          createBasicParentIntroductionString(
            parentsWithRelationshipList: parentsWithRelationship,
            parentsWithoutRelationshipList: parentsWithoutRelationship,
          ),
          correctResult,
        );
      });
    });

    group("given empty parents without relationships list, and: ", () {
      //wthout
      final List<Person> parentsWithoutRelationship = [];
      test("a single parent with relationship, we get the correct string", () {
        final List<PersonPlatonicRelationshipTypesListPair>
            parentsWithRelationship = [
          PersonPlatonicRelationshipTypesListPair(
            person: testPerson.copyWith(
              firstName: "Helen",
              lastName: "Polut",
            ),
            platonicRelationshipTypesList: const [
              PlatonicRelationshipType.fullSibling
            ],
            previousFamilialRelationship: PlatonicRelationshipType.friend,
          ),
        ];

        const correctResult = "Helen Polut (full sister, formerly friend), ";

        expect(
          createBasicParentIntroductionString(
            parentsWithRelationshipList: parentsWithRelationship,
            parentsWithoutRelationshipList: parentsWithoutRelationship,
          ),
          correctResult,
        );
      });

      test("multiple parents with relationship, we get the correct string", () {
        //
        final List<PersonPlatonicRelationshipTypesListPair>
            parentsWithRelationship = [
          //
          PersonPlatonicRelationshipTypesListPair(
            person: testPerson.copyWith(
              firstName: "Helen",
              lastName: "Polut",
            ),
            platonicRelationshipTypesList: const [
              PlatonicRelationshipType.fullSibling
            ],
            previousFamilialRelationship: PlatonicRelationshipType.friend,
          ),
          //
          PersonPlatonicRelationshipTypesListPair(
            person: testPerson.copyWith(
              firstName: "Frederick",
              lastName: "Lokia",
              gender: "Male",
            ),
            platonicRelationshipTypesList: const [
              PlatonicRelationshipType.cousin,
              PlatonicRelationshipType.grandParent,
            ],
            previousFamilialRelationship: null,
          ),
          //
          PersonPlatonicRelationshipTypesListPair(
            person: testPerson.copyWith(
              firstName: "Xander",
              lastName: "Rett",
              gender: "Male",
            ),
            platonicRelationshipTypesList: const [
              PlatonicRelationshipType.childInLaw,
            ],
            previousFamilialRelationship: null,
          ),
        ];

        const correctResult =
            "Helen Polut (full sister, formerly friend), Frederick Lokia (cousin/grandfather), and Xander Rett (son-in-law), ";

        expect(
          createBasicParentIntroductionString(
            parentsWithRelationshipList: parentsWithRelationship,
            parentsWithoutRelationshipList: parentsWithoutRelationship,
          ),
          correctResult,
        );
      });
    });

    group(
        "given parents with relationships list and parents without relatonships list: ",
        () {
      test(
          "single parent with relationship and single parent without relationship, we get the correct string",
          () {
        //WITH
        final List<PersonPlatonicRelationshipTypesListPair>
            parentsWithRelationship = [
          PersonPlatonicRelationshipTypesListPair(
            person: testPerson.copyWith(
              firstName: "Helen",
              lastName: "Polut",
            ),
            platonicRelationshipTypesList: const [
              PlatonicRelationshipType.fullSibling
            ],
            previousFamilialRelationship: PlatonicRelationshipType.friend,
          ),
        ];

        //WITHOUT
        final List<Person> parentsWithoutRelationship = [
          testPerson.copyWith(
            firstName: "Veronica",
            lastName: "Kolp",
          ),
        ];

        const correctResult =
            "Helen Polut (full sister, formerly friend), and Veronica Kolp, ";

        expect(
          createBasicParentIntroductionString(
            parentsWithRelationshipList: parentsWithRelationship,
            parentsWithoutRelationshipList: parentsWithoutRelationship,
          ),
          correctResult,
        );
      });

      test(
          "single parent with relationship and multiple parents without relationship, we get the correct string",
          () {
        //WITH
        final List<PersonPlatonicRelationshipTypesListPair>
            parentsWithRelationship = [
          PersonPlatonicRelationshipTypesListPair(
            person: testPerson.copyWith(
              firstName: "Helen",
              lastName: "Polut",
            ),
            platonicRelationshipTypesList: const [
              PlatonicRelationshipType.fullSibling
            ],
            previousFamilialRelationship: PlatonicRelationshipType.friend,
          ),
        ];

        //WITHOUT
        final List<Person> parentsWithoutRelationship = [
          testPerson.copyWith(
            firstName: "John",
            lastName: "Freso",
          ),
          testPerson.copyWith(
            firstName: "Debra",
            lastName: "Dopr",
          ),
          testPerson.copyWith(
            firstName: "Veronica",
            lastName: "Kolp",
          ),
        ];

        const correctResult =
            "Helen Polut (full sister, formerly friend), John Freso, Debra Dopr, and Veronica Kolp, ";

        expect(
          createBasicParentIntroductionString(
            parentsWithRelationshipList: parentsWithRelationship,
            parentsWithoutRelationshipList: parentsWithoutRelationship,
          ),
          correctResult,
        );
      });

      test(
          "multiple parents with relationship and single parent without relationship, we get the correct string",
          () {
        //WITH
        final List<PersonPlatonicRelationshipTypesListPair>
            parentsWithRelationship = [
          //
          PersonPlatonicRelationshipTypesListPair(
            person: testPerson.copyWith(
              firstName: "Helen",
              lastName: "Polut",
            ),
            platonicRelationshipTypesList: const [
              PlatonicRelationshipType.fullSibling
            ],
            previousFamilialRelationship: PlatonicRelationshipType.friend,
          ),
          //
          PersonPlatonicRelationshipTypesListPair(
            person: testPerson.copyWith(
              firstName: "Frederick",
              lastName: "Lokia",
              gender: "Male",
            ),
            platonicRelationshipTypesList: const [
              PlatonicRelationshipType.cousin,
              PlatonicRelationshipType.grandParent,
            ],
            previousFamilialRelationship: null,
          ),
          //
          PersonPlatonicRelationshipTypesListPair(
            person: testPerson.copyWith(
              firstName: "Xander",
              lastName: "Rett",
              gender: "Male",
            ),
            platonicRelationshipTypesList: const [
              PlatonicRelationshipType.childInLaw,
            ],
            previousFamilialRelationship: null,
          ),
        ];

        //WITHOUT
        final List<Person> parentsWithoutRelationship = [
          testPerson.copyWith(
            firstName: "John",
            lastName: "Freso",
          ),
        ];

        const correctResult =
            "Helen Polut (full sister, formerly friend), Frederick Lokia (cousin/grandfather), Xander Rett (son-in-law), and John Freso, ";

        expect(
          createBasicParentIntroductionString(
            parentsWithRelationshipList: parentsWithRelationship,
            parentsWithoutRelationshipList: parentsWithoutRelationship,
          ),
          correctResult,
        );
      });

      test(
          "multiple parents with relationship and multiple parents without relationship, we get the correct string",
          () {
        //WITH
        final List<PersonPlatonicRelationshipTypesListPair>
            parentsWithRelationship = [
          //
          PersonPlatonicRelationshipTypesListPair(
            person: testPerson.copyWith(
              firstName: "Helen",
              lastName: "Polut",
            ),
            platonicRelationshipTypesList: const [
              PlatonicRelationshipType.fullSibling
            ],
            previousFamilialRelationship: PlatonicRelationshipType.friend,
          ),
          //
          PersonPlatonicRelationshipTypesListPair(
            person: testPerson.copyWith(
              firstName: "Frederick",
              lastName: "Lokia",
              gender: "Male",
            ),
            platonicRelationshipTypesList: const [
              PlatonicRelationshipType.cousin,
              PlatonicRelationshipType.grandParent,
            ],
            previousFamilialRelationship: null,
          ),
          //
          PersonPlatonicRelationshipTypesListPair(
            person: testPerson.copyWith(
              firstName: "Xander",
              lastName: "Rett",
              gender: "Male",
            ),
            platonicRelationshipTypesList: const [
              PlatonicRelationshipType.childInLaw,
            ],
            previousFamilialRelationship: null,
          ),
        ];

        //WITHOUT
        final List<Person> parentsWithoutRelationship = [
          testPerson.copyWith(
            firstName: "John",
            lastName: "Freso",
          ),
          testPerson.copyWith(
            firstName: "Debra",
            lastName: "Dopr",
          ),
          testPerson.copyWith(
            firstName: "Veronica",
            lastName: "Kolp",
          ),
        ];

        const correctResult =
            "Helen Polut (full sister, formerly friend), Frederick Lokia (cousin/grandfather), Xander Rett (son-in-law), John Freso, Debra Dopr, and Veronica Kolp, ";

        expect(
          createBasicParentIntroductionString(
            parentsWithRelationshipList: parentsWithRelationship,
            parentsWithoutRelationshipList: parentsWithoutRelationship,
          ),
          correctResult,
        );
      });
    });
  });
}
