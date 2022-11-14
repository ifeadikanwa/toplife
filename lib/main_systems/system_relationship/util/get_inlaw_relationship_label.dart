import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_relationship/constants/inlaw_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/inlaw.dart';

String getInLawRelationshipLabel(String relationshipType, String gender) {
  if (relationshipType == InLawRelationshipType.parent.name) {
    return (gender == Gender.Male.name)
        ? InLaw.parentMaleEquivalent.toLowerCase()
        : InLaw.parentFemaleEquivalent.toLowerCase();
  } else if (relationshipType == InLawRelationshipType.child.name) {
    return (gender == Gender.Male.name)
        ? InLaw.childMaleEquivalent.toLowerCase()
        : InLaw.childFemaleEquivalent.toLowerCase();
  } else {
    return (gender == Gender.Male.name)
        ? InLaw.siblingMaleEquivalent.toLowerCase()
        : InLaw.siblingFemaleEquivalent.toLowerCase();
  }
}
