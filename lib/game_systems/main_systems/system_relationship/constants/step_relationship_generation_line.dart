import 'package:toplife/game_systems/main_systems/system_relationship/constants/platonic_relationship_type.dart';

//getting step family is going to be a recurring action
//So this is here to support that action
//we have listed here ONLY relationships you can have multiple of
//For example the root/starting point for pibling is grandparent but we dont include grandparent
//Why? the usecase using these lists needs it to only contain multiples relationship types
class StepRelationshipGenerationLine {
  static const List<PlatonicRelationshipType>
      stepSiblingToStepGreatGrandNibling = [
    PlatonicRelationshipType.stepSibling,
    PlatonicRelationshipType.stepNibling,
    PlatonicRelationshipType.stepGrandNibling,
    PlatonicRelationshipType.stepGreatGrandNibling,
  ];

  static const List<PlatonicRelationshipType> stepGrandChildToStepGreatGrandChild = [
    PlatonicRelationshipType.stepGrandChild,
    PlatonicRelationshipType.stepGreatGrandChild,
  ];

  static const List<PlatonicRelationshipType>
      stepPiblingToStepGreatGrandCousin = [
    PlatonicRelationshipType.stepPibling, 
    PlatonicRelationshipType.stepCousin,
    PlatonicRelationshipType.stepGrandCousin,
    PlatonicRelationshipType.stepGreatGrandCousin,
  ];
}
