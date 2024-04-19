import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_relationship/constants/romantic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/enum/get_romantic_relationship_type_enum_from_string.dart';

void main() {
  group('get romantic relationship type enum from string:', () {
    test('given an invalid romantic relationship type string we get null', () {
      expect(
        getRomanticRelationshipTypeEnumFromString(
            romanticRelationshipTypeString: "WRONG"),
        null,
      );
    });

    test('given an valid romantic relationship type string we get null', () {
      expect(
        getRomanticRelationshipTypeEnumFromString(
          romanticRelationshipTypeString: RomanticRelationshipType.dating.name,
        ),
        RomanticRelationshipType.dating,
      );
    });
  });
}
