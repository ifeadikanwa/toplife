import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/get_db_formatted_platonic_relationship_type_string.dart';

void main() {
  group("Get db formatted platonic relationship type string:", () {
    test("given a platonic type the function returns the correct string", () {
      const PlatonicRelationshipType chosenType =
          PlatonicRelationshipType.pibling;

      final String correctString = " ${chosenType.name}, ";

      expect(
        getDbFormattedPlatonicRelationshipTypeString(chosenType),
        correctString,
      );
    });
  });
}
