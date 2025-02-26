import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/gender.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/util/get_db_formatted_platonic_relationship_type_string.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/util/label/get_platonic_relationship_label_from_string.dart';

void main() {
  group("Get platonic relationship label from string:", () {
    test(
        "given an invalid platonic relationship type string and invalid previous relationship, we get the correct string",
        () {
      const Gender chosenGender = Gender.Female;

      const String correctLabel = "";

      expect(
        getPlatonicRelationshipLabelFromString(
          platonicRelationshipTypeString: "WRONG",
          genderString: chosenGender.name,
          previousFamilialRelationshipString: "WRONG",
        ),
        correctLabel,
      );
    });

    test(
        "given an valid platonic relationship type string and invalid previous relationship, we get the correct string",
        () {
      const Gender chosenGender = Gender.Female;

      const String correctLabel = "birth daughter";

      expect(
        getPlatonicRelationshipLabelFromString(
          platonicRelationshipTypeString:
              getDbFormattedPlatonicRelationshipTypeString(
                  PlatonicRelationshipType.birthChild),
          genderString: chosenGender.name,
          previousFamilialRelationshipString: "WRONG",
        ),
        correctLabel,
      );
    });

    test(
        "given an valid platonic relationship type string and valid previous relationship, we get the correct string",
        () {
      const Gender chosenGender = Gender.Female;

      const String correctLabel = "adoptive daughter, formerly niece";

      expect(
        getPlatonicRelationshipLabelFromString(
          platonicRelationshipTypeString:
              getDbFormattedPlatonicRelationshipTypeString(
                  PlatonicRelationshipType.adoptiveChild),
          genderString: chosenGender.name,
          previousFamilialRelationshipString:
              getDbFormattedPlatonicRelationshipTypeString(
                  PlatonicRelationshipType.nibling),
        ),
        correctLabel,
      );
    });

    test(
        "given an valid platonic relationship type string WITH request for Not lowercase and spaced relationship separator, and valid previous relationship, we get the correct string",
        () {
      const Gender chosenGender = Gender.Female;

      const String correctLabel =
          "Step-cousin / Adoptive daughter, formerly Niece";

      expect(
        getPlatonicRelationshipLabelFromString(
          platonicRelationshipTypeString:
              getDbFormattedPlatonicRelationshipTypeString(
                      PlatonicRelationshipType.stepCousin) +
                  getDbFormattedPlatonicRelationshipTypeString(
                      PlatonicRelationshipType.adoptiveChild),
          genderString: chosenGender.name,
          previousFamilialRelationshipString:
              getDbFormattedPlatonicRelationshipTypeString(
                  PlatonicRelationshipType.nibling),
          toLowerCase: false,
          spacedRelationshipLabelSeparator: true,
        ),
        correctLabel,
      );
    });
  });
}
