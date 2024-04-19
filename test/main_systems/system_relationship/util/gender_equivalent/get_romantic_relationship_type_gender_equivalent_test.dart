import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_relationship/constants/romantic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/gender_equivalent/get_romantic_relationship_type_gender_equivalent.dart';

void main() {
  group('get romantic relationship type gender equivalent:', () {
    test("given female gender string, we get the female equivalent", () {
      const RomanticRelationshipType chosenType =
          RomanticRelationshipType.married;
      expect(
        getRomanticRelationshipTypeGenderEquivalent(
          chosenType,
          Gender.Female.name,
        ),
        chosenType.femaleEquivalent,
      );
    });

    test("given male gender string, we get the male equivalent", () {
      const RomanticRelationshipType chosenType =
          RomanticRelationshipType.married;
      expect(
        getRomanticRelationshipTypeGenderEquivalent(
          chosenType,
          Gender.Male.name,
        ),
        chosenType.maleEquivalent,
      );
    });

    test("given an invalid gender string, we get the male equivalent", () {
      const RomanticRelationshipType chosenType =
          RomanticRelationshipType.married;
      expect(
        getRomanticRelationshipTypeGenderEquivalent(
          chosenType,
          "WRONG",
        ),
        chosenType.maleEquivalent,
      );
    });
  });
}
