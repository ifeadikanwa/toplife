import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_relationship/constants/sibling_constants.dart';
import 'package:toplife/main_systems/system_relationship/constants/sibling_relationship_type.dart';

String getSiblingRelationshipLabel(String relationshipType, String gender) {
  //full
  if (relationshipType == SiblingRelationshipType.full.name) {
    return (gender == Gender.Male.name)
        ? SiblingConstants.maleEquivalent.toLowerCase()
        : SiblingConstants.femaleEquivalent.toLowerCase();
  }
  //step
  else if (relationshipType == SiblingRelationshipType.step.name) {
    return (gender == Gender.Male.name)
        ? "$relationshipType-${SiblingConstants.maleEquivalent.toLowerCase()}"
        : "$relationshipType-${SiblingConstants.femaleEquivalent.toLowerCase()}";
  }
  //half
  else {
    return (gender == Gender.Male.name)
        ? "${SiblingRelationshipType.half.name}-${SiblingConstants.maleEquivalent.toLowerCase()}"
        : "${SiblingRelationshipType.half.name}-${SiblingConstants.femaleEquivalent.toLowerCase()}";
  }
}
