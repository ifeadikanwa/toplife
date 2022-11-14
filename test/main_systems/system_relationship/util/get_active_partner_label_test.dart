import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_relationship/constants/partner_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/get_active_partner_label.dart';

void main() {
  group("getActivePartnerLabel:", () {
    test(
      "returns male equivalent of the given relationship enum type for all relationship types",
      () {
        for (var relationshipTypeEnum in PartnerRelationshipType.values) {
          final String maleResult = getActivePartnerLabel(
            Gender.Male.name,
            relationshipTypeEnum.name,
          );

          //coparent should return fling
          if (relationshipTypeEnum == PartnerRelationshipType.coparent) {
            expect(
              maleResult,
              PartnerRelationshipType.casual.maleEquivalent.toLowerCase(),
              reason: "Cause: male gender of ${relationshipTypeEnum.name}",
            );
          } else {
            expect(
              maleResult,
              relationshipTypeEnum.maleEquivalent.toLowerCase(),
              reason: "Cause: male gender of ${relationshipTypeEnum.name}",
            );
          }
        }
      },
    );

    test(
      "returns female equivalent of the given relationship enum type for all relationship types",
      () {
        for (var relationshipTypeEnum in PartnerRelationshipType.values) {
          final String femaleResult = getActivePartnerLabel(
            Gender.Female.name,
            relationshipTypeEnum.name,
          );

          //coparent should return fling
          if (relationshipTypeEnum == PartnerRelationshipType.coparent) {
            expect(
              femaleResult,
              PartnerRelationshipType.casual.femaleEquivalent.toLowerCase(),
              reason: "Cause: female gender of ${relationshipTypeEnum.name}",
            );
          } else {
            expect(
              femaleResult,
              relationshipTypeEnum.femaleEquivalent.toLowerCase(),
              reason: "Cause: female gender of ${relationshipTypeEnum.name}",
            );
          }
        }
      },
    );

    test(
      "returns the valid equivalent of casual(fling) if it is given an invalid relationship type",
      () {
        expect(
          getActivePartnerLabel(
            Gender.Female.name,
            "wrong",
          ),
          "fling",
          reason: "Cause: female gender",
        );

        expect(
          getActivePartnerLabel(
            Gender.Male.name,
            "wrong",
          ),
          "fling",
          reason: "Cause: male gender",
        );
      },
    );

    test(
      "returns fling if it is given an invalid relationship type and gender",
      () {
        expect(
          getActivePartnerLabel(
            "wrong",
            "wrong",
          ),
          "fling",
        );
      },
    );
  });
}
