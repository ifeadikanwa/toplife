import 'package:toplife/game_systems/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/step_relationship_generation_line.dart';

List<PlatonicRelationshipType>
    getStepGenerationLineUsingPersonRelationshipToParents({
  required PlatonicRelationshipType personRelationshipToParent,
}) {
  late final List<PlatonicRelationshipType> stepGenerationLine;

  //each switch group contains a ROOT and the CHILDREN LINE (the root is not included in the line)
  switch (personRelationshipToParent) {
    //
    //ROOT: birth/adoptive/step parent
    //CHILDREN LINE: step sibling - step nibling - step grandnibling - step great grandnibling
    //-Parents
    case PlatonicRelationshipType.birthParent:
    case PlatonicRelationshipType.adoptiveParent:
    case PlatonicRelationshipType.stepParent:
    //-Siblings
    case PlatonicRelationshipType.fullSibling:
    case PlatonicRelationshipType.halfSibling:
    case PlatonicRelationshipType.adoptiveSibling:
    case PlatonicRelationshipType.stepSibling:
    //-Nibling
    case PlatonicRelationshipType.nibling:
    case PlatonicRelationshipType.stepNibling:
    //-GrandNibling
    case PlatonicRelationshipType.grandNibling:
    case PlatonicRelationshipType.stepGrandNibling:
    //-GreatGrandNibling
    case PlatonicRelationshipType.greatGrandNibling:
    case PlatonicRelationshipType.stepGreatGrandNibling:
      //
      //set line to stepSiblingToStepGreatGrandNibling list
      stepGenerationLine =
          StepRelationshipGenerationLine.stepSiblingToStepGreatGrandNibling;
      break;

    //
    //ROOT: grandparent/stepgrandparent
    //CHILDREN LINE: step pibling - step cousin - step grandcousin - step great grandcousin
    //-Grandparent
    case PlatonicRelationshipType.grandParent:
    case PlatonicRelationshipType.stepGrandParent:
    //-piblings
    case PlatonicRelationshipType.pibling:
    case PlatonicRelationshipType.stepPibling:
    //-cousin
    case PlatonicRelationshipType.cousin:
    case PlatonicRelationshipType.stepCousin:
    //-grandcousin
    case PlatonicRelationshipType.grandCousin:
    case PlatonicRelationshipType.stepGrandCousin:
    //-greatgrandcousin
    case PlatonicRelationshipType.greatGrandCousin:
    case PlatonicRelationshipType.stepGreatGrandCousin:
      //
      //set line to stepPiblingToStepGreatGrandCousin list
      stepGenerationLine =
          StepRelationshipGenerationLine.stepPiblingToStepGreatGrandCousin;
      break;

    //
    //ROOT: Child (spouse is not a platonic so we can never get that as a root)
    //CHILDREN LINE: step grandchild - step greatgrandchild
    //-Child
    case PlatonicRelationshipType.birthChild:
    case PlatonicRelationshipType.adoptiveChild:
    case PlatonicRelationshipType.stepChild:
    //-Grandchild
    case PlatonicRelationshipType.grandChild:
    case PlatonicRelationshipType.stepGrandChild:
    //-GreatGrandchild
    case PlatonicRelationshipType.greatGrandChild:
    case PlatonicRelationshipType.stepGreatGrandChild:
      //
      //set line to stepGrandChildToStepGreatGrandChild list
      stepGenerationLine =
          StepRelationshipGenerationLine.stepGrandChildToStepGreatGrandChild;
      break;

    //
    //ROOT: Parent-in-law
    //CHILDREN LINE: sibling-in-law
    //parent in law
    case PlatonicRelationshipType.parentInLaw:
    //sibling in law
    case PlatonicRelationshipType.siblingInLaw:
    case PlatonicRelationshipType.stepSiblingInLaw:
      //
      //set line to list with just sibling-in-law(all spouses siblings are sibling-in-laws only)
      stepGenerationLine = [PlatonicRelationshipType.siblingInLaw];
      break;

    //
    //We DON'T account for these relationship types
    //either because their children don't have relationship labels or we never add children through them
    //-Great grandparent
    case PlatonicRelationshipType.greatGrandParent:
    case PlatonicRelationshipType.stepGreatGrandParent:
    //-distant relative
    case PlatonicRelationshipType.distantRelative:
    //-child in law
    case PlatonicRelationshipType.childInLaw:
    case PlatonicRelationshipType.stepChildInLaw:
    //-friend
    case PlatonicRelationshipType.friend:
    //-acquaintance
    case PlatonicRelationshipType.acquaintance:
      //
      //set line to empty list
      stepGenerationLine = [];
      break;
  }

  return stepGenerationLine;
}
