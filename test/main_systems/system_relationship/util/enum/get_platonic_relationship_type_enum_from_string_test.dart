import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/util/get_db_formatted_platonic_relationship_type_string.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/util/enum/get_platonic_relationship_type_enum_from_string.dart';

void main() {
  group("getPlatonicRelationshipTypeEnumFromString: ", () {
    test(
        "given a NOT db formatted string containing a single type, we get the equivalent enum ",
        () {
      final String singleValidTypeString =
          PlatonicRelationshipType.adoptiveChild.name;

      expect(
        getPlatonicRelationshipTypeEnumFromString(
            platonicRelationshipTypeString: singleValidTypeString),
        [PlatonicRelationshipType.adoptiveChild],
      );
    });

    test("given a invalid string, we get null", () {
      const String invalidString = "WRONG";

      expect(
        getPlatonicRelationshipTypeEnumFromString(
            platonicRelationshipTypeString: invalidString),
        null,
      );
    });

    test(
        "given a db formatted string containing a single valid type, we get the equivalent enum ",
        () {
      final String dbFormattedSingleValidTypeString =
          getDbFormattedPlatonicRelationshipTypeString(
        PlatonicRelationshipType.adoptiveChild,
      );

      expect(
        getPlatonicRelationshipTypeEnumFromString(
          platonicRelationshipTypeString: dbFormattedSingleValidTypeString,
        ),
        [PlatonicRelationshipType.adoptiveChild],
      );
    });

    test(
        "given a db formatted string containing a multiple valid types, we get the equivalent enums",
        () {
      final String dbFormattedMultipleValidTypesString =
          getDbFormattedPlatonicRelationshipTypeString(
                PlatonicRelationshipType.adoptiveChild,
              ) +
              getDbFormattedPlatonicRelationshipTypeString(
                PlatonicRelationshipType.siblingInLaw,
              );

      expect(
        getPlatonicRelationshipTypeEnumFromString(
          platonicRelationshipTypeString: dbFormattedMultipleValidTypesString,
        ),
        [
          PlatonicRelationshipType.adoptiveChild,
          PlatonicRelationshipType.siblingInLaw,
        ],
      );
    });

    test(
        "given a db formatted string containing a multiple valid AND invalid types, we get ONLY the valid equivalent enums",
        () {
      final String dbFormattedMultipleValidTypesString =
          "WRONG, ${getDbFormattedPlatonicRelationshipTypeString(
        PlatonicRelationshipType.cousin,
      )}another wrong, ${getDbFormattedPlatonicRelationshipTypeString(
        PlatonicRelationshipType.stepParent,
      )}";

      expect(
        getPlatonicRelationshipTypeEnumFromString(
          platonicRelationshipTypeString: dbFormattedMultipleValidTypesString,
        ),
        [
          PlatonicRelationshipType.cousin,
          PlatonicRelationshipType.stepParent,
        ],
      );
    });

    test(
        "given a db formatted string containing a duplicate valid types, we only get one of the equivalent enum",
        () {
      final String dbFormattedMultipleValidTypesString =
          getDbFormattedPlatonicRelationshipTypeString(
                PlatonicRelationshipType.friend,
              ) +
              getDbFormattedPlatonicRelationshipTypeString(
                PlatonicRelationshipType.pibling,
              ) +
              getDbFormattedPlatonicRelationshipTypeString(
                PlatonicRelationshipType.friend,
              );

      expect(
        getPlatonicRelationshipTypeEnumFromString(
          platonicRelationshipTypeString: dbFormattedMultipleValidTypesString,
        ),
        [
          PlatonicRelationshipType.friend,
          PlatonicRelationshipType.pibling,
        ],
      );
    });
  });
}
