import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/gender.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/romantic_relationship_type.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/util/get_db_formatted_platonic_relationship_type_string.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/util/label/get_platonic_and_romantic_relationship_label_from_string.dart.dart';

void main() {
  group('get platonic and romantic relationship label from string:', () {
    test(
        'given an invalid platonic relationship type we get the correct result',
        () {
      final result = getPlatonicAndRomanticRelationshipLabelFromString(
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
      final result = getPlatonicAndRomanticRelationshipLabelFromString(
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
      final result = getPlatonicAndRomanticRelationshipLabelFromString(
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
        "ex-boyfriend",
      );
    });

    test(
        'given a familial, romantic and previous familial relationship type WITH a request for NOT lowercase and spaced relationship label we get the correct result',
        () {
      final result = getPlatonicAndRomanticRelationshipLabelFromString(
        genderString: Gender.Male.name,
        platonicRelationshipTypeString:
            getDbFormattedPlatonicRelationshipTypeString(
                  PlatonicRelationshipType.cousin,
                ) +
                getDbFormattedPlatonicRelationshipTypeString(
                  PlatonicRelationshipType.halfSibling,
                ),
        romanticRelationshipTypeString: RomanticRelationshipType.dating.name,
        previousFamilialRelationshipString:
            getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.nibling,
        ),
        isCoParent: false,
        activeRomance: false,
        toLowerCase: false,
        spacedRelationshipLabelSeparator: true,
      );

      expect(
        result,
        "Cousin / Half-brother / Ex-boyfriend, formerly Nephew",
      );
    });
  });
}
