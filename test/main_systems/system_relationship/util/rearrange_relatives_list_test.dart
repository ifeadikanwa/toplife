import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_relationship/constants/relative_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/relative.dart';
import 'package:toplife/main_systems/system_relationship/util/rearrange_relatives_list.dart';

void main() {
  group("rearrangeRelativesList:", () {
    test(
        "given a relatives list in the order nibling -> grandchild rearrange list in the order granchild -> nibling",
        () {
      List<RelationshipPair<Relative, Person>> givenRelativesList = [
        RelationshipPair(
          relationship: Relative(
            mainPersonID: 1,
            relativeID: 2,
            inYourCustody: true,
            relativeRelationshipType: RelativeRelationshipType.nibling.name,
            relationship: 56,
          ),
          person: const Person(
            firstName: "Sam",
            lastName: "Johnson",
            dayOfBirth: 34,
            gender: "gender",
            subjectPronoun: "subjectPronoun",
            objectPronoun: "objectPronoun",
            sexuality: "sexuality",
            state: "state",
            country: "country",
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
          relationship: Relative(
            mainPersonID: 1,
            relativeID: 2,
            inYourCustody: true,
            relativeRelationshipType: RelativeRelationshipType.grandchild.name,
            relationship: 56,
          ),
          person: const Person(
            firstName: "Sam",
            lastName: "Johnson",
            dayOfBirth: 34,
            gender: "gender",
            subjectPronoun: "subjectPronoun",
            objectPronoun: "objectPronoun",
            sexuality: "sexuality",
            state: "state",
            country: "country",
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

      List<RelationshipPair<Relative, Person>> correctRelativesList = [
        RelationshipPair(
          relationship: Relative(
            mainPersonID: 1,
            relativeID: 2,
            inYourCustody: true,
            relativeRelationshipType: RelativeRelationshipType.grandchild.name,
            relationship: 56,
          ),
          person: const Person(
            firstName: "Sam",
            lastName: "Johnson",
            dayOfBirth: 34,
            gender: "gender",
            subjectPronoun: "subjectPronoun",
            objectPronoun: "objectPronoun",
            sexuality: "sexuality",
            state: "state",
            country: "country",
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
          relationship: Relative(
            mainPersonID: 1,
            relativeID: 2,
            inYourCustody: true,
            relativeRelationshipType: RelativeRelationshipType.nibling.name,
            relationship: 56,
          ),
          person: const Person(
            firstName: "Sam",
            lastName: "Johnson",
            dayOfBirth: 34,
            gender: "gender",
            subjectPronoun: "subjectPronoun",
            objectPronoun: "objectPronoun",
            sexuality: "sexuality",
            state: "state",
            country: "country",
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

      final resultRelativesList = rearrangeRelativesList(givenRelativesList);

      expect(resultRelativesList[0], correctRelativesList[0],
          reason: "Cause: index 0");
      expect(resultRelativesList[1], correctRelativesList[1],
          reason: "Cause: index 1");
    });
  });
}
