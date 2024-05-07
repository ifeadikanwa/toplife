import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/model/info_models/person_platonic_relationship_type_pair.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/util/label/get_list_of_names_and_platonic_relationship_labels.dart';

void main() {
  group('Get list of names and platonic relationship labels:', () {
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

    test('given an empty list, we get the correct string', () {
      expect(
        getListOfNamesAndPlatonicRelationshipLabels(
          [],
        ),
        "",
      );
    });

    test('given a list with one element, we get the correct string', () {
      expect(
        getListOfNamesAndPlatonicRelationshipLabels(
          [
            const PersonPlatonicRelationshipTypePair(
              person: testPerson,
              platonicRelationshipType: PlatonicRelationshipType.adoptiveChild,
            ),
          ],
        ),
        "FirstName LastName (adoptive daughter).\n",
      );
    });

    test('given a list with more then one element, we get the correct string',
        () {
      expect(
        getListOfNamesAndPlatonicRelationshipLabels(
          [
            const PersonPlatonicRelationshipTypePair(
              person: testPerson,
              platonicRelationshipType: PlatonicRelationshipType.adoptiveChild,
            ),
            const PersonPlatonicRelationshipTypePair(
              person: testPerson,
              platonicRelationshipType:
                  PlatonicRelationshipType.greatGrandNibling,
            ),
            const PersonPlatonicRelationshipTypePair(
              person: testPerson,
              platonicRelationshipType: PlatonicRelationshipType.parentInLaw,
            ),
          ],
        ),
        "FirstName LastName (adoptive daughter),\nFirstName LastName (great-grandniece),\nFirstName LastName (mother-in-law).\n",
      );
    });
  });
}
