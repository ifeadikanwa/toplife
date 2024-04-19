import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/constants/relationship_category.dart';
import 'package:toplife/main_systems/system_relationship/util/check/check_if_platonic_relationship_type_contains_category.dart';
import 'package:toplife/main_systems/system_relationship/util/get_db_formatted_platonic_relationship_type_string.dart';

void main() {
  group('check if platonic relationship type contains category:', () {
    test('given an invalid string we get false', () {
      expect(
        checkIfPlatonicRelationshipTypeStringContainsCategory(
          "WRONG",
          RelationshipCategory.child,
        ),
        false,
      );
    });

    test('given an valid string with the queried category we get true', () {
      expect(
        checkIfPlatonicRelationshipTypeStringContainsCategory(
          getDbFormattedPlatonicRelationshipTypeString(
                  PlatonicRelationshipType.adoptiveParent) +
              getDbFormattedPlatonicRelationshipTypeString(
                  PlatonicRelationshipType.adoptiveChild) +
              getDbFormattedPlatonicRelationshipTypeString(
                  PlatonicRelationshipType.cousin),
          RelationshipCategory.child,
        ),
        true,
      );
    });

    test('given an valid string without the queried category we get false', () {
      expect(
        checkIfPlatonicRelationshipTypeStringContainsCategory(
          getDbFormattedPlatonicRelationshipTypeString(
                  PlatonicRelationshipType.adoptiveParent) +
              getDbFormattedPlatonicRelationshipTypeString(
                  PlatonicRelationshipType.adoptiveChild) +
              getDbFormattedPlatonicRelationshipTypeString(
                  PlatonicRelationshipType.cousin),
          RelationshipCategory.inLaw,
        ),
        false,
      );
    });
  });
}
