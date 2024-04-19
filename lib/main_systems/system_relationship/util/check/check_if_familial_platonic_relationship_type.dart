import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/constants/relationship_category.dart';

bool checkIfFamilialPlatonicRelationshipType({
  required PlatonicRelationshipType platonicRelationshipType,
  bool excludeAllStepParentTypes = false,
  bool excludeDistantRelatives = false,
}) {
  //TRUE if the relationship category is: parent, child, sibling, or relative
  switch (platonicRelationshipType.relationshipCategory) {
    case RelationshipCategory.parent:
    case RelationshipCategory.child:
    case RelationshipCategory.sibling:
    case RelationshipCategory.relative:
      //check for exclusions:
      //-step parent types
      if (excludeAllStepParentTypes &&
          (platonicRelationshipType == PlatonicRelationshipType.stepParent ||
              platonicRelationshipType ==
                  PlatonicRelationshipType.stepGrandParent ||
              platonicRelationshipType ==
                  PlatonicRelationshipType.stepGreatGrandParent)) {
        return false;
      }
      //-distant relatives
      if (excludeDistantRelatives &&
          platonicRelationshipType ==
              PlatonicRelationshipType.distantRelative) {
        return false;
      }

      //if no exclusions:
      return true;

    default:
      return false;
  }
}
