import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/constants/romantic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/get_db_formatted_platonic_relationship_type_string.dart';
import 'package:toplife/main_systems/system_relationship/util/get_platonic_and_romantic_relationship_label.dart';

void main() {
  group('get platonic and romantic relationship label:', () {
    test(
        'given an invalid platonic relationship type we get the correct result',
        () {
      final result = getPlatonicAndRomanticRelationshipLabel(
        genderString: Gender.Male.name,
        platonicRelationshipTypeString: "WRONG",
        romanticRelationshipTypeString: RomanticRelationshipType.dating.name,
        previousFamilialRelationshipString:
            getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.childInLaw,
        ),
        isCoParent: false,
        activeRomance: false,
      );

      expect(
        result,
        "",
      );
    });

    test(
        'given an invalid romantic relationship type we get the correct result',
        () {
      final result = getPlatonicAndRomanticRelationshipLabel(
        genderString: Gender.Male.name,
        platonicRelationshipTypeString:
            getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.fullSibling,
        ),
        romanticRelationshipTypeString: "WRONG",
        previousFamilialRelationshipString:
            getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.childInLaw,
        ),
        isCoParent: false,
        activeRomance: false,
      );

      expect(
        result,
        "",
      );
    });

    test(
        'given an invalid previous familial relationship type we get the correct result',
        () {
      final result = getPlatonicAndRomanticRelationshipLabel(
        genderString: Gender.Male.name,
        platonicRelationshipTypeString:
            getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.friend,
        ),
        romanticRelationshipTypeString: RomanticRelationshipType.dating.name,
        previousFamilialRelationshipString: "WRONG",
        isCoParent: false,
        activeRomance: false,
      );

      expect(
        result,
        "Ex-boyfriend",
      );
    });

    test(
        'given a familial, romantic and previous familial relationship type we get the correct result',
        () {
      final result = getPlatonicAndRomanticRelationshipLabel(
        genderString: Gender.Male.name,
        platonicRelationshipTypeString:
            getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.stepSibling,
        ),
        romanticRelationshipTypeString: RomanticRelationshipType.dating.name,
        previousFamilialRelationshipString:
            getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.childInLaw,
        ),
        isCoParent: false,
        activeRomance: false,
      );

      expect(
        result,
        "Stepbrother / Ex-boyfriend",
      );
    });

    test(
        'given a friend, romantic and previous familial relationship type we get the correct result',
        () {
      final result = getPlatonicAndRomanticRelationshipLabel(
        genderString: Gender.Male.name,
        platonicRelationshipTypeString:
            getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.friend,
        ),
        romanticRelationshipTypeString: RomanticRelationshipType.dating.name,
        previousFamilialRelationshipString:
            getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.childInLaw,
        ),
        isCoParent: false,
        activeRomance: false,
      );

      expect(
        result,
        "Ex-boyfriend, formerly Son-in-law",
      );
    });

    test(
        'given a friend and previous familial relationship type we get the correct result',
        () {
      final result = getPlatonicAndRomanticRelationshipLabel(
        genderString: Gender.Male.name,
        platonicRelationshipTypeString:
            getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.friend,
        ),
        romanticRelationshipTypeString: RomanticRelationshipType.none.name,
        previousFamilialRelationshipString:
            getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.childInLaw,
        ),
        isCoParent: false,
        activeRomance: false,
      );

      expect(
        result,
        "Friend, formerly Son-in-law",
      );
    });

    test(
        'given a familial and previous familial relationship type we get the correct result',
        () {
      final result = getPlatonicAndRomanticRelationshipLabel(
        genderString: Gender.Male.name,
        platonicRelationshipTypeString:
            getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.stepCousin,
        ),
        romanticRelationshipTypeString: RomanticRelationshipType.none.name,
        previousFamilialRelationshipString:
            getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.childInLaw,
        ),
        isCoParent: false,
        activeRomance: false,
      );

      expect(
        result,
        "Step-cousin",
      );
    });

    test('given a familial and romantic type we get the correct result', () {
      final result = getPlatonicAndRomanticRelationshipLabel(
        genderString: Gender.Male.name,
        platonicRelationshipTypeString:
            getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.siblingInLaw,
        ),
        romanticRelationshipTypeString: RomanticRelationshipType.dating.name,
        previousFamilialRelationshipString: "",
        isCoParent: false,
        activeRomance: true,
      );

      expect(
        result,
        "Brother-in-law / Boyfriend",
      );
    });

    test('given a friend and romantic type we get the correct result', () {
      final result = getPlatonicAndRomanticRelationshipLabel(
        genderString: Gender.Male.name,
        platonicRelationshipTypeString:
            getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.friend,
        ),
        romanticRelationshipTypeString: RomanticRelationshipType.married.name,
        previousFamilialRelationshipString: "",
        isCoParent: false,
        activeRomance: true,
      );

      expect(
        result,
        "Husband",
      );
    });

    test('given a friend type we get the correct result', () {
      final result = getPlatonicAndRomanticRelationshipLabel(
        genderString: Gender.Male.name,
        platonicRelationshipTypeString:
            getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.friend,
        ),
        romanticRelationshipTypeString: RomanticRelationshipType.none.name,
        previousFamilialRelationshipString: "",
        isCoParent: false,
        activeRomance: false,
      );

      expect(
        result,
        "Friend",
      );
    });

    test('given a familial type we get the correct result', () {
      final result = getPlatonicAndRomanticRelationshipLabel(
        genderString: Gender.Male.name,
        platonicRelationshipTypeString:
            getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.grandChild,
        ),
        romanticRelationshipTypeString: RomanticRelationshipType.none.name,
        previousFamilialRelationshipString: "",
        isCoParent: false,
        activeRomance: false,
      );

      expect(
        result,
        "Grandson",
      );
    });
  });
}
