import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_relationship/constants/partner_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/get_partner_relationship_type_enum.dart';

void main() {
  test(
      "All partner relationship enums in string format return the correct corresponding enum",
      () {
    for (var relationshipType in PartnerRelationshipType.values) {
      String relationshipTypeString = relationshipType.name;
      
      //coparent should return casual enum
      if (relationshipType == PartnerRelationshipType.coparent) {
        expect(
          getPartnerRelationshipTypeEnum(relationshipTypeString),
          PartnerRelationshipType.casual,
          reason: "Error Cause: $relationshipTypeString",
        );
      }
      //everything else should return corresponding enum
      else {
        expect(
          getPartnerRelationshipTypeEnum(relationshipTypeString),
          relationshipType,
          reason: "Error Cause: $relationshipTypeString",
        );
      }
    }
  });

  test("invalid relationshiptype should return casual enum", () {
    expect(
      getPartnerRelationshipTypeEnum("wrong"),
      PartnerRelationshipType.casual,
    );
  });
}
