import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_relationship/constants/relative_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/relative.dart';

String getRelativeRelationshipLabel(String relationshipType, String gender) {
  if (relationshipType == RelativeRelationshipType.grandchild.name) {
    return (gender == Gender.Male.name)
        ? Relative.grandChildMaleEquivalent.toLowerCase()
        : Relative.grandChildFemaleEquivalent.toLowerCase();
  } else if (relationshipType == RelativeRelationshipType.nibling.name) {
    return (gender == Gender.Male.name)
        ? Relative.niblingMaleEquivalent.toLowerCase()
        : Relative.niblingFemaleEquivalent.toLowerCase();
  } else if (relationshipType == RelativeRelationshipType.pibling.name) {
    return (gender == Gender.Male.name)
        ? Relative.piblingMaleEquivalent.toLowerCase()
        : Relative.piblingFemaleEquivalent.toLowerCase();
  } else {
    return (gender == Gender.Male.name)
        ? Relative.cousinMaleEquivalent.toLowerCase()
        : Relative.cousinFemaleEquivalent.toLowerCase();
  }
}
