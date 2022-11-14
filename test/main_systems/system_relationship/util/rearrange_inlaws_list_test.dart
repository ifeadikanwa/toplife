import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_relationship/constants/inlaw_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/inlaw.dart';
import 'package:toplife/main_systems/system_relationship/util/rearrange_inlaws_list.dart';

void main() {
  group("rearrangeInLawsList:", () {
    test(
        "given a list of in laws in order sibling -> parent -> child they will be rearranged in the order parent -> child -> sibling",
        () {
      List<RelationshipPair<InLaw, Person>> givenInLawsList = [
        RelationshipPair(
          relationship: InLaw(
              mainPersonID: 1,
              inLawID: 2,
              likesMainPerson: true,
              inLawRelationshipType: InLawRelationshipType.sibling.name,
              relationship: 89),
          person: const Person(
            firstName: "Janet",
            lastName: "Johnson",
            dayOfBirth: 34,
            gender: "gender",
            subjectPronoun: "subjectPronoun",
            objectPronoun: "objectPronoun",
            possessivePronoun: "possessivePronoun",
            sexuality: "sexuality",
            state: "state",
            country: "country",
            money: 120,
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
          relationship: InLaw(
              mainPersonID: 1,
              inLawID: 2,
              likesMainPerson: true,
              inLawRelationshipType: InLawRelationshipType.parent.name,
              relationship: 89),
          person: const Person(
            firstName: "Janet",
            lastName: "Johnson",
            dayOfBirth: 34,
            gender: "gender",
            subjectPronoun: "subjectPronoun",
            objectPronoun: "objectPronoun",
            possessivePronoun: "possessivePronoun",
            sexuality: "sexuality",
            state: "state",
            country: "country",
            money: 120,
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
          relationship: InLaw(
              mainPersonID: 1,
              inLawID: 2,
              likesMainPerson: true,
              inLawRelationshipType: InLawRelationshipType.child.name,
              relationship: 89),
          person: const Person(
            firstName: "Janet",
            lastName: "Johnson",
            dayOfBirth: 34,
            gender: "gender",
            subjectPronoun: "subjectPronoun",
            objectPronoun: "objectPronoun",
            possessivePronoun: "possessivePronoun",
            sexuality: "sexuality",
            state: "state",
            country: "country",
            money: 120,
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

      final List<RelationshipPair<InLaw, Person>> correctInLawsList = [
        RelationshipPair(
          relationship: InLaw(
              mainPersonID: 1,
              inLawID: 2,
              likesMainPerson: true,
              inLawRelationshipType: InLawRelationshipType.parent.name,
              relationship: 89),
          person: const Person(
            firstName: "Janet",
            lastName: "Johnson",
            dayOfBirth: 34,
            gender: "gender",
            subjectPronoun: "subjectPronoun",
            objectPronoun: "objectPronoun",
            possessivePronoun: "possessivePronoun",
            sexuality: "sexuality",
            state: "state",
            country: "country",
            money: 120,
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
          relationship: InLaw(
              mainPersonID: 1,
              inLawID: 2,
              likesMainPerson: true,
              inLawRelationshipType: InLawRelationshipType.child.name,
              relationship: 89),
          person: const Person(
            firstName: "Janet",
            lastName: "Johnson",
            dayOfBirth: 34,
            gender: "gender",
            subjectPronoun: "subjectPronoun",
            objectPronoun: "objectPronoun",
            possessivePronoun: "possessivePronoun",
            sexuality: "sexuality",
            state: "state",
            country: "country",
            money: 120,
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
          relationship: InLaw(
              mainPersonID: 1,
              inLawID: 2,
              likesMainPerson: true,
              inLawRelationshipType: InLawRelationshipType.sibling.name,
              relationship: 89),
          person: const Person(
            firstName: "Janet",
            lastName: "Johnson",
            dayOfBirth: 34,
            gender: "gender",
            subjectPronoun: "subjectPronoun",
            objectPronoun: "objectPronoun",
            possessivePronoun: "possessivePronoun",
            sexuality: "sexuality",
            state: "state",
            country: "country",
            money: 120,
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

      final List<RelationshipPair<InLaw, Person>> resultInLawsList =
          rearrangeInLawsList(givenInLawsList);

      expect(resultInLawsList[0], correctInLawsList[0],
          reason: "Cause: index 0");
      expect(resultInLawsList[1], correctInLawsList[1],
          reason: "Cause: index 1");
      expect(resultInLawsList[2], correctInLawsList[2],
          reason: "Cause: index 2");
    });
  });
}
