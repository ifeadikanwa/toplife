import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/constants/relationship_category.dart';

void main() {
  group("Platonic relationship types:", () {
    //parent
    test(
        "birthParent relationship category, male and female equivalents are correct",
        () {
      expect(
        PlatonicRelationshipType.birthParent.relationshipCategory,
        RelationshipCategory.parent,
        reason: "Cause: relationship category",
      );

      expect(
        PlatonicRelationshipType.birthParent.maleEquivalent,
        "Birth father",
        reason: "Cause: male equivalent",
      );

      expect(
        PlatonicRelationshipType.birthParent.femaleEquivalent,
        "Birth mother",
        reason: "Cause: female equivalent",
      );
    });

    test(
        "adoptiveParent relationship category, male and female equivalents are correct",
        () {
      expect(
        PlatonicRelationshipType.adoptiveParent.relationshipCategory,
        RelationshipCategory.parent,
        reason: "Cause: relationship category",
      );

      expect(
        PlatonicRelationshipType.adoptiveParent.maleEquivalent,
        "Adoptive father",
        reason: "Cause: male equivalent",
      );

      expect(
        PlatonicRelationshipType.adoptiveParent.femaleEquivalent,
        "Adoptive mother",
        reason: "Cause: female equivalent",
      );
    });

    test(
        "stepParent relationship category, male and female equivalents are correct",
        () {
      expect(
        PlatonicRelationshipType.stepParent.relationshipCategory,
        RelationshipCategory.parent,
        reason: "Cause: relationship category",
      );

      expect(
        PlatonicRelationshipType.stepParent.maleEquivalent,
        "Stepfather",
        reason: "Cause: male equivalent",
      );

      expect(
        PlatonicRelationshipType.stepParent.femaleEquivalent,
        "Stepmother",
        reason: "Cause: female equivalent",
      );
    });

    //sibling
    test(
        "halfSibling relationship category, male and female equivalents are correct",
        () {
      expect(
        PlatonicRelationshipType.halfSibling.relationshipCategory,
        RelationshipCategory.sibling,
        reason: "Cause: relationship category",
      );

      expect(
        PlatonicRelationshipType.halfSibling.maleEquivalent,
        "Half-brother",
        reason: "Cause: male equivalent",
      );

      expect(
        PlatonicRelationshipType.halfSibling.femaleEquivalent,
        "Half-sister",
        reason: "Cause: female equivalent",
      );
    });

    test(
        "fullSibling relationship category, male and female equivalents are correct",
        () {
      expect(
        PlatonicRelationshipType.fullSibling.relationshipCategory,
        RelationshipCategory.sibling,
        reason: "Cause: relationship category",
      );

      expect(
        PlatonicRelationshipType.fullSibling.maleEquivalent,
        "Full brother",
        reason: "Cause: male equivalent",
      );

      expect(
        PlatonicRelationshipType.fullSibling.femaleEquivalent,
        "Full sister",
        reason: "Cause: female equivalent",
      );
    });

    test(
        "adoptiveSibling relationship category, male and female equivalents are correct",
        () {
      expect(
        PlatonicRelationshipType.adoptiveSibling.relationshipCategory,
        RelationshipCategory.sibling,
        reason: "Cause: relationship category",
      );

      expect(
        PlatonicRelationshipType.adoptiveSibling.maleEquivalent,
        "Adoptive brother",
        reason: "Cause: male equivalent",
      );

      expect(
        PlatonicRelationshipType.adoptiveSibling.femaleEquivalent,
        "Adoptive sister",
        reason: "Cause: female equivalent",
      );
    });

    test(
        "stepSibling relationship category, male and female equivalents are correct",
        () {
      expect(
        PlatonicRelationshipType.stepSibling.relationshipCategory,
        RelationshipCategory.sibling,
        reason: "Cause: relationship category",
      );

      expect(
        PlatonicRelationshipType.stepSibling.maleEquivalent,
        "Stepbrother",
        reason: "Cause: male equivalent",
      );

      expect(
        PlatonicRelationshipType.stepSibling.femaleEquivalent,
        "Stepsister",
        reason: "Cause: female equivalent",
      );
    });

    //child
    test(
        "birthChild relationship category, male and female equivalents are correct",
        () {
      expect(
        PlatonicRelationshipType.birthChild.relationshipCategory,
        RelationshipCategory.child,
        reason: "Cause: relationship category",
      );

      expect(
        PlatonicRelationshipType.birthChild.maleEquivalent,
        "Birth son",
        reason: "Cause: male equivalent",
      );

      expect(
        PlatonicRelationshipType.birthChild.femaleEquivalent,
        "Birth daughter",
        reason: "Cause: female equivalent",
      );
    });

    test(
        "adoptiveChild relationship category, male and female equivalents are correct",
        () {
      expect(
        PlatonicRelationshipType.adoptiveChild.relationshipCategory,
        RelationshipCategory.child,
        reason: "Cause: relationship category",
      );

      expect(
        PlatonicRelationshipType.adoptiveChild.maleEquivalent,
        "Adoptive son",
        reason: "Cause: male equivalent",
      );

      expect(
        PlatonicRelationshipType.adoptiveChild.femaleEquivalent,
        "Adoptive daughter",
        reason: "Cause: female equivalent",
      );
    });

    test(
        "stepChild relationship category, male and female equivalents are correct",
        () {
      expect(
        PlatonicRelationshipType.stepChild.relationshipCategory,
        RelationshipCategory.child,
        reason: "Cause: relationship category",
      );

      expect(
        PlatonicRelationshipType.stepChild.maleEquivalent,
        "Stepson",
        reason: "Cause: male equivalent",
      );

      expect(
        PlatonicRelationshipType.stepChild.femaleEquivalent,
        "Stepdaughter",
        reason: "Cause: female equivalent",
      );
    });

    //relatives
    test(
        "grandChild relationship category, male and female equivalents are correct",
        () {
      expect(
        PlatonicRelationshipType.grandChild.relationshipCategory,
        RelationshipCategory.relative,
        reason: "Cause: relationship category",
      );

      expect(
        PlatonicRelationshipType.grandChild.maleEquivalent,
        "Grandson",
        reason: "Cause: male equivalent",
      );

      expect(
        PlatonicRelationshipType.grandChild.femaleEquivalent,
        "Granddaughter",
        reason: "Cause: female equivalent",
      );
    });

    test(
        "greatGrandChild relationship category, male and female equivalents are correct",
        () {
      expect(
        PlatonicRelationshipType.greatGrandChild.relationshipCategory,
        RelationshipCategory.relative,
        reason: "Cause: relationship category",
      );

      expect(
        PlatonicRelationshipType.greatGrandChild.maleEquivalent,
        "Great-grandson",
        reason: "Cause: male equivalent",
      );

      expect(
        PlatonicRelationshipType.greatGrandChild.femaleEquivalent,
        "Great-granddaughter",
        reason: "Cause: female equivalent",
      );
    });

    test(
        "grandParent relationship category, male and female equivalents are correct",
        () {
      expect(
        PlatonicRelationshipType.grandParent.relationshipCategory,
        RelationshipCategory.relative,
        reason: "Cause: relationship category",
      );

      expect(
        PlatonicRelationshipType.grandParent.maleEquivalent,
        "Grandfather",
        reason: "Cause: male equivalent",
      );

      expect(
        PlatonicRelationshipType.grandParent.femaleEquivalent,
        "Grandmother",
        reason: "Cause: female equivalent",
      );
    });

    test(
        "greatGrandParent relationship category, male and female equivalents are correct",
        () {
      expect(
        PlatonicRelationshipType.greatGrandParent.relationshipCategory,
        RelationshipCategory.relative,
        reason: "Cause: relationship category",
      );

      expect(
        PlatonicRelationshipType.greatGrandParent.maleEquivalent,
        "Great-grandfather",
        reason: "Cause: male equivalent",
      );

      expect(
        PlatonicRelationshipType.greatGrandParent.femaleEquivalent,
        "Great-grandmother",
        reason: "Cause: female equivalent",
      );
    });

    test(
        "nibling relationship category, male and female equivalents are correct",
        () {
      expect(
        PlatonicRelationshipType.nibling.relationshipCategory,
        RelationshipCategory.relative,
        reason: "Cause: relationship category",
      );

      expect(
        PlatonicRelationshipType.nibling.maleEquivalent,
        "Nephew",
        reason: "Cause: male equivalent",
      );

      expect(
        PlatonicRelationshipType.nibling.femaleEquivalent,
        "Niece",
        reason: "Cause: female equivalent",
      );
    });

    test(
        "pibling relationship category, male and female equivalents are correct",
        () {
      expect(
        PlatonicRelationshipType.pibling.relationshipCategory,
        RelationshipCategory.relative,
        reason: "Cause: relationship category",
      );

      expect(
        PlatonicRelationshipType.pibling.maleEquivalent,
        "Uncle",
        reason: "Cause: male equivalent",
      );

      expect(
        PlatonicRelationshipType.pibling.femaleEquivalent,
        "Aunt",
        reason: "Cause: female equivalent",
      );
    });

    test(
        "cousin relationship category, male and female equivalents are correct",
        () {
      expect(
        PlatonicRelationshipType.cousin.relationshipCategory,
        RelationshipCategory.relative,
        reason: "Cause: relationship category",
      );

      expect(
        PlatonicRelationshipType.cousin.maleEquivalent,
        "Cousin",
        reason: "Cause: male equivalent",
      );

      expect(
        PlatonicRelationshipType.cousin.femaleEquivalent,
        "Cousin",
        reason: "Cause: female equivalent",
      );
    });

    //in-laws
     test(
        "parentInLaw relationship category, male and female equivalents are correct",
        () {
      expect(
        PlatonicRelationshipType.parentInLaw.relationshipCategory,
        RelationshipCategory.inLaw,
        reason: "Cause: relationship category",
      );

      expect(
        PlatonicRelationshipType.parentInLaw.maleEquivalent,
        "Father-in-law",
        reason: "Cause: male equivalent",
      );

      expect(
        PlatonicRelationshipType.parentInLaw.femaleEquivalent,
        "Mother-in-law",
        reason: "Cause: female equivalent",
      );
    });

      test(
        "childInLaw relationship category, male and female equivalents are correct",
        () {
      expect(
        PlatonicRelationshipType.childInLaw.relationshipCategory,
        RelationshipCategory.inLaw,
        reason: "Cause: relationship category",
      );

      expect(
        PlatonicRelationshipType.childInLaw.maleEquivalent,
        "Son-in-law",
        reason: "Cause: male equivalent",
      );

      expect(
        PlatonicRelationshipType.childInLaw.femaleEquivalent,
        "Daughter-in-law",
        reason: "Cause: female equivalent",
      );
    });

      test(
        "siblingInLaw relationship category, male and female equivalents are correct",
        () {
      expect(
        PlatonicRelationshipType.siblingInLaw.relationshipCategory,
        RelationshipCategory.inLaw,
        reason: "Cause: relationship category",
      );

      expect(
        PlatonicRelationshipType.siblingInLaw.maleEquivalent,
        "Brother-in-law",
        reason: "Cause: male equivalent",
      );

      expect(
        PlatonicRelationshipType.siblingInLaw.femaleEquivalent,
        "Sister-in-law",
        reason: "Cause: female equivalent",
      );
    });

    //friend
     test(
        "friend relationship category, male and female equivalents are correct",
        () {
      expect(
        PlatonicRelationshipType.friend.relationshipCategory,
        RelationshipCategory.friend,
        reason: "Cause: relationship category",
      );

      expect(
        PlatonicRelationshipType.friend.maleEquivalent,
        "Friend",
        reason: "Cause: male equivalent",
      );

      expect(
        PlatonicRelationshipType.friend.femaleEquivalent,
        "Friend",
        reason: "Cause: female equivalent",
      );
    });

    //acquaintance
    test(
        "acquaintance relationship category, male and female equivalents are correct",
        () {
      expect(
        PlatonicRelationshipType.acquaintance.relationshipCategory,
        RelationshipCategory.acquaintance,
        reason: "Cause: relationship category",
      );

      expect(
        PlatonicRelationshipType.acquaintance.maleEquivalent,
        "Acquaintance",
        reason: "Cause: male equivalent",
      );

      expect(
        PlatonicRelationshipType.acquaintance.femaleEquivalent,
        "Acquaintance",
        reason: "Cause: female equivalent",
      );
    });
  });
}
