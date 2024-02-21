import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/constants/step_relationship_generation_line.dart';
import 'package:toplife/main_systems/system_relationship/util/get_step_generation_line_using_person_relationship_to_parent.dart';

void main() {
  group('Get step generation line using person relationship to parent:', () {
    test('every platonic relationship type returns the correct value', () {
      for (var type in PlatonicRelationshipType.values) {
        //get result
        final List<PlatonicRelationshipType> result =
            getStepGenerationLineUsingPersonRelationshipToParents(
          personRelationshipToParent: type,
        );

        switch (type) {
          //parents
          case PlatonicRelationshipType.birthParent:
            expect(
              result,
              StepRelationshipGenerationLine.stepSiblingToStepGreatGrandNibling,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.adoptiveParent:
            expect(
              result,
              StepRelationshipGenerationLine.stepSiblingToStepGreatGrandNibling,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepParent:
            expect(
              result,
              StepRelationshipGenerationLine.stepSiblingToStepGreatGrandNibling,
              reason: "Cause: $type",
            );
            break;

          //siblings
          case PlatonicRelationshipType.fullSibling:
            expect(
              result,
              StepRelationshipGenerationLine.stepSiblingToStepGreatGrandNibling,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.halfSibling:
            expect(
              result,
              StepRelationshipGenerationLine.stepSiblingToStepGreatGrandNibling,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.adoptiveSibling:
            expect(
              result,
              StepRelationshipGenerationLine.stepSiblingToStepGreatGrandNibling,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepSibling:
            expect(
              result,
              StepRelationshipGenerationLine.stepSiblingToStepGreatGrandNibling,
              reason: "Cause: $type",
            );
            break;

          //child
          case PlatonicRelationshipType.birthChild:
            expect(
              result,
              StepRelationshipGenerationLine
                  .stepGrandChildToStepGreatGrandChild,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.adoptiveChild:
            expect(
              result,
              StepRelationshipGenerationLine
                  .stepGrandChildToStepGreatGrandChild,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepChild:
            expect(
              result,
              StepRelationshipGenerationLine
                  .stepGrandChildToStepGreatGrandChild,
              reason: "Cause: $type",
            );
            break;

          //relative
          case PlatonicRelationshipType.grandParent:
            expect(
              result,
              StepRelationshipGenerationLine.stepPiblingToStepGreatGrandCousin,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepGrandParent:
            expect(
              result,
              StepRelationshipGenerationLine.stepPiblingToStepGreatGrandCousin,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.greatGrandParent:
            expect(
              result,
              [],
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepGreatGrandParent:
            expect(
              result,
              [],
              reason: "Cause: $type",
            );
            break;

          case PlatonicRelationshipType.grandChild:
            expect(
              result,
              StepRelationshipGenerationLine
                  .stepGrandChildToStepGreatGrandChild,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepGrandChild:
            expect(
              result,
              StepRelationshipGenerationLine
                  .stepGrandChildToStepGreatGrandChild,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.greatGrandChild:
            expect(
              result,
              StepRelationshipGenerationLine
                  .stepGrandChildToStepGreatGrandChild,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepGreatGrandChild:
            expect(
              result,
              StepRelationshipGenerationLine
                  .stepGrandChildToStepGreatGrandChild,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.pibling:
            expect(
              result,
              StepRelationshipGenerationLine.stepPiblingToStepGreatGrandCousin,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepPibling:
            expect(
              result,
              StepRelationshipGenerationLine.stepPiblingToStepGreatGrandCousin,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.cousin:
            expect(
              result,
              StepRelationshipGenerationLine.stepPiblingToStepGreatGrandCousin,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepCousin:
            expect(
              result,
              StepRelationshipGenerationLine.stepPiblingToStepGreatGrandCousin,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.grandCousin:
            expect(
              result,
              StepRelationshipGenerationLine.stepPiblingToStepGreatGrandCousin,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepGrandCousin:
            expect(
              result,
              StepRelationshipGenerationLine.stepPiblingToStepGreatGrandCousin,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.greatGrandCousin:
            expect(
              result,
              StepRelationshipGenerationLine.stepPiblingToStepGreatGrandCousin,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepGreatGrandCousin:
            expect(
              result,
              StepRelationshipGenerationLine.stepPiblingToStepGreatGrandCousin,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.nibling:
            expect(
              result,
              StepRelationshipGenerationLine.stepSiblingToStepGreatGrandNibling,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepNibling:
            expect(
              result,
              StepRelationshipGenerationLine.stepSiblingToStepGreatGrandNibling,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.grandNibling:
            expect(
              result,
              StepRelationshipGenerationLine.stepSiblingToStepGreatGrandNibling,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepGrandNibling:
            expect(
              result,
              StepRelationshipGenerationLine.stepSiblingToStepGreatGrandNibling,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.greatGrandNibling:
            expect(
              result,
              StepRelationshipGenerationLine.stepSiblingToStepGreatGrandNibling,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepGreatGrandNibling:
            expect(
              result,
              StepRelationshipGenerationLine.stepSiblingToStepGreatGrandNibling,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.distantRelative:
            expect(
              result,
              [],
              reason: "Cause: $type",
            );
            break;

          //in laws
          case PlatonicRelationshipType.parentInLaw:
            expect(
              result,
              [PlatonicRelationshipType.siblingInLaw],
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.siblingInLaw:
            expect(
              result,
              [PlatonicRelationshipType.siblingInLaw],
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepSiblingInLaw:
            expect(
              result,
              [PlatonicRelationshipType.siblingInLaw],
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.childInLaw:
            expect(
              result,
              [],
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepChildInLaw:
            expect(
              result,
              [],
              reason: "Cause: $type",
            );
            break;

          //friend
          case PlatonicRelationshipType.friend:
            expect(
              result,
              [],
              reason: "Cause: $type",
            );
            break;

          //acquaintance
          case PlatonicRelationshipType.acquaintance:
            expect(
              result,
              [],
              reason: "Cause: $type",
            );
            break;
        }
      }
    });
  });
}
