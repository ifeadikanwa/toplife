import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_relationship/constants/romantic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/get_romantic_relationship_label_from_enum.dart';

void main() {
  group('get romantic relationship label from enum:', () {
    test(
        'given an active romance that is not coparent we get the correct result:',
        () {
      final result = getRomanticRelationshipLabelFromEnum(
        romanticRelationshipType: RomanticRelationshipType.dating,
        genderString: Gender.Female.name,
        activeRomance: true,
        isCoParent: false,
      );

      expect(result, "Girlfriend");
    });
    test('given an active romance that is coparent we get the correct result:',
        () {
      final result = getRomanticRelationshipLabelFromEnum(
        romanticRelationshipType: RomanticRelationshipType.dating,
        genderString: Gender.Female.name,
        activeRomance: true,
        isCoParent: true,
      );

      expect(result, "Girlfriend");
    });

    test(
        'given an NON active romance that is not coparent we get the correct result:',
        () {
      final result = getRomanticRelationshipLabelFromEnum(
        romanticRelationshipType: RomanticRelationshipType.married,
        genderString: Gender.Female.name,
        activeRomance: false,
        isCoParent: false,
      );

      expect(result, "Ex-wife");
    });

    test(
        'given an NON active romance that is coparent we get the correct result:',
        () {
      final result = getRomanticRelationshipLabelFromEnum(
        romanticRelationshipType: RomanticRelationshipType.married,
        genderString: Gender.Female.name,
        activeRomance: false,
        isCoParent: true,
      );

      expect(result, "Ex-wife");
    });

    test(
        'given an NON active romance that is casual and not coparent we get the correct result:',
        () {
      final result = getRomanticRelationshipLabelFromEnum(
        romanticRelationshipType: RomanticRelationshipType.casual,
        genderString: Gender.Female.name,
        activeRomance: false,
        isCoParent: false,
      );

      expect(result, "Fling");
    });

    test(
        'given an NON active romance that is casual and coparent we get the correct result:',
        () {
      final result = getRomanticRelationshipLabelFromEnum(
        romanticRelationshipType: RomanticRelationshipType.casual,
        genderString: Gender.Female.name,
        activeRomance: false,
        isCoParent: true,
      );

      expect(result, "Baby mama");
    });

    test(
        'given an active romance that is casual and coparent we get the correct result:',
        () {
      final result = getRomanticRelationshipLabelFromEnum(
        romanticRelationshipType: RomanticRelationshipType.casual,
        genderString: Gender.Female.name,
        activeRomance: true,
        isCoParent: true,
      );

      expect(result, "Baby mama");
    });

    test(
        'given an active romance that is casual and not coparent we get the correct result:',
        () {
      final result = getRomanticRelationshipLabelFromEnum(
        romanticRelationshipType: RomanticRelationshipType.casual,
        genderString: Gender.Female.name,
        activeRomance: true,
        isCoParent: false,
      );

      expect(result, "Fling");
    });
  });
}
