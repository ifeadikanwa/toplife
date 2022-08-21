import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_relationship/constants/parent_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/get_parent_relationship_label.dart';

void main() {
  group("getParentRelationshipLabel:", () {
    test(
        "main relationship type returns father and mother for male and female gender",
        () {
      final String maleResult = getParentRelationshipLabel(
          ParentRelationshipType.main.name, Gender.Male.name);

      expect(maleResult, "father", reason: "Cause: male gender");

      final String femaleResult = getParentRelationshipLabel(
          ParentRelationshipType.main.name, Gender.Female.name);

      expect(femaleResult, "mother", reason: "Cause: female gender");
    });

    test(
        "step relationship type returns step-father and step-mother for male and female gender",
        () {
      final String maleResult = getParentRelationshipLabel(
          ParentRelationshipType.step.name, Gender.Male.name);

      expect(maleResult, "step-father", reason: "Cause: male gender");

      final String femaleResult = getParentRelationshipLabel(
          ParentRelationshipType.step.name, Gender.Female.name);

      expect(femaleResult, "step-mother", reason: "Cause: female gender");
    });

test(
        "grand relationship type returns grandfather and grandmother for male and female gender",
        () {
      final String maleResult = getParentRelationshipLabel(
          ParentRelationshipType.grand.name, Gender.Male.name);

      expect(maleResult, "grandfather", reason: "Cause: male gender");

      final String femaleResult = getParentRelationshipLabel(
          ParentRelationshipType.grand.name, Gender.Female.name);

      expect(femaleResult, "grandmother", reason: "Cause: female gender");
    });
   test(
        "invalid relationship type returns grandfather and grandmother for male and female gender",
        () {
      final String maleResult = getParentRelationshipLabel(
          "wrong", Gender.Male.name);

      expect(maleResult, "grandfather", reason: "Cause: male gender");

      final String femaleResult = getParentRelationshipLabel(
          "wrong", Gender.Female.name);

      expect(femaleResult, "grandmother", reason: "Cause: female gender");
    });

    test(
        "valid relationship type with invalid gender returns female label for type",
        () {
      final String mainResult =
         getParentRelationshipLabel(
          ParentRelationshipType.main.name, "wrong");

      expect(mainResult, "mother", reason: "Cause: main parent");

      final String stepResult =
         getParentRelationshipLabel(
          ParentRelationshipType.step.name, "wrong");

      expect(stepResult, "step-mother", reason: "Cause: step parent");

      final String grandResult = getParentRelationshipLabel(
          ParentRelationshipType.grand.name, "wrong");

      expect(grandResult, "grandmother", reason: "Cause: grand parent");
    });

    test("invalid relationship type with invalid gender returns grandmother",
        () {
      final String result = getParentRelationshipLabel("wrong", "wrong");

      expect(result, "grandmother");
    });
  });
}
