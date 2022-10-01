import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_relationship/constants/relative_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/get_relative_relationship_label.dart';

void main() {
  group("getRelativeRelationshipLabel:", () {
    test(
        "grandchild relationship type returns grandson and granddaughter for male and female gender",
        () {
      final String maleResult = getRelativeRelationshipLabel(
          RelativeRelationshipType.grandchild.name, Gender.Male.name);

      expect(maleResult, "grandson", reason: "Cause: male gender");

      final String femaleResult = getRelativeRelationshipLabel(
          RelativeRelationshipType.grandchild.name, Gender.Female.name);

      expect(femaleResult, "granddaughter", reason: "Cause: female gender");
    });

    test(
        "nibling relationship type returns nephew and niece for male and female gender",
        () {
      final String maleResult = getRelativeRelationshipLabel(
          RelativeRelationshipType.nibling.name, Gender.Male.name);

      expect(maleResult, "nephew", reason: "Cause: male gender");

      final String femaleResult = getRelativeRelationshipLabel(
          RelativeRelationshipType.nibling.name, Gender.Female.name);

      expect(femaleResult, "niece", reason: "Cause: female gender");
    });

    test(
        "pibling relationship type returns uncle and aunt for male and female gender",
        () {
      final String maleResult = getRelativeRelationshipLabel(
          RelativeRelationshipType.pibling.name, Gender.Male.name);

      expect(maleResult, "uncle", reason: "Cause: male gender");

      final String femaleResult = getRelativeRelationshipLabel(
          RelativeRelationshipType.pibling.name, Gender.Female.name);

      expect(femaleResult, "aunt", reason: "Cause: female gender");
    });

    test("cousin relationship type returns cousin for male and female gender",
        () {
      final String maleResult = getRelativeRelationshipLabel(
          RelativeRelationshipType.cousin.name, Gender.Male.name);

      expect(maleResult, "cousin", reason: "Cause: male gender");

      final String femaleResult = getRelativeRelationshipLabel(
          RelativeRelationshipType.cousin.name, Gender.Female.name);

      expect(femaleResult, "cousin", reason: "Cause: female gender");
    });

    test("invalid relationship type returns cousin for male and female gender",
        () {
      final String maleResult =
          getRelativeRelationshipLabel("wrong", Gender.Male.name);

      expect(maleResult, "cousin", reason: "Cause: male gender");

      final String femaleResult =
          getRelativeRelationshipLabel("wrong", Gender.Female.name);

      expect(femaleResult, "cousin", reason: "Cause: female gender");
    });

    test(
        "valid relationship type with invalid gender returns female label for type",
        () {
      final String grandchildResult = getRelativeRelationshipLabel(
          RelativeRelationshipType.grandchild.name, "wrong");

      expect(grandchildResult, "granddaughter", reason: "Cause: grandchild");

      final String niblingResult = getRelativeRelationshipLabel(
          RelativeRelationshipType.nibling.name, "wrong");

      expect(niblingResult, "niece", reason: "Cause: nibling");

      final String piblingResult = getRelativeRelationshipLabel(
          RelativeRelationshipType.pibling.name, "wrong");

      expect(piblingResult, "aunt", reason: "Cause: pibling");

      final String cousinResult = getRelativeRelationshipLabel(
          RelativeRelationshipType.cousin.name, "wrong");

      expect(cousinResult, "cousin", reason: "Cause: cousin");
    });

    test("invalid relationship type with invalid gender returns cousin", () {
      final String result = getRelativeRelationshipLabel("wrong", "wrong");

      expect(result, "cousin");
    });
  });
}
