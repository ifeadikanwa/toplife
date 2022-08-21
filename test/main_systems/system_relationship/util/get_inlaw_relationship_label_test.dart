import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_relationship/constants/inlaw_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/get_inlaw_relationship_label.dart';

void main() {
  group("getInLawRelationshipLabel:", () {
    test(
        "parent in law relationship type returns father-in-law and mother-in-law for male and female gender",
        () {
      final String maleResult = getInLawRelationshipLabel(
          InLawRelationshipType.parent.name, Gender.Male.name);

      expect(maleResult, "father-in-law", reason: "Cause: male gender");

      final String femaleResult = getInLawRelationshipLabel(
          InLawRelationshipType.parent.name, Gender.Female.name);

      expect(femaleResult, "mother-in-law", reason: "Cause: female gender");
    });

    test(
        "child in law relationship type returns son-in-law and daughter-in-law for male and female gender",
        () {
      final String maleResult = getInLawRelationshipLabel(
          InLawRelationshipType.child.name, Gender.Male.name);

      expect(maleResult, "son-in-law", reason: "Cause: male gender");

      final String femaleResult = getInLawRelationshipLabel(
          InLawRelationshipType.child.name, Gender.Female.name);

      expect(femaleResult, "daughter-in-law", reason: "Cause: female gender");
    });

    test(
        "sibling in law relationship type returns brother-in-law and sister-in-law for male and female gender",
        () {
      final String maleResult = getInLawRelationshipLabel(
          InLawRelationshipType.sibling.name, Gender.Male.name);

      expect(maleResult, "brother-in-law", reason: "Cause: male gender");

      final String femaleResult = getInLawRelationshipLabel(
          InLawRelationshipType.sibling.name, Gender.Female.name);

      expect(femaleResult, "sister-in-law", reason: "Cause: female gender");
    });

    test(
        "invalid relationship type returns brother-in-law and sister-in-law for male and female gender",
        () {
      final String maleResult = getInLawRelationshipLabel(
          "wrong", Gender.Male.name);

      expect(maleResult, "brother-in-law", reason: "Cause: male gender");

      final String femaleResult = getInLawRelationshipLabel(
          "wrong", Gender.Female.name);

      expect(femaleResult, "sister-in-law", reason: "Cause: female gender");
    });

    test(
        "valid relationship type with invalid gender returns female label for type",
        () {
      final String parentResult = getInLawRelationshipLabel(
          InLawRelationshipType.parent.name, "wrong");

      expect(parentResult, "mother-in-law", reason: "Cause: parent-in-law");

      final String childResult = getInLawRelationshipLabel(
          InLawRelationshipType.child.name, "wrong");

      expect(childResult, "daughter-in-law", reason: "Cause: child-in-law");

      final String siblingResult = getInLawRelationshipLabel(
          InLawRelationshipType.sibling.name, "wrong");

      expect(siblingResult, "sister-in-law", reason: "Cause: sibling-in-law");
    });

    test(
        "invalid relationship type with invalid gender returns sister-in-law",
        () {
      final String result = getInLawRelationshipLabel(
          "wrong", "wrong");

      expect(result, "sister-in-law");

      
    });
  });
}
