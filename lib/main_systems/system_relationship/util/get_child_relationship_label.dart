import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_relationship/constants/child_constants.dart';
import 'package:toplife/main_systems/system_relationship/constants/child_relationship_type.dart';

String getChildRelationshipLabel(String relationshipType, String gender) {
  if (relationshipType == ChildRelationshipType.step.name) {
    return (gender == Gender.Male.name)
        ? "$relationshipType-${ChildConstants.maleEquivalent.toLowerCase()}"
        : "$relationshipType-${ChildConstants.femaleEquivalent.toLowerCase()}";
  } else {
    return (gender == Gender.Male.name)
        ? ChildConstants.maleEquivalent.toLowerCase()
        : ChildConstants.femaleEquivalent.toLowerCase();
  }
}
