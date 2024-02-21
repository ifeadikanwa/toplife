import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_relationship/constants/romantic_relationship_type.dart';

void main() {
  group("Romantic relationship type:", () {
    test("none has the correct male and female equivalents", () {
      expect(
        RomanticRelationshipType.none.maleEquivalent,
        "",
        reason: "Cause: male equivalent",
      );

      expect(
        RomanticRelationshipType.none.femaleEquivalent,
        "",
        reason: "Cause: female equivalent",
      );
    });

    test("coparent has the correct male and female equivalents", () {
      expect(
        RomanticRelationshipType.coparent.maleEquivalent,
        "Baby daddy",
        reason: "Cause: male equivalent",
      );

      expect(
        RomanticRelationshipType.coparent.femaleEquivalent,
        "Baby mama",
        reason: "Cause: female equivalent",
      );
    });

    test("casual has the correct male and female equivalents", () {
      expect(
        RomanticRelationshipType.casual.maleEquivalent,
        "Fling",
        reason: "Cause: male equivalent",
      );

      expect(
        RomanticRelationshipType.casual.femaleEquivalent,
        "Fling",
        reason: "Cause: female equivalent",
      );
    });

    test("dating has the correct male and female equivalents", () {
      expect(
        RomanticRelationshipType.dating.maleEquivalent,
        "Boyfriend",
        reason: "Cause: male equivalent",
      );

      expect(
        RomanticRelationshipType.dating.femaleEquivalent,
        "Girlfriend",
        reason: "Cause: female equivalent",
      );
    });
    test("engaged has the correct male and female equivalents", () {
      expect(
        RomanticRelationshipType.engaged.maleEquivalent,
        "Fiancé",
        reason: "Cause: male equivalent",
      );

      expect(
        RomanticRelationshipType.engaged.femaleEquivalent,
        "Fiancée",
        reason: "Cause: female equivalent",
      );
    });
    test("married has the correct male and female equivalents", () {
      expect(
        RomanticRelationshipType.married.maleEquivalent,
        "Husband",
        reason: "Cause: male equivalent",
      );

      expect(
        RomanticRelationshipType.married.femaleEquivalent,
        "Wife",
        reason: "Cause: female equivalent",
      );
    });
  });
}
