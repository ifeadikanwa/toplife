import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_relationship/constants/romantic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/get_romantic_relationship_label_from_string.dart';

void main() {
  group('get romantic relationship label from string:', () {
    test('given an invalid relationship string, we ge the correct result', () {
      final result = getRomanticRelationshipLabelFromString(
        romanticRelationshipTypeString: "WRONG",
        genderString: Gender.Female.name,
        activeRomance: true,
        isCoParent: false,
      );

      expect(result, "");
    });

      test('given an valid relationship string, we ge the correct result', () {
      final result = getRomanticRelationshipLabelFromString(
        romanticRelationshipTypeString: RomanticRelationshipType.engaged.name,
        genderString: Gender.Female.name,
        activeRomance: true,
        isCoParent: false,
      );

      expect(result, "Fiancée");
    });
  });
}
