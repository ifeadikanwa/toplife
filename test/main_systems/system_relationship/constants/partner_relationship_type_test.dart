import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_relationship/constants/partner_relationship_type.dart';

void main() {
  group("Partner Relationship Types Constants:", () {
    test("male casual partner is called fling", () {
      expect(PartnerRelationshipType.casual.maleEquivalent, "Fling");
    });

    test("female casual partner is called fling", () {
      expect(PartnerRelationshipType.casual.femaleEquivalent, "Fling");
    });

    test("male coparent partner is called baby daddy", () {
      expect(PartnerRelationshipType.coparent.maleEquivalent, "Baby Daddy");
    });

    test("female coparent partner is called baby mama", () {
      expect(PartnerRelationshipType.coparent.femaleEquivalent, "Baby Mama");
    });

    test("male dating partner is called boyfriend", () {
      expect(PartnerRelationshipType.dating.maleEquivalent, "Boyfriend");
    });

    test("female dating partner is called girlfriend", () {
      expect(PartnerRelationshipType.dating.femaleEquivalent, "Girlfriend");
    });

    test("male engaged partner is called fiancé", () {
      expect(PartnerRelationshipType.engaged.maleEquivalent, "Fiancé");
    });

    test("female engaged partner is called fiancée", () {
      expect(PartnerRelationshipType.engaged.femaleEquivalent, "Fiancée");
    });

    test("male marriage partner is called husband", () {
      expect(PartnerRelationshipType.married.maleEquivalent, "Husband");
    });

    test("female marriage partner is called wife", () {
      expect(PartnerRelationshipType.married.femaleEquivalent, "Wife");
    });
  });
}
