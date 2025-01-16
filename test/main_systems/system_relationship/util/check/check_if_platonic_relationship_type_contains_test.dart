import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/util/check/check_if_platonic_relationship_type_contains.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/util/get_db_formatted_platonic_relationship_type_string.dart';

void main() {
  group('Check if platonic relationship type contains:', () {
    test('given an invalid string we get false', () {
      expect(
        checkIfPlatonicRelationshipTypeStringContains(
          "WRONG",
          PlatonicRelationshipType.childInLaw,
        ),
        false,
      );
    });

    test('given an valid string with the queried category we get true', () {
      expect(
        checkIfPlatonicRelationshipTypeStringContains(
          getDbFormattedPlatonicRelationshipTypeString(
                  PlatonicRelationshipType.adoptiveParent) +
              getDbFormattedPlatonicRelationshipTypeString(
                  PlatonicRelationshipType.adoptiveChild) +
              getDbFormattedPlatonicRelationshipTypeString(
                  PlatonicRelationshipType.cousin),
          PlatonicRelationshipType.adoptiveChild,
        ),
        true,
      );
    });

    test('given an valid string without the queried category we get false', () {
      expect(
        checkIfPlatonicRelationshipTypeStringContains(
          getDbFormattedPlatonicRelationshipTypeString(
                  PlatonicRelationshipType.adoptiveParent) +
              getDbFormattedPlatonicRelationshipTypeString(
                  PlatonicRelationshipType.adoptiveChild) +
              getDbFormattedPlatonicRelationshipTypeString(
                  PlatonicRelationshipType.cousin),
          PlatonicRelationshipType.acquaintance,
        ),
        false,
      );
    });
  });
}
