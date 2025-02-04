import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/relationship_category.dart';

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
        "stepGrandChild relationship category, male and female equivalents are correct",
        () {
      expect(
        PlatonicRelationshipType.stepGrandChild.relationshipCategory,
        RelationshipCategory.relative,
        reason: "Cause: relationship category",
      );

      expect(
        PlatonicRelationshipType.stepGrandChild.maleEquivalent,
        "Step-grandson",
        reason: "Cause: male equivalent",
      );

      expect(
        PlatonicRelationshipType.stepGrandChild.femaleEquivalent,
        "Step-granddaughter",
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
        "stepGreatGrandChild relationship category, male and female equivalents are correct",
        () {
      expect(
        PlatonicRelationshipType.stepGreatGrandChild.relationshipCategory,
        RelationshipCategory.relative,
        reason: "Cause: relationship category",
      );

      expect(
        PlatonicRelationshipType.stepGreatGrandChild.maleEquivalent,
        "Step-great-grandson",
        reason: "Cause: male equivalent",
      );

      expect(
        PlatonicRelationshipType.stepGreatGrandChild.femaleEquivalent,
        "Step-great-granddaughter",
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
        "stepGrandParent relationship category, male and female equivalents are correct",
        () {
      expect(
        PlatonicRelationshipType.stepGrandParent.relationshipCategory,
        RelationshipCategory.relative,
        reason: "Cause: relationship category",
      );

      expect(
        PlatonicRelationshipType.stepGrandParent.maleEquivalent,
        "Step-grandfather",
        reason: "Cause: male equivalent",
      );

      expect(
        PlatonicRelationshipType.stepGrandParent.femaleEquivalent,
        "Step-grandmother",
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
        "stepGreatGrandParent relationship category, male and female equivalents are correct",
        () {
      expect(
        PlatonicRelationshipType.stepGreatGrandParent.relationshipCategory,
        RelationshipCategory.relative,
        reason: "Cause: relationship category",
      );

      expect(
        PlatonicRelationshipType.stepGreatGrandParent.maleEquivalent,
        "Step-great-grandfather",
        reason: "Cause: male equivalent",
      );

      expect(
        PlatonicRelationshipType.stepGreatGrandParent.femaleEquivalent,
        "Step-great-grandmother",
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
        "stepNibling relationship category, male and female equivalents are correct",
        () {
      expect(
        PlatonicRelationshipType.stepNibling.relationshipCategory,
        RelationshipCategory.relative,
        reason: "Cause: relationship category",
      );

      expect(
        PlatonicRelationshipType.stepNibling.maleEquivalent,
        "Step-nephew",
        reason: "Cause: male equivalent",
      );

      expect(
        PlatonicRelationshipType.stepNibling.femaleEquivalent,
        "Step-niece",
        reason: "Cause: female equivalent",
      );
    });

    test(
        "grandNibling relationship category, male and female equivalents are correct",
        () {
      expect(
        PlatonicRelationshipType.grandNibling.relationshipCategory,
        RelationshipCategory.relative,
        reason: "Cause: relationship category",
      );

      expect(
        PlatonicRelationshipType.grandNibling.maleEquivalent,
        "Grandnephew",
        reason: "Cause: male equivalent",
      );

      expect(
        PlatonicRelationshipType.grandNibling.femaleEquivalent,
        "Grandniece",
        reason: "Cause: female equivalent",
      );
    });

    test(
        "stepGrandNibling relationship category, male and female equivalents are correct",
        () {
      expect(
        PlatonicRelationshipType.stepGrandNibling.relationshipCategory,
        RelationshipCategory.relative,
        reason: "Cause: relationship category",
      );

      expect(
        PlatonicRelationshipType.stepGrandNibling.maleEquivalent,
        "Step-grandnephew",
        reason: "Cause: male equivalent",
      );

      expect(
        PlatonicRelationshipType.stepGrandNibling.femaleEquivalent,
        "Step-grandniece",
        reason: "Cause: female equivalent",
      );
    });

    test(
        "greatGrandNibling relationship category, male and female equivalents are correct",
        () {
      expect(
        PlatonicRelationshipType.greatGrandNibling.relationshipCategory,
        RelationshipCategory.relative,
        reason: "Cause: relationship category",
      );

      expect(
        PlatonicRelationshipType.greatGrandNibling.maleEquivalent,
        "Great-grandnephew",
        reason: "Cause: male equivalent",
      );

      expect(
        PlatonicRelationshipType.greatGrandNibling.femaleEquivalent,
        "Great-grandniece",
        reason: "Cause: female equivalent",
      );
    });

    test(
        "stepGreatGrandNibling relationship category, male and female equivalents are correct",
        () {
      expect(
        PlatonicRelationshipType.stepGreatGrandNibling.relationshipCategory,
        RelationshipCategory.relative,
        reason: "Cause: relationship category",
      );

      expect(
        PlatonicRelationshipType.stepGreatGrandNibling.maleEquivalent,
        "Step-great-grandnephew",
        reason: "Cause: male equivalent",
      );

      expect(
        PlatonicRelationshipType.stepGreatGrandNibling.femaleEquivalent,
        "Step-great-grandniece",
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
        "stepPibling relationship category, male and female equivalents are correct",
        () {
      expect(
        PlatonicRelationshipType.stepPibling.relationshipCategory,
        RelationshipCategory.relative,
        reason: "Cause: relationship category",
      );

      expect(
        PlatonicRelationshipType.stepPibling.maleEquivalent,
        "Step-uncle",
        reason: "Cause: male equivalent",
      );

      expect(
        PlatonicRelationshipType.stepPibling.femaleEquivalent,
        "Step-aunt",
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

    test(
        "stepCousin relationship category, male and female equivalents are correct",
        () {
      expect(
        PlatonicRelationshipType.stepCousin.relationshipCategory,
        RelationshipCategory.relative,
        reason: "Cause: relationship category",
      );

      expect(
        PlatonicRelationshipType.stepCousin.maleEquivalent,
        "Step-cousin",
        reason: "Cause: male equivalent",
      );

      expect(
        PlatonicRelationshipType.stepCousin.femaleEquivalent,
        "Step-cousin",
        reason: "Cause: female equivalent",
      );
    });

    test(
        "grandCousin relationship category, male and female equivalents are correct",
        () {
      expect(
        PlatonicRelationshipType.grandCousin.relationshipCategory,
        RelationshipCategory.relative,
        reason: "Cause: relationship category",
      );

      expect(
        PlatonicRelationshipType.grandCousin.maleEquivalent,
        "Grandcousin",
        reason: "Cause: male equivalent",
      );

      expect(
        PlatonicRelationshipType.grandCousin.femaleEquivalent,
        "Grandcousin",
        reason: "Cause: female equivalent",
      );
    });

    test(
        "stepGrandCousin relationship category, male and female equivalents are correct",
        () {
      expect(
        PlatonicRelationshipType.stepGrandCousin.relationshipCategory,
        RelationshipCategory.relative,
        reason: "Cause: relationship category",
      );

      expect(
        PlatonicRelationshipType.stepGrandCousin.maleEquivalent,
        "Step-grandcousin",
        reason: "Cause: male equivalent",
      );

      expect(
        PlatonicRelationshipType.stepGrandCousin.femaleEquivalent,
        "Step-grandcousin",
        reason: "Cause: female equivalent",
      );
    });

    test(
        "greatGrandCousin relationship category, male and female equivalents are correct",
        () {
      expect(
        PlatonicRelationshipType.greatGrandCousin.relationshipCategory,
        RelationshipCategory.relative,
        reason: "Cause: relationship category",
      );

      expect(
        PlatonicRelationshipType.greatGrandCousin.maleEquivalent,
        "Great-grandcousin",
        reason: "Cause: male equivalent",
      );

      expect(
        PlatonicRelationshipType.greatGrandCousin.femaleEquivalent,
        "Great-grandcousin",
        reason: "Cause: female equivalent",
      );
    });

    test(
        "stepGreatGrandCousin relationship category, male and female equivalents are correct",
        () {
      expect(
        PlatonicRelationshipType.stepGreatGrandCousin.relationshipCategory,
        RelationshipCategory.relative,
        reason: "Cause: relationship category",
      );

      expect(
        PlatonicRelationshipType.stepGreatGrandCousin.maleEquivalent,
        "Step-great-grandcousin",
        reason: "Cause: male equivalent",
      );

      expect(
        PlatonicRelationshipType.stepGreatGrandCousin.femaleEquivalent,
        "Step-great-grandcousin",
        reason: "Cause: female equivalent",
      );
    });

    test(
        "distantRelative relationship category, male and female equivalents are correct",
        () {
      expect(
        PlatonicRelationshipType.distantRelative.relationshipCategory,
        RelationshipCategory.relative,
        reason: "Cause: relationship category",
      );

      expect(
        PlatonicRelationshipType.distantRelative.maleEquivalent,
        "Distant relative",
        reason: "Cause: male equivalent",
      );

      expect(
        PlatonicRelationshipType.distantRelative.femaleEquivalent,
        "Distant relative",
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
        "stepChildInLaw relationship category, male and female equivalents are correct",
        () {
      expect(
        PlatonicRelationshipType.stepChildInLaw.relationshipCategory,
        RelationshipCategory.inLaw,
        reason: "Cause: relationship category",
      );

      expect(
        PlatonicRelationshipType.stepChildInLaw.maleEquivalent,
        "Step son-in-law",
        reason: "Cause: male equivalent",
      );

      expect(
        PlatonicRelationshipType.stepChildInLaw.femaleEquivalent,
        "Step daughter-in-law",
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

    test(
        "stepSiblingInLaw relationship category, male and female equivalents are correct",
        () {
      expect(
        PlatonicRelationshipType.stepSiblingInLaw.relationshipCategory,
        RelationshipCategory.inLaw,
        reason: "Cause: relationship category",
      );

      expect(
        PlatonicRelationshipType.stepSiblingInLaw.maleEquivalent,
        "Step brother-in-law",
        reason: "Cause: male equivalent",
      );

      expect(
        PlatonicRelationshipType.stepSiblingInLaw.femaleEquivalent,
        "Step sister-in-law",
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
