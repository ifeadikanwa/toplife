import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/get_db_formatted_platonic_relationship_type_string.dart';
import 'package:toplife/main_systems/system_relationship/util/enum/get_previous_familial_relatonship_enum_from_string.dart';

void main() {
  group("Get Previous Familial Relationship Enum From String:", () {
    test(
        "given a db formatted string containing multiple valid types, we get only the first enum",
        () {
      final List<PlatonicRelationshipType> chosenTypes = [
        PlatonicRelationshipType.acquaintance,
        PlatonicRelationshipType.stepChild,
        PlatonicRelationshipType.childInLaw,
      ];

      //setup string
      String dbFormattedMultipleValuesString = "";
      for (var element in chosenTypes) {
        dbFormattedMultipleValuesString +=
            getDbFormattedPlatonicRelationshipTypeString(element);
      }

      //
      expect(
        getPreviousFamilialRelationshipEnumFromString(
          dbFormattedMultipleValuesString,
        ),
        PlatonicRelationshipType.acquaintance,
      );
    });

    test(
        "given a db formatted string containing a single valid type, we get the enum",
        () {
      const PlatonicRelationshipType chosenType =
          PlatonicRelationshipType.siblingInLaw;

      //setup string
      String dbFormattedSingleValueString =
          getDbFormattedPlatonicRelationshipTypeString(chosenType);

      //
      expect(
        getPreviousFamilialRelationshipEnumFromString(
          dbFormattedSingleValueString,
        ),
        PlatonicRelationshipType.siblingInLaw,
      );
    });

    test(
        "given a NOT-db formatted string containing a single valid type, we get the enum",
        () {
      const PlatonicRelationshipType chosenType =
          PlatonicRelationshipType.birthChild;

      //setup string
      String notDbFormattedSingleValueString = chosenType.name;

      //
      expect(
        getPreviousFamilialRelationshipEnumFromString(
          notDbFormattedSingleValueString,
        ),
        PlatonicRelationshipType.birthChild,
      );
    });

    test("given a string containing an invalid type, we get null", () {
      //setup string
      String invalidString = "WRONG";

      //
      expect(
        getPreviousFamilialRelationshipEnumFromString(
          invalidString,
        ),
        null,
      );
    });

    test(
        "given a db formatted string containing multiple valid AND invalid types, we get only the first valid enum",
        () {
      final List<PlatonicRelationshipType> chosenTypes = [
        PlatonicRelationshipType.grandChild,
        PlatonicRelationshipType.halfSibling,
        PlatonicRelationshipType.adoptiveParent,
      ];

      //setup string
      String dbFormattedMultipleValuesString = "WRONG, ANOTHER WRONG, ";
      for (var element in chosenTypes) {
        dbFormattedMultipleValuesString +=
            getDbFormattedPlatonicRelationshipTypeString(element);
      }

      //
      expect(
        getPreviousFamilialRelationshipEnumFromString(
          dbFormattedMultipleValuesString,
        ),
        PlatonicRelationshipType.grandChild,
      );
    });
  });
}
