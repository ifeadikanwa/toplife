import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/util/check/check_if_familial_platonic_relationship_type.dart';

void main() {
  group("checkIfFamilialPlatonicRelationshipType: ", () {
    group(
        "Exclude all step parents = true, Exclude all distant relatives = false: ",
        () {
      const bool excludeAllStepParents = true;
      const bool excludeAllDistantRelatives = true;
      test("every platonic relationship type returns the correct value", () {
        for (var type in PlatonicRelationshipType.values) {
          //get result
          final bool result = checkIfFamilialPlatonicRelationshipType(
            platonicRelationshipType: type,
            excludeAllStepParentTypes: excludeAllStepParents,
            excludeDistantRelatives: excludeAllDistantRelatives,
          );

          switch (type) {
            //parents
            case PlatonicRelationshipType.birthParent:
              expect(
                result,
                true,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.adoptiveParent:
              expect(
                result,
                true,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.stepParent:
              expect(
                result,
                false,
                reason: "Cause: $type",
              );
              break;

            //siblings
            case PlatonicRelationshipType.fullSibling:
              expect(
                result,
                true,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.halfSibling:
              expect(
                result,
                true,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.adoptiveSibling:
              expect(
                result,
                true,
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
                true,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.adoptiveChild:
              expect(
                result,
                true,
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
                true,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.stepGrandParent:
              expect(
                result,
                false,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.greatGrandParent:
              expect(
                result,
                true,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.stepGreatGrandParent:
              expect(
                result,
                false,
                reason: "Cause: $type",
              );
              break;

            case PlatonicRelationshipType.grandChild:
              expect(
                result,
                true,
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
                true,
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
                true,
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
                true,
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
                true,
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
                true,
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
                true,
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
                true,
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
                true,
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
                false,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.siblingInLaw:
              expect(
                result,
                false,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.stepSiblingInLaw:
              expect(
                result,
                false,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.childInLaw:
              expect(
                result,
                false,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.stepChildInLaw:
              expect(
                result,
                false,
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

    group(
        "Exclude all step parents = false, Exclude all distant relatives = false: ",
        () {
      test(
          "check that every platonic relationship type returns the correct value",
          () {
        for (var type in PlatonicRelationshipType.values) {
          //get result
          final bool result = checkIfFamilialPlatonicRelationshipType(
            platonicRelationshipType: type,
          );

          switch (type) {
            //parents
            case PlatonicRelationshipType.birthParent:
              expect(
                result,
                true,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.adoptiveParent:
              expect(
                result,
                true,
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
                true,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.halfSibling:
              expect(
                result,
                true,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.adoptiveSibling:
              expect(
                result,
                true,
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
                true,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.adoptiveChild:
              expect(
                result,
                true,
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
                true,
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
                true,
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
                true,
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
                true,
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
                true,
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
                true,
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
                true,
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
                true,
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
                true,
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
                true,
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
                true,
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
                true,
                reason: "Cause: $type",
              );
              break;

            //in laws
            case PlatonicRelationshipType.parentInLaw:
              expect(
                result,
                false,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.siblingInLaw:
              expect(
                result,
                false,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.stepSiblingInLaw:
              expect(
                result,
                false,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.childInLaw:
              expect(
                result,
                false,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.stepChildInLaw:
              expect(
                result,
                false,
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
  });
}
