import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/model/info_models/person_relationship_type_info_pair.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/relationship_constants.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/romantic_relationship_type.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/model/info_models/relationship_type_info.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/util/parent_intro_string/create_spouse_parent_introduction_string.dart';

import '../../../_reusable_test_objects/reusable_test_objects.dart';

void main() {
  group("createSpouseParentIntroductionString: ", () {
    const String separator = RelationshipConstants.relationshipLabelSeparator;

    test(
        "given empty familial spouse to parent map and empty parent without familial relationship, we get the correct string",
        () {
      final Map<PersonRelationshipTypeInfoPair, Person>
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
      final Map<PersonRelationshipTypeInfoPair, Person>
          familialSpouseToParentMap = {};

      test(
          "a single parent without familial relationship, we get the correct string",
          () {
        final List<Person> parentsWithNoFamilialSpouse = [
          ReusableTestObjects.testPerson.copyWith(
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
          ReusableTestObjects.testPerson.copyWith(
            firstName: "John",
            lastName: "Freso",
          ),
          ReusableTestObjects.testPerson.copyWith(
            firstName: "Debra",
            lastName: "Dopr",
          ),
          ReusableTestObjects.testPerson.copyWith(
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
        final Map<PersonRelationshipTypeInfoPair, Person>
            familialSpouseToParentMap = {
          //
          PersonRelationshipTypeInfoPair(
            person: ReusableTestObjects.testPerson.copyWith(
              firstName: "Helen",
              lastName: "Polut",
              gender: "Female",
            ),
            relationshipTypeInfo: const RelationshipTypeInfo(
              platonicRelationshipTypes: [PlatonicRelationshipType.friend],
              previousFamilialRelationship: PlatonicRelationshipType.stepCousin,
              romanticRelationshipType: RomanticRelationshipType.dating,
              activeRomance: false,
              isCoParent: true,
            ),
          ): ReusableTestObjects.testPerson.copyWith(
            firstName: "Bella",
            lastName: "Polut",
          ),
        };

        const correctResult =
            "Helen Polut's (ex-girlfriend, formerly step-cousin) spouse, Bella Polut, ";

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
        final Map<PersonRelationshipTypeInfoPair, Person>
            familialSpouseToParentMap = {
          //
          PersonRelationshipTypeInfoPair(
            person: ReusableTestObjects.testPerson.copyWith(
              firstName: "Helen",
              lastName: "Polut",
              gender: "Female",
            ),
            relationshipTypeInfo: const RelationshipTypeInfo(
              platonicRelationshipTypes: [PlatonicRelationshipType.friend],
              previousFamilialRelationship: PlatonicRelationshipType.stepCousin,
              romanticRelationshipType: RomanticRelationshipType.dating,
              activeRomance: false,
              isCoParent: true,
            ),
          ): ReusableTestObjects.testPerson.copyWith(
            firstName: "Bella",
            lastName: "Polut",
          ),
          //
          PersonRelationshipTypeInfoPair(
            person: ReusableTestObjects.testPerson.copyWith(
              firstName: "Frederick",
              lastName: "Lokia",
              gender: "Male",
            ),
            relationshipTypeInfo: const RelationshipTypeInfo(
              platonicRelationshipTypes: [
                PlatonicRelationshipType.cousin,
                PlatonicRelationshipType.grandParent,
              ],
              previousFamilialRelationship: null,
              romanticRelationshipType: RomanticRelationshipType.none,
              activeRomance: false,
              isCoParent: true,
            ),
          ): ReusableTestObjects.testPerson.copyWith(
            firstName: "Janet",
            lastName: "Lokia",
          ),
          //
          PersonRelationshipTypeInfoPair(
            person: ReusableTestObjects.testPerson.copyWith(
              firstName: "Xander",
              lastName: "Rett",
              gender: "Male",
            ),
            relationshipTypeInfo: const RelationshipTypeInfo(
              platonicRelationshipTypes: [
                PlatonicRelationshipType.siblingInLaw,
              ],
              previousFamilialRelationship: null,
              romanticRelationshipType: RomanticRelationshipType.casual,
              activeRomance: false,
              isCoParent: true,
            ),
          ): ReusableTestObjects.testPerson.copyWith(
            firstName: "Landon",
            lastName: "Rett",
            gender: "Male",
          ),
        };

        const correctResult =
            "Helen Polut's (ex-girlfriend, formerly step-cousin) spouse, Bella Polut, Frederick Lokia's (cousin${separator}grandfather) spouse, Janet Lokia, and Xander Rett's (brother-in-law${separator}baby daddy) spouse, Landon Rett, ";

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
        final Map<PersonRelationshipTypeInfoPair, Person>
            familialSpouseToParentMap = {
          //
          PersonRelationshipTypeInfoPair(
            person: ReusableTestObjects.testPerson.copyWith(
              firstName: "Helen",
              lastName: "Polut",
              gender: "Female",
            ),
            relationshipTypeInfo: const RelationshipTypeInfo(
              platonicRelationshipTypes: [PlatonicRelationshipType.friend],
              previousFamilialRelationship: PlatonicRelationshipType.stepCousin,
              romanticRelationshipType: RomanticRelationshipType.dating,
              activeRomance: false,
              isCoParent: true,
            ),
          ): ReusableTestObjects.testPerson.copyWith(
            firstName: "Bella",
            lastName: "Polut",
          ),
        };

        final List<Person> parentsWithNoFamilialSpouse = [
          ReusableTestObjects.testPerson.copyWith(
            firstName: "John",
            lastName: "Freso",
          ),
        ];

        const correctResult =
            "Helen Polut's (ex-girlfriend, formerly step-cousin) spouse, Bella Polut, along with John Freso, ";

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
        final Map<PersonRelationshipTypeInfoPair, Person>
            familialSpouseToParentMap = {
          //
          PersonRelationshipTypeInfoPair(
            person: ReusableTestObjects.testPerson.copyWith(
              firstName: "Helen",
              lastName: "Polut",
              gender: "Female",
            ),
            relationshipTypeInfo: const RelationshipTypeInfo(
              platonicRelationshipTypes: [PlatonicRelationshipType.friend],
              previousFamilialRelationship: PlatonicRelationshipType.stepCousin,
              romanticRelationshipType: RomanticRelationshipType.dating,
              activeRomance: false,
              isCoParent: true,
            ),
          ): ReusableTestObjects.testPerson.copyWith(
            firstName: "Bella",
            lastName: "Polut",
          ),
        };

        final List<Person> parentsWithNoFamilialSpouse = [
          ReusableTestObjects.testPerson.copyWith(
            firstName: "John",
            lastName: "Freso",
          ),
          ReusableTestObjects.testPerson.copyWith(
            firstName: "Debra",
            lastName: "Dopr",
          ),
          ReusableTestObjects.testPerson.copyWith(
            firstName: "Veronica",
            lastName: "Kolp",
          ),
        ];

        const correctResult =
            "Helen Polut's (ex-girlfriend, formerly step-cousin) spouse, Bella Polut, along with John Freso, Debra Dopr, and Veronica Kolp, ";

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
        final Map<PersonRelationshipTypeInfoPair, Person>
            familialSpouseToParentMap = {
          //
          PersonRelationshipTypeInfoPair(
            person: ReusableTestObjects.testPerson.copyWith(
              firstName: "Helen",
              lastName: "Polut",
              gender: "Female",
            ),
            relationshipTypeInfo: const RelationshipTypeInfo(
              platonicRelationshipTypes: [PlatonicRelationshipType.friend],
              previousFamilialRelationship: PlatonicRelationshipType.stepCousin,
              romanticRelationshipType: RomanticRelationshipType.dating,
              activeRomance: false,
              isCoParent: true,
            ),
          ): ReusableTestObjects.testPerson.copyWith(
            firstName: "Bella",
            lastName: "Polut",
          ),
          //
          PersonRelationshipTypeInfoPair(
            person: ReusableTestObjects.testPerson.copyWith(
              firstName: "Frederick",
              lastName: "Lokia",
              gender: "Male",
            ),
            relationshipTypeInfo: const RelationshipTypeInfo(
              platonicRelationshipTypes: [
                PlatonicRelationshipType.cousin,
                PlatonicRelationshipType.grandParent,
              ],
              previousFamilialRelationship: null,
              romanticRelationshipType: RomanticRelationshipType.none,
              activeRomance: false,
              isCoParent: true,
            ),
          ): ReusableTestObjects.testPerson.copyWith(
            firstName: "Janet",
            lastName: "Lokia",
          ),
          //
          PersonRelationshipTypeInfoPair(
            person: ReusableTestObjects.testPerson.copyWith(
              firstName: "Xander",
              lastName: "Rett",
              gender: "Male",
            ),
            relationshipTypeInfo: const RelationshipTypeInfo(
              platonicRelationshipTypes: [
                PlatonicRelationshipType.siblingInLaw,
              ],
              previousFamilialRelationship: null,
              romanticRelationshipType: RomanticRelationshipType.casual,
              activeRomance: false,
              isCoParent: true,
            ),
          ): ReusableTestObjects.testPerson.copyWith(
            firstName: "Landon",
            lastName: "Rett",
            gender: "Male",
          ),
        };

        final List<Person> parentsWithNoFamilialSpouse = [
          ReusableTestObjects.testPerson.copyWith(
            firstName: "John",
            lastName: "Freso",
          ),
        ];

        const correctResult =
            "Helen Polut's (ex-girlfriend, formerly step-cousin) spouse, Bella Polut, Frederick Lokia's (cousin${separator}grandfather) spouse, Janet Lokia, Xander Rett's (brother-in-law${separator}baby daddy) spouse, Landon Rett, along with John Freso, ";

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
        final Map<PersonRelationshipTypeInfoPair, Person>
            familialSpouseToParentMap = {
          //
          PersonRelationshipTypeInfoPair(
            person: ReusableTestObjects.testPerson.copyWith(
              firstName: "Helen",
              lastName: "Polut",
              gender: "Female",
            ),
            relationshipTypeInfo: const RelationshipTypeInfo(
              platonicRelationshipTypes: [PlatonicRelationshipType.friend],
              previousFamilialRelationship: PlatonicRelationshipType.stepCousin,
              romanticRelationshipType: RomanticRelationshipType.dating,
              activeRomance: false,
              isCoParent: true,
            ),
          ): ReusableTestObjects.testPerson.copyWith(
            firstName: "Bella",
            lastName: "Polut",
          ),
          //
          PersonRelationshipTypeInfoPair(
            person: ReusableTestObjects.testPerson.copyWith(
              firstName: "Frederick",
              lastName: "Lokia",
              gender: "Male",
            ),
            relationshipTypeInfo: const RelationshipTypeInfo(
              platonicRelationshipTypes: [
                PlatonicRelationshipType.cousin,
                PlatonicRelationshipType.grandParent,
              ],
              previousFamilialRelationship: null,
              romanticRelationshipType: RomanticRelationshipType.none,
              activeRomance: false,
              isCoParent: true,
            ),
          ): ReusableTestObjects.testPerson.copyWith(
            firstName: "Janet",
            lastName: "Lokia",
          ),
          //
          PersonRelationshipTypeInfoPair(
            person: ReusableTestObjects.testPerson.copyWith(
              firstName: "Xander",
              lastName: "Rett",
              gender: "Male",
            ),
            relationshipTypeInfo: const RelationshipTypeInfo(
              platonicRelationshipTypes: [
                PlatonicRelationshipType.siblingInLaw,
              ],
              previousFamilialRelationship: null,
              romanticRelationshipType: RomanticRelationshipType.casual,
              activeRomance: false,
              isCoParent: true,
            ),
          ): ReusableTestObjects.testPerson.copyWith(
            firstName: "Landon",
            lastName: "Rett",
            gender: "Male",
          ),
        };

        final List<Person> parentsWithNoFamilialSpouse = [
          ReusableTestObjects.testPerson.copyWith(
            firstName: "John",
            lastName: "Freso",
          ),
          ReusableTestObjects.testPerson.copyWith(
            firstName: "Debra",
            lastName: "Dopr",
          ),
          ReusableTestObjects.testPerson.copyWith(
            firstName: "Veronica",
            lastName: "Kolp",
          ),
        ];

        const correctResult =
            "Helen Polut's (ex-girlfriend, formerly step-cousin) spouse, Bella Polut, Frederick Lokia's (cousin${separator}grandfather) spouse, Janet Lokia, Xander Rett's (brother-in-law${separator}baby daddy) spouse, Landon Rett, along with John Freso, Debra Dopr, and Veronica Kolp, ";

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
