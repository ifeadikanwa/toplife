import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_relationship/constants/partner_relationship_type.dart';

String getExRelationshipLabel(
  String gender,
  PartnerRelationshipType relationshipTypeEnum,
) {
  if (relationshipTypeEnum == PartnerRelationshipType.casual ||
      relationshipTypeEnum == PartnerRelationshipType.coparent) {
    return (gender == Gender.Male.name)
        ? PartnerRelationshipType.casual.maleEquivalent.toLowerCase()
        : PartnerRelationshipType.casual.femaleEquivalent.toLowerCase();
  } else {
    //add "ex" to the front of relationship type enum.
    return (gender == Gender.Male.name)
        ? "ex-${relationshipTypeEnum.maleEquivalent.toLowerCase()}"
        : "ex-${relationshipTypeEnum.femaleEquivalent.toLowerCase()}";
  }
}
