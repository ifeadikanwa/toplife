import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_relationship_type_info_pair.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/constants/relationship_constants.dart';
import 'package:toplife/main_systems/system_relationship/constants/romantic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_type_info.dart';
import 'package:toplife/main_systems/system_relationship/util/parent_intro_string/create_basic_parent_introduction_string.dart';

import '../../../_reusable_test_objects/reusable_test_objects.dart';

void main() {
  group("createBasicParentIntroductionString: ", () {
    const String separator = RelationshipConstants.relationshipLabelSeparator;
    test(
        "given empty parents with relationships list and empty parent without relationship, we get the correct string",
        () {
      final List<PersonRelationshipTypeInfoPair> parentsWithRelationship = [];

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
      final List<PersonRelationshipTypeInfoPair> parentsWithRelationship = [];
      test("a single parent without relationship, we get the correct string",
          () {
        final List<Person> parentsWithoutRelationship = [
          ReusableTestObjects.testPerson.copyWith(
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
        final List<PersonRelationshipTypeInfoPair> parentsWithRelationship = [
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
          ),
        ];

        const correctResult =
            "Helen Polut (ex-girlfriend, formerly step-cousin), ";

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
        final List<PersonRelationshipTypeInfoPair> parentsWithRelationship = [
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
          ),
        ];

        const correctResult =
            "Helen Polut (ex-girlfriend, formerly step-cousin), Frederick Lokia (cousin/grandfather), and Xander Rett (brother-in-law/baby daddy), ";

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
        final List<PersonRelationshipTypeInfoPair> parentsWithRelationship = [
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
          ),
        ];

        //WITHOUT
        final List<Person> parentsWithoutRelationship = [
          ReusableTestObjects.testPerson.copyWith(
            firstName: "Veronica",
            lastName: "Kolp",
          ),
        ];

        const correctResult =
            "Helen Polut (ex-girlfriend, formerly step-cousin), and Veronica Kolp, ";

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
        final List<PersonRelationshipTypeInfoPair> parentsWithRelationship = [
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
          ),
        ];

        //WITHOUT
        final List<Person> parentsWithoutRelationship = [
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
            "Helen Polut (ex-girlfriend, formerly step-cousin), John Freso, Debra Dopr, and Veronica Kolp, ";

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
        final List<PersonRelationshipTypeInfoPair> parentsWithRelationship = [
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
          ),
        ];

        //WITHOUT
        final List<Person> parentsWithoutRelationship = [
          ReusableTestObjects.testPerson.copyWith(
            firstName: "John",
            lastName: "Freso",
          ),
        ];

        const correctResult =
            "Helen Polut (ex-girlfriend, formerly step-cousin), Frederick Lokia (cousin${separator}grandfather), Xander Rett (brother-in-law${separator}baby daddy), and John Freso, ";

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
        final List<PersonRelationshipTypeInfoPair> parentsWithRelationship = [
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
          ),
        ];

        //WITHOUT
        final List<Person> parentsWithoutRelationship = [
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
            "Helen Polut (ex-girlfriend, formerly step-cousin), Frederick Lokia (cousin${separator}grandfather), Xander Rett (brother-in-law${separator}baby daddy), John Freso, Debra Dopr, and Veronica Kolp, ";

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
