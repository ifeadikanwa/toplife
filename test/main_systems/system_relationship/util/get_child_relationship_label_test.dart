import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_relationship/constants/child_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/get_child_relationship_label.dart';

void main() {
  group("getChildRelationshipLabel:", () {
    test("if relationship type is step and gender is male we get step-son", () {
      final String result = getChildRelationshipLabel(
          ChildRelationshipType.step.name, Gender.Male.name);

      expect(result, "step-son");
    });

    test(
        "if relationship type is step and gender is female we get step-daughter",
        () {
      final String result = getChildRelationshipLabel(
          ChildRelationshipType.step.name, Gender.Female.name);

      expect(result, "step-daughter");
    });

    test("if relationship type is adopted and gender is male we get son", () {
      final String result = getChildRelationshipLabel(
          ChildRelationshipType.adopted.name, Gender.Male.name);

      expect(result, "son");
    });

    test("if relationship type is adopted and gender is female we get daughter",
        () {
      final String result = getChildRelationshipLabel(
          ChildRelationshipType.adopted.name, Gender.Female.name);

      expect(result, "daughter");
    });

    test("if relationship type is birth and gender is male we get son", () {
      final String result = getChildRelationshipLabel(
          ChildRelationshipType.birth.name, Gender.Male.name);

      expect(result, "son");
    });

    test("if relationship type is birth and gender is female we get daughter",
        () {
      final String result = getChildRelationshipLabel(
          ChildRelationshipType.birth.name, Gender.Female.name);

      expect(result, "daughter");
    });

    test(
        "if relationship type is invalid and gender is male or female we get son or daughter respectively",
        () {
      final String maleResult =
          getChildRelationshipLabel("wrong", Gender.Male.name);

      expect(maleResult, "son", reason: "Cause: male gender");

      final String femaleResult =
          getChildRelationshipLabel("wrong", Gender.Female.name);

      expect(femaleResult, "daughter", reason: "Cause: female gender");
    });

    test(
        "if relationship type is valid and gender is invalid we get female label",
        () {
      final String birthResult =
          getChildRelationshipLabel(ChildRelationshipType.birth.name, "wrong");

      expect(birthResult, "daughter", reason: "Cause: birth relationship type");

      final String stepResult =
          getChildRelationshipLabel(ChildRelationshipType.step.name, "wrong");

      expect(stepResult, "step-daughter", reason: "Cause: step relationship type");

      final String adoptedResult = getChildRelationshipLabel(
          ChildRelationshipType.adopted.name, "wrong");

      expect(adoptedResult, "daughter",
          reason: "Cause: adopted relationship type");
    });

    test("if both relationship type and gender are invalid we get daughter",
        () {
      final String result = getChildRelationshipLabel("wrong", "wrong");

      expect(result, "daughter");
    });
  });
}
