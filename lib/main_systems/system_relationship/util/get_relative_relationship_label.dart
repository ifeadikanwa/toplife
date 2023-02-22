import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_relationship/constants/relative_constants.dart';
import 'package:toplife/main_systems/system_relationship/constants/relative_relationship_type.dart';

String getRelativeRelationshipLabel(String relationshipType, String gender) {
  if (relationshipType == RelativeRelationshipType.grandchild.name) {
    return (gender == Gender.Male.name)
        ? RelativeConstants.grandChildMaleEquivalent.toLowerCase()
        : RelativeConstants.grandChildFemaleEquivalent.toLowerCase();
  } else if (relationshipType == RelativeRelationshipType.nibling.name) {
    return (gender == Gender.Male.name)
        ? RelativeConstants.niblingMaleEquivalent.toLowerCase()
        : RelativeConstants.niblingFemaleEquivalent.toLowerCase();
  } else if (relationshipType == RelativeRelationshipType.pibling.name) {
    return (gender == Gender.Male.name)
        ? RelativeConstants.piblingMaleEquivalent.toLowerCase()
        : RelativeConstants.piblingFemaleEquivalent.toLowerCase();
  } else {
    return (gender == Gender.Male.name)
        ? RelativeConstants.cousinMaleEquivalent.toLowerCase()
        : RelativeConstants.cousinFemaleEquivalent.toLowerCase();
  }
}
