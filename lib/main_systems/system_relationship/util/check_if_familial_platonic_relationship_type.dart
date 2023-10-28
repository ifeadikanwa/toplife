import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/constants/relationship_category.dart';

bool checkIfFamilialPlatonicRelationshipType(
  PlatonicRelationshipType platonicRelationshipType,
) {
  //TRUE if the relationship category is: parent, child, sibling, or relative
  switch (platonicRelationshipType.relationshipCategory) {
    case RelationshipCategory.parent:
    case RelationshipCategory.child:
    case RelationshipCategory.sibling:
    case RelationshipCategory.relative:
      return true;
    default:
      return false;
  }
}
