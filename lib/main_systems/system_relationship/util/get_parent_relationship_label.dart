import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_relationship/constants/parent_constants.dart';
import 'package:toplife/main_systems/system_relationship/constants/parent_relationship_type.dart';

String getParentRelationshipLabel(String relationshipType, String gender) {
  //plain parent
  if (relationshipType == ParentRelationshipType.main.name) {
    return (gender == Gender.Male.name)
        ? ParentConstants.maleEquivalent.toLowerCase()
        : ParentConstants.femaleEquivalent.toLowerCase();
  }
  //step parent
  else if (relationshipType == ParentRelationshipType.step.name) {
    return (gender == Gender.Male.name)
        ? "$relationshipType-${ParentConstants.maleEquivalent.toLowerCase()}"
        : "$relationshipType-${ParentConstants.femaleEquivalent.toLowerCase()}";
  }
  //grand parent
  else {
    return (gender == Gender.Male.name)
        ? "${TextConstants.grand.toLowerCase()}${ParentConstants.maleEquivalent.toLowerCase()}"
        : "${TextConstants.grand.toLowerCase()}${ParentConstants.femaleEquivalent.toLowerCase()}";
  }
}
