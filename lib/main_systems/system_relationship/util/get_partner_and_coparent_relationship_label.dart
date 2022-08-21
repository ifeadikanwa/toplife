import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_relationship/constants/partner_relationship_type.dart';

String getPartnerAndCoparentRelationshipLabel(String gender,
    PartnerRelationshipType relationshipTypeEnum, bool isActivePartner) {
  //active partners have their plain title
  if (isActivePartner) {
    return (gender == Gender.Male.name)
        ? relationshipTypeEnum.maleEquivalent.toLowerCase()
        : relationshipTypeEnum.femaleEquivalent.toLowerCase();
  }
  //if it isnt active, it is a coparent so say baby daddy/mama -> for fling, dating and ex -> for engaged, married
  else {
    if (relationshipTypeEnum == PartnerRelationshipType.casual ||
        relationshipTypeEnum == PartnerRelationshipType.dating) {
      return (gender == Gender.Male.name)
          ? PartnerRelationshipType.coparent.maleEquivalent.toLowerCase()
          : PartnerRelationshipType.coparent.femaleEquivalent.toLowerCase();
    } else {
      return (gender == Gender.Male.name)
          ? "ex-${relationshipTypeEnum.maleEquivalent.toLowerCase()}"
          : "ex-${relationshipTypeEnum.femaleEquivalent.toLowerCase()}";
    }
  }
}
