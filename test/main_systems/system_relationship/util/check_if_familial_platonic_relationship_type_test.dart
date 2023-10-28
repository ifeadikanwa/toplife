import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/check_if_familial_platonic_relationship_type.dart';

void main() {
  group("checkIfFamilialPlatonicRelationshipType: ", () {
    test(
        "check that every platonic relationship type returns the correct value",
        () {
      for (var type in PlatonicRelationshipType.values) {
        switch (type) {
          //parents
          case PlatonicRelationshipType.birthParent:
            expect(
              checkIfFamilialPlatonicRelationshipType(type),
              true,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.adoptiveParent:
            expect(
              checkIfFamilialPlatonicRelationshipType(type),
              true,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepParent:
            expect(
              checkIfFamilialPlatonicRelationshipType(type),
              true,
              reason: "Cause: $type",
            );
            break;

          //siblings
          case PlatonicRelationshipType.fullSibling:
            expect(
              checkIfFamilialPlatonicRelationshipType(type),
              true,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.halfSibling:
            expect(
              checkIfFamilialPlatonicRelationshipType(type),
              true,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.adoptiveSibling:
            expect(
              checkIfFamilialPlatonicRelationshipType(type),
              true,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepSibling:
            expect(
              checkIfFamilialPlatonicRelationshipType(type),
              true,
              reason: "Cause: $type",
            );
            break;

          //child
          case PlatonicRelationshipType.birthChild:
            expect(
              checkIfFamilialPlatonicRelationshipType(type),
              true,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.adoptiveChild:
            expect(
              checkIfFamilialPlatonicRelationshipType(type),
              true,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepChild:
            expect(
              checkIfFamilialPlatonicRelationshipType(type),
              true,
              reason: "Cause: $type",
            );
            break;

          //relative
          case PlatonicRelationshipType.grandParent:
            expect(
              checkIfFamilialPlatonicRelationshipType(type),
              true,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepGrandParent:
            expect(
              checkIfFamilialPlatonicRelationshipType(type),
              true,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.greatGrandParent:
            expect(
              checkIfFamilialPlatonicRelationshipType(type),
              true,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepGreatGrandParent:
            expect(
              checkIfFamilialPlatonicRelationshipType(type),
              true,
              reason: "Cause: $type",
            );
            break;

          case PlatonicRelationshipType.grandChild:
            expect(
              checkIfFamilialPlatonicRelationshipType(type),
              true,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepGrandChild:
            expect(
              checkIfFamilialPlatonicRelationshipType(type),
              true,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.greatGrandChild:
            expect(
              checkIfFamilialPlatonicRelationshipType(type),
              true,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepGreatGrandChild:
            expect(
              checkIfFamilialPlatonicRelationshipType(type),
              true,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.pibling:
            expect(
              checkIfFamilialPlatonicRelationshipType(type),
              true,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepPibling:
            expect(
              checkIfFamilialPlatonicRelationshipType(type),
              true,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.cousin:
            expect(
              checkIfFamilialPlatonicRelationshipType(type),
              true,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepCousin:
            expect(
              checkIfFamilialPlatonicRelationshipType(type),
              true,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.grandCousin:
            expect(
              checkIfFamilialPlatonicRelationshipType(type),
              true,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepGrandCousin:
            expect(
              checkIfFamilialPlatonicRelationshipType(type),
              true,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.greatGrandCousin:
            expect(
              checkIfFamilialPlatonicRelationshipType(type),
              true,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepGreatGrandCousin:
            expect(
              checkIfFamilialPlatonicRelationshipType(type),
              true,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.nibling:
            expect(
              checkIfFamilialPlatonicRelationshipType(type),
              true,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepNibling:
            expect(
              checkIfFamilialPlatonicRelationshipType(type),
              true,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.grandNibling:
            expect(
              checkIfFamilialPlatonicRelationshipType(type),
              true,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepGrandNibling:
            expect(
              checkIfFamilialPlatonicRelationshipType(type),
              true,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.greatGrandNibling:
            expect(
              checkIfFamilialPlatonicRelationshipType(type),
              true,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepGreatGrandNibling:
            expect(
              checkIfFamilialPlatonicRelationshipType(type),
              true,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.distantRelative:
            expect(
              checkIfFamilialPlatonicRelationshipType(type),
              true,
              reason: "Cause: $type",
            );
            break;

          //in laws
          case PlatonicRelationshipType.parentInLaw:
            expect(
              checkIfFamilialPlatonicRelationshipType(type),
              false,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.siblingInLaw:
            expect(
              checkIfFamilialPlatonicRelationshipType(type),
              false,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepSiblingInLaw:
            expect(
              checkIfFamilialPlatonicRelationshipType(type),
              false,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.childInLaw:
            expect(
              checkIfFamilialPlatonicRelationshipType(type),
              false,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepChildInLaw:
            expect(
              checkIfFamilialPlatonicRelationshipType(type),
              false,
              reason: "Cause: $type",
            );
            break;

          //friend
          case PlatonicRelationshipType.friend:
            expect(
              checkIfFamilialPlatonicRelationshipType(type),
              false,
              reason: "Cause: $type",
            );
            break;

          //acquaintance
          case PlatonicRelationshipType.acquaintance:
            expect(
              checkIfFamilialPlatonicRelationshipType(type),
              false,
              reason: "Cause: $type",
            );
            break;
        }
      }
    });
  });
}
