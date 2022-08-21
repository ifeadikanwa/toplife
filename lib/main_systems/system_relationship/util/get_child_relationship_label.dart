import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_relationship/constants/child_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/child.dart';

String getChildRelationshipLabel(String relationshipType, String gender) {
  if (relationshipType == ChildRelationshipType.step.name) {
    return (gender == Gender.Male.name)
        ? "$relationshipType-${Child.maleEquivalent.toLowerCase()}"
        : "$relationshipType-${Child.femaleEquivalent.toLowerCase()}";
  } else {
    return (gender == Gender.Male.name)
        ? Child.maleEquivalent.toLowerCase()
        : Child.femaleEquivalent.toLowerCase();
  }
}
