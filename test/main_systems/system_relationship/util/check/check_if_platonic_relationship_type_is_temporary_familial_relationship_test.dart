import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/util/check/check_if_platonic_relationship_type_is_temporary_familial_relationship.dart';

void main() {
  group(
      "Check if platonic relationship type is temporary familial relationship:",
      () {
    test("every platonic relationship type returns the correct value", () {
      for (var type in PlatonicRelationshipType.values) {
        //get result
        final bool result =
            checkIfPlatonicRelationshipTypeIsTemporaryFamilialRelationship(
          platonicRelationshipTypeString: type.name,
        );

        switch (type) {
          //parents
          case PlatonicRelationshipType.birthParent:
            expect(
              result,
              false,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.adoptiveParent:
            expect(
              result,
              false,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepParent:
            expect(
              result,
              true,
              reason: "Cause: $type",
            );
            break;

          //siblings
          case PlatonicRelationshipType.fullSibling:
            expect(
              result,
              false,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.halfSibling:
            expect(
              result,
              false,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.adoptiveSibling:
            expect(
              result,
              false,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepSibling:
            expect(
              result,
              true,
              reason: "Cause: $type",
            );
            break;

          //child
          case PlatonicRelationshipType.birthChild:
            expect(
              result,
              false,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.adoptiveChild:
            expect(
              result,
              false,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepChild:
            expect(
              result,
              true,
              reason: "Cause: $type",
            );
            break;

          //relative
          case PlatonicRelationshipType.grandParent:
            expect(
              result,
              false,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepGrandParent:
            expect(
              result,
              true,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.greatGrandParent:
            expect(
              result,
              false,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepGreatGrandParent:
            expect(
              result,
              true,
              reason: "Cause: $type",
            );
            break;

          case PlatonicRelationshipType.grandChild:
            expect(
              result,
              false,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepGrandChild:
            expect(
              result,
              true,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.greatGrandChild:
            expect(
              result,
              false,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepGreatGrandChild:
            expect(
              result,
              true,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.pibling:
            expect(
              result,
              false,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepPibling:
            expect(
              result,
              true,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.cousin:
            expect(
              result,
              false,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepCousin:
            expect(
              result,
              true,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.grandCousin:
            expect(
              result,
              false,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepGrandCousin:
            expect(
              result,
              true,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.greatGrandCousin:
            expect(
              result,
              false,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepGreatGrandCousin:
            expect(
              result,
              true,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.nibling:
            expect(
              result,
              false,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepNibling:
            expect(
              result,
              true,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.grandNibling:
            expect(
              result,
              false,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepGrandNibling:
            expect(
              result,
              true,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.greatGrandNibling:
            expect(
              result,
              false,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepGreatGrandNibling:
            expect(
              result,
              true,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.distantRelative:
            expect(
              result,
              false,
              reason: "Cause: $type",
            );
            break;

          //in laws
          case PlatonicRelationshipType.parentInLaw:
            expect(
              result,
              true,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.siblingInLaw:
            expect(
              result,
              true,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepSiblingInLaw:
            expect(
              result,
              true,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.childInLaw:
            expect(
              result,
              true,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepChildInLaw:
            expect(
              result,
              true,
              reason: "Cause: $type",
            );
            break;

          //friend
          case PlatonicRelationshipType.friend:
            expect(
              result,
              false,
              reason: "Cause: $type",
            );
            break;

          //acquaintance
          case PlatonicRelationshipType.acquaintance:
            expect(
              result,
              false,
              reason: "Cause: $type",
            );
            break;
        }
      }
    });
  });
}
