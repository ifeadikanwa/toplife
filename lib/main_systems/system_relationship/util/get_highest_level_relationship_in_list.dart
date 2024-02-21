import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/constants/relationship_category.dart';

//in situations where a person has multiple relationships, sometimes we just want one of them
//the one we take should be the highest in terms of closeness
//example in sister, cousin -> we should get sister
PlatonicRelationshipType? getHighestLevelRelationshipInList({
  required List<PlatonicRelationshipType> platonicRelationshipTypeList,
}) {
  //empty list -> null
  if (platonicRelationshipTypeList.isEmpty) {
    return null;
  }
  //list with only one element -> the element
  else if (platonicRelationshipTypeList.length == 1) {
    return platonicRelationshipTypeList.first;
  }

  //I will now check if the list contains a type from a group one or more of relationship types.
  //rule for grouping: ONLY one relationship can exist from that group at a time.
  //example: your birth parent cannot also be your step parent, SO it is safe to group them together

  //
  //contains any parent type relationship
  final Iterable<PlatonicRelationshipType> parentTypeRelationship =
      platonicRelationshipTypeList.where(
    (element) => element.relationshipCategory == RelationshipCategory.parent,
  );

  if (parentTypeRelationship.isNotEmpty) {
    return parentTypeRelationship.first;
  }

  //
  //contains any child type relationship
  final Iterable<PlatonicRelationshipType> childTypeRelationship =
      platonicRelationshipTypeList.where(
    (element) => element.relationshipCategory == RelationshipCategory.child,
  );

  if (childTypeRelationship.isNotEmpty) {
    return childTypeRelationship.first;
  }

  //
  //contains any sibling type relationship
  final Iterable<PlatonicRelationshipType> siblingTypeRelationship =
      platonicRelationshipTypeList.where(
    (element) => element.relationshipCategory == RelationshipCategory.sibling,
  );

  if (siblingTypeRelationship.isNotEmpty) {
    return siblingTypeRelationship.first;
  }

  //
  //contains any grandparent or child type relationship
  final Iterable<PlatonicRelationshipType> grandParentOrChildTypeRelationship =
      platonicRelationshipTypeList.where(
    (element) =>
        //grandchild
        element == PlatonicRelationshipType.grandChild ||
        element == PlatonicRelationshipType.stepGrandChild ||
        //greatgrandchild
        element == PlatonicRelationshipType.greatGrandChild ||
        element == PlatonicRelationshipType.stepGreatGrandChild ||
        //grandparent
        element == PlatonicRelationshipType.grandParent ||
        element == PlatonicRelationshipType.stepGrandParent ||
        //greatgrandparent
        element == PlatonicRelationshipType.greatGrandParent ||
        element == PlatonicRelationshipType.stepGreatGrandParent,
  );

  if (grandParentOrChildTypeRelationship.isNotEmpty) {
    return grandParentOrChildTypeRelationship.first;
  }

  //
  //contains any nibling type relationship
  final Iterable<PlatonicRelationshipType> niblingTypeRelationship =
      platonicRelationshipTypeList.where(
    (element) =>
        //nibling
        element == PlatonicRelationshipType.nibling ||
        element == PlatonicRelationshipType.stepNibling ||
        //grandnibling
        element == PlatonicRelationshipType.grandNibling ||
        element == PlatonicRelationshipType.stepGrandNibling ||
        //greatgrandnibling
        element == PlatonicRelationshipType.greatGrandNibling ||
        element == PlatonicRelationshipType.stepGreatGrandNibling,
  );

  if (niblingTypeRelationship.isNotEmpty) {
    return niblingTypeRelationship.first;
  }

  //
  //contains any pibling or cousin type relationship
  final Iterable<PlatonicRelationshipType> piblingOrCousinTypeRelationship =
      platonicRelationshipTypeList.where(
    (element) =>
        //pibling
        element == PlatonicRelationshipType.pibling ||
        element == PlatonicRelationshipType.stepPibling ||
        //cousin
        element == PlatonicRelationshipType.cousin ||
        element == PlatonicRelationshipType.stepCousin ||
        //grandcousin
        element == PlatonicRelationshipType.grandCousin ||
        element == PlatonicRelationshipType.stepGrandCousin ||
        //greatgrandcousin
        element == PlatonicRelationshipType.greatGrandCousin ||
        element == PlatonicRelationshipType.stepGreatGrandCousin,
  );

  if (piblingOrCousinTypeRelationship.isNotEmpty) {
    return piblingOrCousinTypeRelationship.first;
  }

  //
  //contains distant relative relationship
  if (platonicRelationshipTypeList
      .contains(PlatonicRelationshipType.distantRelative)) {
    return PlatonicRelationshipType.distantRelative;
  }

  //
  //contains any inlaw type relationship
  final Iterable<PlatonicRelationshipType> inLawTypeRelationship =
      platonicRelationshipTypeList.where(
    (element) => element.relationshipCategory == RelationshipCategory.inLaw,
  );

  if (inLawTypeRelationship.isNotEmpty) {
    return inLawTypeRelationship.first;
  }

  //
  //contains friend relationship
  if (platonicRelationshipTypeList.contains(PlatonicRelationshipType.friend)) {
    return PlatonicRelationshipType.friend;
  }

  //
  //contains acquaintance relationship
  if (platonicRelationshipTypeList
      .contains(PlatonicRelationshipType.acquaintance)) {
    return PlatonicRelationshipType.acquaintance;
  }

  //
  //if you get here, no valid 
  return null;
}
