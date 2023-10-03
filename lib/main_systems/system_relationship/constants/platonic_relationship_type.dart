import 'package:toplife/main_systems/system_relationship/constants/relationship_category.dart';

enum PlatonicRelationshipType {
  //parent
  birthParent(
    maleEquivalent: "Birth father",
    femaleEquivalent: "Birth mother",
    relationshipCategory: RelationshipCategory.parent,
  ),
  adoptiveParent(
    maleEquivalent: "Adoptive father",
    femaleEquivalent: "Adoptive mother",
    relationshipCategory: RelationshipCategory.parent,
  ),
  stepParent(
    maleEquivalent: "Stepfather",
    femaleEquivalent: "Stepmother",
    relationshipCategory: RelationshipCategory.parent,
  ),
  //sibling
  halfSibling(
    maleEquivalent: "Half-brother",
    femaleEquivalent: "Half-sister",
    relationshipCategory: RelationshipCategory.sibling,
  ),
  fullSibling(
    maleEquivalent: "Full brother",
    femaleEquivalent: "Full sister",
    relationshipCategory: RelationshipCategory.sibling,
  ),
  adoptiveSibling(
    maleEquivalent: "Adoptive brother",
    femaleEquivalent: "Adoptive sister",
    relationshipCategory: RelationshipCategory.sibling,
  ),
  stepSibling(
    maleEquivalent: "Stepbrother",
    femaleEquivalent: "Stepsister",
    relationshipCategory: RelationshipCategory.sibling,
  ),
  //child
  birthChild(
    maleEquivalent: "Birth son",
    femaleEquivalent: "Birth daughter",
    relationshipCategory: RelationshipCategory.child,
  ),
  adoptiveChild(
    maleEquivalent: "Adoptive son",
    femaleEquivalent: "Adoptive daughter",
    relationshipCategory: RelationshipCategory.child,
  ),
  stepChild(
    maleEquivalent: "Stepson",
    femaleEquivalent: "Stepdaughter",
    relationshipCategory: RelationshipCategory.child,
  ),
  //relatives
  grandChild(
    maleEquivalent: "Grandson",
    femaleEquivalent: "Granddaughter",
    relationshipCategory: RelationshipCategory.relative,
  ),
  greatGrandChild(
    maleEquivalent: "Great-grandson",
    femaleEquivalent: "Great-granddaughter",
    relationshipCategory: RelationshipCategory.relative,
  ),
  grandParent(
    maleEquivalent: "Grandfather",
    femaleEquivalent: "Grandmother",
    relationshipCategory: RelationshipCategory.relative,
  ),
  greatGrandParent(
    maleEquivalent: "Great-grandfather",
    femaleEquivalent: "Great-grandmother",
    relationshipCategory: RelationshipCategory.relative,
  ),
  nibling(
    maleEquivalent: "Nephew",
    femaleEquivalent: "Niece",
    relationshipCategory: RelationshipCategory.relative,
  ),
  pibling(
    maleEquivalent: "Uncle",
    femaleEquivalent: "Aunt",
    relationshipCategory: RelationshipCategory.relative,
  ),
  cousin(
    maleEquivalent: "Cousin",
    femaleEquivalent: "Cousin",
    relationshipCategory: RelationshipCategory.relative,
  ),
  //inLaws
  parentInLaw(
    maleEquivalent: "Father-in-law",
    femaleEquivalent: "Mother-in-law",
    relationshipCategory: RelationshipCategory.inLaw,
  ),
  childInLaw(
    maleEquivalent: "Son-in-law",
    femaleEquivalent: "Daughter-in-law",
    relationshipCategory: RelationshipCategory.inLaw,
  ),
  siblingInLaw(
    maleEquivalent: "Brother-in-law",
    femaleEquivalent: "Sister-in-law",
    relationshipCategory: RelationshipCategory.inLaw,
  ),
  //friend
  friend(
    maleEquivalent: "Friend",
    femaleEquivalent: "Friend",
    relationshipCategory: RelationshipCategory.friend,
  ),
  //acquaintance
  acquaintance(
    maleEquivalent: "Acquaintance",
    femaleEquivalent: "Acquaintance",
    relationshipCategory: RelationshipCategory.acquaintance,
  );

  const PlatonicRelationshipType({
    required this.maleEquivalent,
    required this.femaleEquivalent,
    required this.relationshipCategory,
  });

  final String maleEquivalent;
  final String femaleEquivalent;
  final RelationshipCategory relationshipCategory;
}
