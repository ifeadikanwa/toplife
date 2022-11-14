import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_relationship/constants/parent_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/parent.dart';

String getParentRelationshipLabel(String relationshipType, String gender) {
  //plain parent
  if (relationshipType == ParentRelationshipType.main.name) {
    return (gender == Gender.Male.name)
        ? Parent.maleEquivalent.toLowerCase()
        : Parent.femaleEquivalent.toLowerCase();
  }
  //step parent
  else if (relationshipType == ParentRelationshipType.step.name) {
    return (gender == Gender.Male.name)
        ? "$relationshipType-${Parent.maleEquivalent.toLowerCase()}"
        : "$relationshipType-${Parent.femaleEquivalent.toLowerCase()}";
  }
  //grand parent
  else {
    return (gender == Gender.Male.name)
        ? "${TextConstants.grand.toLowerCase()}${Parent.maleEquivalent.toLowerCase()}"
        : "${TextConstants.grand.toLowerCase()}${Parent.femaleEquivalent.toLowerCase()}";
  }
}
