import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/gender_equivalent/get_platonic_relationship_type_gender_equivalent.dart';

void main() {
  group("getPlatonicRelationshipTypeGenderEquivalent: ", () {
    test("given female gender string, we get the female equivalent", () {
      const PlatonicRelationshipType chosenType =
          PlatonicRelationshipType.stepChild;
      expect(
        getPlatonicRelationshipTypeGenderEquivalent(
          chosenType,
          Gender.Female.name,
        ),
        chosenType.femaleEquivalent,
      );
    });

    test("given male gender string, we get the male equivalent", () {
      const PlatonicRelationshipType chosenType =
          PlatonicRelationshipType.stepChild;
      expect(
        getPlatonicRelationshipTypeGenderEquivalent(
          chosenType,
          Gender.Male.name,
        ),
        chosenType.maleEquivalent,
      );
    });

    test("given an invalid gender string, we get the male equivalent", () {
      const PlatonicRelationshipType chosenType =
          PlatonicRelationshipType.stepChild;
      expect(
        getPlatonicRelationshipTypeGenderEquivalent(
          chosenType,
          "WRONG",
        ),
        chosenType.maleEquivalent,
      );
    });
  });
}
