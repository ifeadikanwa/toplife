import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_relationship/constants/sibling_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/sibling.dart';

String getSiblingRelationshipLabel(String relationshipType, String gender) {
  //full
  if (relationshipType == SiblingRelationshipType.full.name) {
    return (gender == Gender.Male.name)
        ? Sibling.maleEquivalent.toLowerCase()
        : Sibling.femaleEquivalent.toLowerCase();
  }
  //step
  else if (relationshipType == SiblingRelationshipType.step.name) {
    return (gender == Gender.Male.name)
        ? "$relationshipType-${Sibling.maleEquivalent.toLowerCase()}"
        : "$relationshipType-${Sibling.femaleEquivalent.toLowerCase()}";
  }
  //half
  else {
    return (gender == Gender.Male.name)
        ? "${SiblingRelationshipType.half.name}-${Sibling.maleEquivalent.toLowerCase()}"
        : "${SiblingRelationshipType.half.name}-${Sibling.femaleEquivalent.toLowerCase()}";
  }
}
