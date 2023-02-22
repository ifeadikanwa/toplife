import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_relationship/constants/inlaw_constants.dart';
import 'package:toplife/main_systems/system_relationship/constants/inlaw_relationship_type.dart';

String getInLawRelationshipLabel(String relationshipType, String gender) {
  if (relationshipType == InLawRelationshipType.parent.name) {
    return (gender == Gender.Male.name)
        ? InLawConstants.parentMaleEquivalent.toLowerCase()
        : InLawConstants.parentFemaleEquivalent.toLowerCase();
  } else if (relationshipType == InLawRelationshipType.child.name) {
    return (gender == Gender.Male.name)
        ? InLawConstants.childMaleEquivalent.toLowerCase()
        : InLawConstants.childFemaleEquivalent.toLowerCase();
  } else {
    return (gender == Gender.Male.name)
        ? InLawConstants.siblingMaleEquivalent.toLowerCase()
        : InLawConstants.siblingFemaleEquivalent.toLowerCase();
  }
}
