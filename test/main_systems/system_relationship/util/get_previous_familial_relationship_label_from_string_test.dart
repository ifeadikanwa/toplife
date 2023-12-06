import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/get_db_formatted_platonic_relationship_type_string.dart';
import 'package:toplife/main_systems/system_relationship/util/get_previous_familial_relationship_label_from_string.dart';

void main() {
  group('get previous familial relationship label from string:', () {
    test('given an invalid relatonship string, we get the correct result', () {
      final result = getPreviousFamilialRelationshipLabelFromString(
        previousFamilialRelationshipString: "WRONG",
        genderString: Gender.Female.name,
      );

      expect(result, "");
    });

    test('given an valid relatonship string, we get the correct result', () {
      final result = getPreviousFamilialRelationshipLabelFromString(
        previousFamilialRelationshipString:
            getDbFormattedPlatonicRelationshipTypeString(
                PlatonicRelationshipType.distantRelative),
        genderString: Gender.Female.name,
      );

      expect(result, ", formerly Distant relative");
    });
  });
}
