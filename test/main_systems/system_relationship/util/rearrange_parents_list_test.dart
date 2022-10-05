import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_relationship/constants/parent_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/parent.dart';
import 'package:toplife/main_systems/system_relationship/util/rearrange_parents_list.dart';

void main() {
  group("rearrangeParentsList:", () {
    test(
        "given a parents list in the order grand -> main -> step rearrange list in the order main -> step -> grand",
        () {
      List<RelationshipPair<Parent, Person>> givenParentList = [
        RelationshipPair(
          relationship: Parent(
              mainPersonID: 1,
              parentID: 2,
              parentRelationshipType: ParentRelationshipType.grand.name,
              relationship: 34,
              isActive: true),
          person: const Person(
            firstName: "Sam",
            lastName: "Johnson",
            dayOfBirth: 34,
            gender: "gender",
            subjectPronoun: "subjectPronoun",
            objectPronoun: "objectPronoun",
            possessivePronoun: "possessivePronoun",
            sexuality: "sexuality",
            state: "state",
            country: "country",
            money: 20,
            zodiacSign: "zodiacSign",
            hasFertilityIssues: true,
            onBirthControl: false,
            isSterile: false,
            sickly: true,
            rebellious: false,
            dead: false,
          ),
        ),
        RelationshipPair(
          relationship: Parent(
              mainPersonID: 1,
              parentID: 2,
              parentRelationshipType: ParentRelationshipType.main.name,
              relationship: 34,
              isActive: true),
          person: const Person(
            firstName: "Sam",
            lastName: "Johnson",
            dayOfBirth: 34,
            gender: "gender",
            subjectPronoun: "subjectPronoun",
            objectPronoun: "objectPronoun",
            possessivePronoun: "possessivePronoun",
            sexuality: "sexuality",
            state: "state",
            country: "country",
            money: 20,
            zodiacSign: "zodiacSign",
            hasFertilityIssues: true,
            onBirthControl: false,
            isSterile: false,
            sickly: true,
            rebellious: false,
            dead: false,
          ),
        ),
        RelationshipPair(
          relationship: Parent(
              mainPersonID: 1,
              parentID: 2,
              parentRelationshipType: ParentRelationshipType.step.name,
              relationship: 34,
              isActive: true),
          person: const Person(
            firstName: "Sam",
            lastName: "Johnson",
            dayOfBirth: 34,
            gender: "gender",
            subjectPronoun: "subjectPronoun",
            objectPronoun: "objectPronoun",
            possessivePronoun: "possessivePronoun",
            sexuality: "sexuality",
            state: "state",
            country: "country",
            money: 20,
            zodiacSign: "zodiacSign",
            hasFertilityIssues: true,
            onBirthControl: false,
            isSterile: false,
            sickly: true,
            rebellious: false,
            dead: false,
          ),
        ),
      ];

      List<RelationshipPair<Parent, Person>> correctParentList = [
        RelationshipPair(
          relationship: Parent(
              mainPersonID: 1,
              parentID: 2,
              parentRelationshipType: ParentRelationshipType.main.name,
              relationship: 34,
              isActive: true),
          person: const Person(
            firstName: "Sam",
            lastName: "Johnson",
            dayOfBirth: 34,
            gender: "gender",
            subjectPronoun: "subjectPronoun",
            objectPronoun: "objectPronoun",
            possessivePronoun: "possessivePronoun",
            sexuality: "sexuality",
            state: "state",
            country: "country",
            money: 20,
            zodiacSign: "zodiacSign",
            hasFertilityIssues: true,
            onBirthControl: false,
            isSterile: false,
            sickly: true,
            rebellious: false,
            dead: false,
          ),
        ),
        RelationshipPair(
          relationship: Parent(
              mainPersonID: 1,
              parentID: 2,
              parentRelationshipType: ParentRelationshipType.step.name,
              relationship: 34,
              isActive: true),
          person: const Person(
            firstName: "Sam",
            lastName: "Johnson",
            dayOfBirth: 34,
            gender: "gender",
            subjectPronoun: "subjectPronoun",
            objectPronoun: "objectPronoun",
            possessivePronoun: "possessivePronoun",
            sexuality: "sexuality",
            state: "state",
            country: "country",
            money: 20,
            zodiacSign: "zodiacSign",
            hasFertilityIssues: true,
            onBirthControl: false,
            isSterile: false,
            sickly: true,
            rebellious: false,
            dead: false,
          ),
        ),
        RelationshipPair(
          relationship: Parent(
              mainPersonID: 1,
              parentID: 2,
              parentRelationshipType: ParentRelationshipType.grand.name,
              relationship: 34,
              isActive: true),
          person: const Person(
            firstName: "Sam",
            lastName: "Johnson",
            dayOfBirth: 34,
            gender: "gender",
            subjectPronoun: "subjectPronoun",
            objectPronoun: "objectPronoun",
            possessivePronoun: "possessivePronoun",
            sexuality: "sexuality",
            state: "state",
            country: "country",
            money: 20,
            zodiacSign: "zodiacSign",
            hasFertilityIssues: true,
            onBirthControl: false,
            isSterile: false,
            sickly: true,
            rebellious: false,
            dead: false,
          ),
        ),
      ];

      final resultParentList = rearrangeParentsList(givenParentList);

      expect(resultParentList[0], correctParentList[0],
          reason: "Cause: index 0");
      expect(resultParentList[1], correctParentList[1],
          reason: "Cause: index 1");
      expect(resultParentList[2], correctParentList[2],
          reason: "Cause: index 2");
    });
  });
}
