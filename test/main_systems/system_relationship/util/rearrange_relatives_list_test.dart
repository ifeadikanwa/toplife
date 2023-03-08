import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/constants/relative_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/util/rearrange_relatives_list.dart';

void main() {
  group("rearrangeRelativesList:", () {
    test(
        "given a relatives list in the order nibling -> grandchild -> cousin -> pibling rearrange list in the order granchild -> nibling -> pibling -> cousin",
        () {
      List<RelationshipPair<Relative>> givenRelativesList = [
        RelationshipPair(
          relationship: Relative(
            mainPersonId: 1,
            relativeId: 2,
            currentlyLivingTogether: true,
            relativeRelationshipType: RelativeRelationshipType.nibling.name,
            relationship: 56,
          ),
          person: const Person(
            id: 1,
            gameId: 2,
            hasDriversLicense: false,
            firstName: "Sam",
            lastName: "Johnson",
            dayOfBirth: 34,
            gender: "gender",
            subjectPronoun: "subjectPronoun",
            objectPronoun: "objectPronoun",
            possessivePronoun: "possessivePronoun",
            sexuality: "sexuality",
            birthState: "Ontario",
            birthCountry: "Canada",
            currentState: "Ontario",
            currentCountry: "Canada",
            money: 20,
            zodiacSign: "zodiacSign",
            transportMode: "bus",
            hasFertilityIssues: true,
            onBirthControl: false,
            isSterile: false,
            sickly: true,
            rebellious: false,
            dead: false,
          ),
        ),
        RelationshipPair(
          relationship: Relative(
            mainPersonId: 1,
            relativeId: 2,
            currentlyLivingTogether: true,
            relativeRelationshipType: RelativeRelationshipType.grandchild.name,
            relationship: 56,
          ),
          person: const Person(
            id: 1,
            gameId: 2,
            hasDriversLicense: false,
            firstName: "Sam",
            lastName: "Johnson",
            dayOfBirth: 34,
            gender: "gender",
            subjectPronoun: "subjectPronoun",
            objectPronoun: "objectPronoun",
            possessivePronoun: "possessivePronoun",
            sexuality: "sexuality",
            birthState: "Ontario",
            birthCountry: "Canada",
            currentState: "Ontario",
            currentCountry: "Canada",
            money: 20,
            zodiacSign: "zodiacSign",
            transportMode: "bus",
            hasFertilityIssues: true,
            onBirthControl: false,
            isSterile: false,
            sickly: true,
            rebellious: false,
            dead: false,
          ),
        ),
        RelationshipPair(
          relationship: Relative(
            mainPersonId: 1,
            relativeId: 2,
            currentlyLivingTogether: true,
            relativeRelationshipType: RelativeRelationshipType.cousin.name,
            relationship: 56,
          ),
          person: const Person(
            id: 1,
            gameId: 2,
            hasDriversLicense: false,
            firstName: "Sam",
            lastName: "Johnson",
            dayOfBirth: 34,
            gender: "gender",
            subjectPronoun: "subjectPronoun",
            objectPronoun: "objectPronoun",
            possessivePronoun: "possessivePronoun",
            sexuality: "sexuality",
            birthState: "Ontario",
            birthCountry: "Canada",
            currentState: "Ontario",
            currentCountry: "Canada",
            money: 20,
            zodiacSign: "zodiacSign",
            transportMode: "bus",
            hasFertilityIssues: true,
            onBirthControl: false,
            isSterile: false,
            sickly: true,
            rebellious: false,
            dead: false,
          ),
        ),
        RelationshipPair(
          relationship: Relative(
            mainPersonId: 1,
            relativeId: 2,
            currentlyLivingTogether: true,
            relativeRelationshipType: RelativeRelationshipType.pibling.name,
            relationship: 56,
          ),
          person: const Person(
            id: 1,
            gameId: 2,
            hasDriversLicense: false,
            firstName: "Sam",
            lastName: "Johnson",
            dayOfBirth: 34,
            gender: "gender",
            subjectPronoun: "subjectPronoun",
            objectPronoun: "objectPronoun",
            possessivePronoun: "possessivePronoun",
            sexuality: "sexuality",
            birthState: "Ontario",
            birthCountry: "Canada",
            currentState: "Ontario",
            currentCountry: "Canada",
            money: 20,
            zodiacSign: "zodiacSign",
            transportMode: "bus",
            hasFertilityIssues: true,
            onBirthControl: false,
            isSterile: false,
            sickly: true,
            rebellious: false,
            dead: false,
          ),
        ),
      ];

      List<RelationshipPair<Relative>> correctRelativesList = [
        RelationshipPair(
          relationship: Relative(
            mainPersonId: 1,
            relativeId: 2,
            currentlyLivingTogether: true,
            relativeRelationshipType: RelativeRelationshipType.grandchild.name,
            relationship: 56,
          ),
          person: const Person(
            id: 1,
            gameId: 2,
            hasDriversLicense: false,
            firstName: "Sam",
            lastName: "Johnson",
            dayOfBirth: 34,
            gender: "gender",
            subjectPronoun: "subjectPronoun",
            objectPronoun: "objectPronoun",
            possessivePronoun: "possessivePronoun",
            sexuality: "sexuality",
            birthState: "Ontario",
            birthCountry: "Canada",
            currentState: "Ontario",
            currentCountry: "Canada",
            money: 20,
            zodiacSign: "zodiacSign",
            transportMode: "bus",
            hasFertilityIssues: true,
            onBirthControl: false,
            isSterile: false,
            sickly: true,
            rebellious: false,
            dead: false,
          ),
        ),
        RelationshipPair(
          relationship: Relative(
            mainPersonId: 1,
            relativeId: 2,
            currentlyLivingTogether: true,
            relativeRelationshipType: RelativeRelationshipType.nibling.name,
            relationship: 56,
          ),
          person: const Person(
            id: 1,
            gameId: 2,
            hasDriversLicense: false,
            firstName: "Sam",
            lastName: "Johnson",
            dayOfBirth: 34,
            gender: "gender",
            subjectPronoun: "subjectPronoun",
            objectPronoun: "objectPronoun",
            possessivePronoun: "possessivePronoun",
            sexuality: "sexuality",
            birthState: "Ontario",
            birthCountry: "Canada",
            currentState: "Ontario",
            currentCountry: "Canada",
            money: 20,
            zodiacSign: "zodiacSign",
            transportMode: "bus",
            hasFertilityIssues: true,
            onBirthControl: false,
            isSterile: false,
            sickly: true,
            rebellious: false,
            dead: false,
          ),
        ),
        RelationshipPair(
          relationship: Relative(
            mainPersonId: 1,
            relativeId: 2,
            currentlyLivingTogether: true,
            relativeRelationshipType: RelativeRelationshipType.pibling.name,
            relationship: 56,
          ),
          person: const Person(
            id: 1,
            gameId: 2,
            hasDriversLicense: false,
            firstName: "Sam",
            lastName: "Johnson",
            dayOfBirth: 34,
            gender: "gender",
            subjectPronoun: "subjectPronoun",
            objectPronoun: "objectPronoun",
            possessivePronoun: "possessivePronoun",
            sexuality: "sexuality",
            birthState: "Ontario",
            birthCountry: "Canada",
            currentState: "Ontario",
            currentCountry: "Canada",
            money: 20,
            zodiacSign: "zodiacSign",
            transportMode: "bus",
            hasFertilityIssues: true,
            onBirthControl: false,
            isSterile: false,
            sickly: true,
            rebellious: false,
            dead: false,
          ),
        ),
        RelationshipPair(
          relationship: Relative(
            mainPersonId: 1,
            relativeId: 2,
            currentlyLivingTogether: true,
            relativeRelationshipType: RelativeRelationshipType.cousin.name,
            relationship: 56,
          ),
          person: const Person(
            id: 1,
            gameId: 2,
            hasDriversLicense: false,
            firstName: "Sam",
            lastName: "Johnson",
            dayOfBirth: 34,
            gender: "gender",
            subjectPronoun: "subjectPronoun",
            objectPronoun: "objectPronoun",
            possessivePronoun: "possessivePronoun",
            sexuality: "sexuality",
            birthState: "Ontario",
            birthCountry: "Canada",
            currentState: "Ontario",
            currentCountry: "Canada",
            money: 20,
            zodiacSign: "zodiacSign",
            transportMode: "bus",
            hasFertilityIssues: true,
            onBirthControl: false,
            isSterile: false,
            sickly: true,
            rebellious: false,
            dead: false,
          ),
        ),
      ];

      final resultRelativesList = rearrangeRelativesList(givenRelativesList);

      expect(resultRelativesList[0], correctRelativesList[0],
          reason: "Cause: index 0");
      expect(resultRelativesList[1], correctRelativesList[1],
          reason: "Cause: index 1");
      expect(resultRelativesList[2], correctRelativesList[2],
          reason: "Cause: index 2");
      expect(resultRelativesList[3], correctRelativesList[3],
          reason: "Cause: index 3");
    });
  });
}
