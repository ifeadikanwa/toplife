import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/step_relationship_generation_line.dart';

void main() {
  group("Step relationship generation line:", () {
    test("stepSiblingToStepGreatGrandNibling is correct", () {
      expect(
        StepRelationshipGenerationLine.stepSiblingToStepGreatGrandNibling,
        [
          PlatonicRelationshipType.stepSibling,
          PlatonicRelationshipType.stepNibling,
          PlatonicRelationshipType.stepGrandNibling,
          PlatonicRelationshipType.stepGreatGrandNibling,
        ],
      );
    });

    test("stepGrandChildToStepGreatGrandChild is correct", () {
      expect(
        StepRelationshipGenerationLine.stepGrandChildToStepGreatGrandChild,
        [
          PlatonicRelationshipType.stepGrandChild,
          PlatonicRelationshipType.stepGreatGrandChild,
        ],
      );
    });

    test("stepPiblingToStepGreatGrandCousin is correct", () {
      expect(
        StepRelationshipGenerationLine.stepPiblingToStepGreatGrandCousin,
        [
          PlatonicRelationshipType.stepPibling,
          PlatonicRelationshipType.stepCousin,
          PlatonicRelationshipType.stepGrandCousin,
          PlatonicRelationshipType.stepGreatGrandCousin,
        ],
      );
    });
  });
}
