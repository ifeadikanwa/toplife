import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_platonic_relationship_types_list_pair.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/create_spouse_parent_introduction_string.dart';

void main() {
  group("createSpouseParentIntroductionString: ", () {
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
        "given empty familial spouse to parent map and empty parent without familial relationship, we get the correct string",
        () {
      final Map<PersonPlatonicRelationshipTypesListPair, Person>
          familialSpouseToParentMap = {};

      final List<Person> parentsWithNoFamilialSpouse = [];

      const correctResult = "";

      expect(
        createSpouseParentIntroductionString(
          familialSpouseToParentMap: familialSpouseToParentMap,
          parentsWithNoFamilialSpouse: parentsWithNoFamilialSpouse,
        ),
        correctResult,
      );
    });

    group("given empty familial spouse to parent map, and: ", () {
      final Map<PersonPlatonicRelationshipTypesListPair, Person>
          familialSpouseToParentMap = {};

      test(
          "a single parent without familial relationship, we get the correct string",
          () {
        final List<Person> parentsWithNoFamilialSpouse = [
          testPerson.copyWith(
            firstName: "John",
            lastName: "Freso",
          ),
        ];

        const correctResult = "John Freso, ";

        expect(
          createSpouseParentIntroductionString(
            familialSpouseToParentMap: familialSpouseToParentMap,
            parentsWithNoFamilialSpouse: parentsWithNoFamilialSpouse,
          ),
          correctResult,
        );
      });

      test(
          "multiple parents without familial relationship, we get the correct string",
          () {
        final List<Person> parentsWithNoFamilialSpouse = [
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
          createSpouseParentIntroductionString(
            familialSpouseToParentMap: familialSpouseToParentMap,
            parentsWithNoFamilialSpouse: parentsWithNoFamilialSpouse,
          ),
          correctResult,
        );
      });
    });

    group("given empty parents without familial spouse list, and: ", () {
      final List<Person> parentsWithNoFamilialSpouse = [];

      test("a single familial spouse to parent map, we get the correct string",
          () {
        final Map<PersonPlatonicRelationshipTypesListPair, Person>
            familialSpouseToParentMap = {
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
          ): testPerson.copyWith(
            firstName: "Bella",
            lastName: "Polut",
          ),
        };

        const correctResult =
            "Helen Polut's (full sister, formerly friend) spouse, Bella Polut, ";

        expect(
          createSpouseParentIntroductionString(
            familialSpouseToParentMap: familialSpouseToParentMap,
            parentsWithNoFamilialSpouse: parentsWithNoFamilialSpouse,
          ),
          correctResult,
        );
      });

      test("multiple familial spouse to parent map, we get the correct string",
          () {
        final Map<PersonPlatonicRelationshipTypesListPair, Person>
            familialSpouseToParentMap = {
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
          ): testPerson.copyWith(
            firstName: "Bella",
            lastName: "Polut",
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
          ): testPerson.copyWith(
            firstName: "Janet",
            lastName: "Lokia",
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
          ): testPerson.copyWith(
            firstName: "Landon",
            lastName: "Rett",
            gender: "Male",
          ),
        };

        const correctResult =
            "Helen Polut's (full sister, formerly friend) spouse, Bella Polut, Frederick Lokia's (cousin/grandfather) spouse, Janet Lokia, and Xander Rett's (son-in-law) spouse, Landon Rett, ";

        expect(
          createSpouseParentIntroductionString(
            familialSpouseToParentMap: familialSpouseToParentMap,
            parentsWithNoFamilialSpouse: parentsWithNoFamilialSpouse,
          ),
          correctResult,
        );
      });
    });

    group(
        "given familial spouse to parent map and parents without familial spouse list, and: ",
        () {
      test(
          "a single familial spouse to parent map and a single parent without familial relationship, we get the correct string",
          () {
        final Map<PersonPlatonicRelationshipTypesListPair, Person>
            familialSpouseToParentMap = {
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
          ): testPerson.copyWith(
            firstName: "Bella",
            lastName: "Polut",
          ),
        };

        final List<Person> parentsWithNoFamilialSpouse = [
          testPerson.copyWith(
            firstName: "John",
            lastName: "Freso",
          ),
        ];

        const correctResult =
            "Helen Polut's (full sister, formerly friend) spouse, Bella Polut, along with John Freso, ";

        expect(
          createSpouseParentIntroductionString(
            familialSpouseToParentMap: familialSpouseToParentMap,
            parentsWithNoFamilialSpouse: parentsWithNoFamilialSpouse,
          ),
          correctResult,
        );
      });

      test(
          "a single familial spouse to parent map and multiple parent without familial relationship, we get the correct string",
          () {
        final Map<PersonPlatonicRelationshipTypesListPair, Person>
            familialSpouseToParentMap = {
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
          ): testPerson.copyWith(
            firstName: "Bella",
            lastName: "Polut",
          ),
        };

        final List<Person> parentsWithNoFamilialSpouse = [
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
            "Helen Polut's (full sister, formerly friend) spouse, Bella Polut, along with John Freso, Debra Dopr, and Veronica Kolp, ";

        expect(
          createSpouseParentIntroductionString(
            familialSpouseToParentMap: familialSpouseToParentMap,
            parentsWithNoFamilialSpouse: parentsWithNoFamilialSpouse,
          ),
          correctResult,
        );
      });

      test(
          "multiple familial spouse to parent map and a single parent without familial relationship, we get the correct string",
          () {
        final Map<PersonPlatonicRelationshipTypesListPair, Person>
            familialSpouseToParentMap = {
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
          ): testPerson.copyWith(
            firstName: "Bella",
            lastName: "Polut",
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
          ): testPerson.copyWith(
            firstName: "Janet",
            lastName: "Lokia",
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
          ): testPerson.copyWith(
            firstName: "Landon",
            lastName: "Rett",
            gender: "Male",
          ),
        };

        final List<Person> parentsWithNoFamilialSpouse = [
          testPerson.copyWith(
            firstName: "John",
            lastName: "Freso",
          ),
        ];

        const correctResult =
            "Helen Polut's (full sister, formerly friend) spouse, Bella Polut, Frederick Lokia's (cousin/grandfather) spouse, Janet Lokia, Xander Rett's (son-in-law) spouse, Landon Rett, along with John Freso, ";

        expect(
          createSpouseParentIntroductionString(
            familialSpouseToParentMap: familialSpouseToParentMap,
            parentsWithNoFamilialSpouse: parentsWithNoFamilialSpouse,
          ),
          correctResult,
        );
      });

      test(
          "multiple familial spouse to parent map and multiple parents without familial relationship, we get the correct string",
          () {
        final Map<PersonPlatonicRelationshipTypesListPair, Person>
            familialSpouseToParentMap = {
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
          ): testPerson.copyWith(
            firstName: "Bella",
            lastName: "Polut",
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
          ): testPerson.copyWith(
            firstName: "Janet",
            lastName: "Lokia",
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
          ): testPerson.copyWith(
            firstName: "Landon",
            lastName: "Rett",
            gender: "Male",
          ),
        };

        final List<Person> parentsWithNoFamilialSpouse = [
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
            "Helen Polut's (full sister, formerly friend) spouse, Bella Polut, Frederick Lokia's (cousin/grandfather) spouse, Janet Lokia, Xander Rett's (son-in-law) spouse, Landon Rett, along with John Freso, Debra Dopr, and Veronica Kolp, ";

        expect(
          createSpouseParentIntroductionString(
            familialSpouseToParentMap: familialSpouseToParentMap,
            parentsWithNoFamilialSpouse: parentsWithNoFamilialSpouse,
          ),
          correctResult,
        );
      });
    });
  });
}
