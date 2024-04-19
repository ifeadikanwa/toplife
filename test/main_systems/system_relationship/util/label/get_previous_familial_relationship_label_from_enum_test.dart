import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/label/get_previous_familial_relationship_label_from_enum.dart';

void main() {
  group('get previous familial relationship label from enum:', () {
    test('we get the correct result', () {
      final result = getPreviousFamilialRelationshipLabelFromEnum(
        previousFamilialRelationshipEnum: PlatonicRelationshipType.grandChild,
        genderString: Gender.Male.name,
      );

      expect(result, ", formerly grandson");
    });

    test('we get the correct result WITh request for Not lowercase', () {
      final result = getPreviousFamilialRelationshipLabelFromEnum(
        previousFamilialRelationshipEnum: PlatonicRelationshipType.grandChild,
        genderString: Gender.Male.name,
        toLowerCase: false,
      );

      expect(result, ", formerly Grandson");
    });
  });
}
