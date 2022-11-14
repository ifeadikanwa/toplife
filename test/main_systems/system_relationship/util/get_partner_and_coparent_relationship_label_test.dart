import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_relationship/constants/partner_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/get_partner_and_coparent_relationship_label.dart';

void main() {
  group("getPartnerAndCoparentRelationshipLabel:", () {
    test(
        "active partner returns male and female equivalent of the given relationship enum type for all relationship types",
        () {
      for (var relationshipTypeEnum in PartnerRelationshipType.values) {
        final String maleResult = getPartnerAndCoparentRelationshipLabel(
            Gender.Male.name, relationshipTypeEnum, true);

        expect(
          maleResult,
          relationshipTypeEnum.maleEquivalent.toLowerCase(),
          reason: "Cause: male gender",
        );

        final String femaleResult = getPartnerAndCoparentRelationshipLabel(
            Gender.Female.name, relationshipTypeEnum, true);

        expect(
          femaleResult,
          relationshipTypeEnum.femaleEquivalent.toLowerCase(),
          reason: "Cause: female gender",
        );
      }
    });

    test(
        "inactive casual relationship type returns baby daddy and baby mama for male and female gender respectively",
        () {
          final String maleResult = getPartnerAndCoparentRelationshipLabel(
            Gender.Male.name, PartnerRelationshipType.casual, false);

        expect(
          maleResult,
          "baby daddy",
          reason: "Cause: male gender",
        );

        final String femaleResult = getPartnerAndCoparentRelationshipLabel(
            Gender.Female.name, PartnerRelationshipType.casual, false);

        expect(
          femaleResult,
          "baby mama",
          reason: "Cause: female gender",
        );
        });

        test(
        "inactive dating relationship type returns baby daddy and baby mama for male and female gender respectively",
        () {
          final String maleResult = getPartnerAndCoparentRelationshipLabel(
            Gender.Male.name, PartnerRelationshipType.dating, false);

        expect(
          maleResult,
          "baby daddy",
          reason: "Cause: male gender",
        );

        final String femaleResult = getPartnerAndCoparentRelationshipLabel(
            Gender.Female.name, PartnerRelationshipType.dating, false);

        expect(
          femaleResult,
          "baby mama",
          reason: "Cause: female gender",
        );
        });

        test(
        "inactive engaged relationship type returns ex-fiancé and ex-fiancée for male and female gender respectively",
        () {
          final String maleResult = getPartnerAndCoparentRelationshipLabel(
            Gender.Male.name, PartnerRelationshipType.engaged, false);

        expect(
          maleResult,
          "ex-fiancé",
          reason: "Cause: male gender",
        );

        final String femaleResult = getPartnerAndCoparentRelationshipLabel(
            Gender.Female.name, PartnerRelationshipType.engaged, false);

        expect(
          femaleResult,
          "ex-fiancée",
          reason: "Cause: female gender",
        );
        });

         test(
        "inactive married relationship type returns ex-husband and ex-wife for male and female gender respectively",
        () {
          final String maleResult = getPartnerAndCoparentRelationshipLabel(
            Gender.Male.name, PartnerRelationshipType.married, false);

        expect(
          maleResult,
          "ex-husband",
          reason: "Cause: male gender",
        );

        final String femaleResult = getPartnerAndCoparentRelationshipLabel(
            Gender.Female.name, PartnerRelationshipType.married, false);

        expect(
          femaleResult,
          "ex-wife",
          reason: "Cause: female gender",
        );
        });
  });
}
