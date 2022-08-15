import 'package:toplife/main_systems/system_relationship/constants/partner_relationship_type.dart';

PartnerRelationshipType getPartnerRelationshipTypeEnum(
    String relationshipType) {
  if (relationshipType == PartnerRelationshipType.dating.name) {
    return PartnerRelationshipType.dating;
  } else if (relationshipType == PartnerRelationshipType.marriage.name) {
    return PartnerRelationshipType.marriage;
  } else if (relationshipType == PartnerRelationshipType.engaged.name) {
    return PartnerRelationshipType.engaged;
  } else {
    return PartnerRelationshipType.casual;
  }
}
