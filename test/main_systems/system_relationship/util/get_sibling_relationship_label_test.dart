import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_relationship/constants/sibling_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/get_sibling_relationship_label.dart';

void main() {
  group("getSiblingRelationshipLabel:", () {
    test(
        "full relationship type returns brother and sister for male and female gender",
        () {
      final String maleResult = getSiblingRelationshipLabel(
          SiblingRelationshipType.full.name, Gender.Male.name);

      expect(maleResult, "brother", reason: "Cause: male gender");

      final String femaleResult = getSiblingRelationshipLabel(
          SiblingRelationshipType.full.name, Gender.Female.name);


      expect(femaleResult, "sister", reason: "Cause: female gender");
    });

    test(
        "step relationship type returns step-brother and step-sister for male and female gender",
        () {
      final String maleResult = getSiblingRelationshipLabel(
          SiblingRelationshipType.step.name, Gender.Male.name);

      expect(maleResult, "step-brother", reason: "Cause: male gender");

      final String femaleResult = getSiblingRelationshipLabel(
          SiblingRelationshipType.step.name, Gender.Female.name);


      expect(femaleResult, "step-sister", reason: "Cause: female gender");
    });

   test(
        "half relationship type returns half-brother and half-sister for male and female gender",
        () {
      final String maleResult = getSiblingRelationshipLabel(
          SiblingRelationshipType.half.name, Gender.Male.name);

      expect(maleResult, "half-brother", reason: "Cause: male gender");

      final String femaleResult = getSiblingRelationshipLabel(
          SiblingRelationshipType.half.name, Gender.Female.name);


      expect(femaleResult, "half-sister", reason: "Cause: female gender");
    });
    test(
        "invalid relationship type returns half-brother and half-sister for male and female gender",
        () {
      final String maleResult =
          getSiblingRelationshipLabel("wrong", Gender.Male.name);

      expect(maleResult, "half-brother", reason: "Cause: male gender");

      final String femaleResult =
          getSiblingRelationshipLabel("wrong", Gender.Female.name);

      expect(femaleResult, "half-sister", reason: "Cause: female gender");
    });

    test(
        "valid relationship type with invalid gender returns female label for type",
        () {
      final String fullResult =
          getSiblingRelationshipLabel(SiblingRelationshipType.full.name, "wrong");

      expect(fullResult, "sister", reason: "Cause: full");

      final String stepResult =
          getSiblingRelationshipLabel(SiblingRelationshipType.step.name, "wrong");

      expect(stepResult, "step-sister", reason: "Cause: step");

      final String halfResult = getSiblingRelationshipLabel(SiblingRelationshipType.half.name, "wrong");

      expect(halfResult, "half-sister", reason: "Cause: half");
    });

    test("invalid relationship type with invalid gender returns half-sister",
        () {
      final String result = getSiblingRelationshipLabel("wrong", "wrong");

      expect(result, "half-sister");
    });
  });
}
