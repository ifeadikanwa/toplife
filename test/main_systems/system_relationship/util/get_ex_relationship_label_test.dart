import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_relationship/constants/partner_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/get_ex_relationship_label.dart';

void main() {
  group("getExRelationshipLabel:", () {
    test(
        "casual partner relationship type enum returns fling for male and female gender",
        () {
      final String maleResult = getExRelationshipLabel(
          Gender.Male.name, PartnerRelationshipType.casual);

      expect(maleResult, "fling", reason: "Cause: male gender");

      final String femaleResult = getExRelationshipLabel(
          Gender.Female.name, PartnerRelationshipType.casual);

      expect(femaleResult, "fling", reason: "Cause: female gender");
    });

    test(
        "coparent partner relationship type enum returns fling for male and female gender",
        () {
      final String maleResult = getExRelationshipLabel(
          Gender.Male.name, PartnerRelationshipType.coparent);

      expect(maleResult, "fling", reason: "Cause: male gender");

      final String femaleResult = getExRelationshipLabel(
          Gender.Female.name, PartnerRelationshipType.coparent);

      expect(femaleResult, "fling", reason: "Cause: female gender");
    });

    test(
        "dating partner relationship type enum returns ex-boyfriend and ex-girlfriend for male and female gender respectively",
        () {
      final String maleResult = getExRelationshipLabel(
          Gender.Male.name, PartnerRelationshipType.dating);

      expect(maleResult, "ex-boyfriend", reason: "Cause: male gender");

      final String femaleResult = getExRelationshipLabel(
          Gender.Female.name, PartnerRelationshipType.dating);

      expect(femaleResult, "ex-girlfriend", reason: "Cause: female gender");
    });

    test(
        "engaged partner relationship type enum returns ex-fiancé and ex-fiancée for male and female gender respectively",
        () {
      final String maleResult = getExRelationshipLabel(
          Gender.Male.name, PartnerRelationshipType.engaged);

      expect(maleResult, "ex-fiancé", reason: "Cause: male gender");

      final String femaleResult = getExRelationshipLabel(
          Gender.Female.name, PartnerRelationshipType.engaged);

      expect(femaleResult, "ex-fiancée", reason: "Cause: female gender");
    });

    test(
        "married partner relationship type enum returns ex-husband and ex-wife for male and female gender respectively",
        () {
      final String maleResult = getExRelationshipLabel(
          Gender.Male.name, PartnerRelationshipType.married);

      expect(maleResult, "ex-husband", reason: "Cause: male gender");

      final String femaleResult = getExRelationshipLabel(
          Gender.Female.name, PartnerRelationshipType.married);

      expect(femaleResult, "ex-wife", reason: "Cause: female gender");
    });
  });
}
