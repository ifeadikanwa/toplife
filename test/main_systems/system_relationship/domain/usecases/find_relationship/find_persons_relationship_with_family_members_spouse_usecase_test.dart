import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/find_relationship/find_persons_relationship_with_family_members_spouse_usecase.dart';

void main() {
  group('Find persons relationship with family members spouse usecase:', () {
    test("every platonic relationship type returns the correct value", () {
      for (var type in PlatonicRelationshipType.values) {
        //get result
        final PlatonicRelationshipType? result =
            FindPersonsRelationshipWithFamilyMembersSpouseUsecase().execute(
          familyMemberPlatonicRelationshipTypes: [
            type,
          ],
        );

        switch (type) {
          //parents
          case PlatonicRelationshipType.birthParent:
            expect(
              result,
              PlatonicRelationshipType.stepParent,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.adoptiveParent:
            expect(
              result,
              PlatonicRelationshipType.stepParent,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepParent:
            expect(
              result,
              null,
              reason: "Cause: $type",
            );
            break;

          //siblings
          case PlatonicRelationshipType.fullSibling:
            expect(
              result,
              PlatonicRelationshipType.siblingInLaw,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.halfSibling:
            expect(
              result,
              PlatonicRelationshipType.siblingInLaw,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.adoptiveSibling:
            expect(
              result,
              PlatonicRelationshipType.siblingInLaw,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepSibling:
            expect(
              result,
              PlatonicRelationshipType.stepSiblingInLaw,
              reason: "Cause: $type",
            );
            break;

          //child
          case PlatonicRelationshipType.birthChild:
            expect(
              result,
              PlatonicRelationshipType.childInLaw,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.adoptiveChild:
            expect(
              result,
              PlatonicRelationshipType.childInLaw,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepChild:
            expect(
              result,
              PlatonicRelationshipType.stepChildInLaw,
              reason: "Cause: $type",
            );
            break;

          //relative
          case PlatonicRelationshipType.grandParent:
            expect(
              result,
              PlatonicRelationshipType.stepGrandParent,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepGrandParent:
            expect(
              result,
              null,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.greatGrandParent:
            expect(
              result,
              PlatonicRelationshipType.stepGreatGrandParent,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepGreatGrandParent:
            expect(
              result,
              null,
              reason: "Cause: $type",
            );
            break;

          case PlatonicRelationshipType.grandChild:
            expect(
              result,
              null,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepGrandChild:
            expect(
              result,
              null,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.greatGrandChild:
            expect(
              result,
              null,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepGreatGrandChild:
            expect(
              result,
              null,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.pibling:
            expect(
              result,
              null,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepPibling:
            expect(
              result,
              null,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.cousin:
            expect(
              result,
              null,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepCousin:
            expect(
              result,
              null,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.grandCousin:
            expect(
              result,
              null,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepGrandCousin:
            expect(
              result,
              null,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.greatGrandCousin:
            expect(
              result,
              null,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepGreatGrandCousin:
            expect(
              result,
              null,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.nibling:
            expect(
              result,
              null,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepNibling:
            expect(
              result,
              null,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.grandNibling:
            expect(
              result,
              null,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepGrandNibling:
            expect(
              result,
              null,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.greatGrandNibling:
            expect(
              result,
              null,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepGreatGrandNibling:
            expect(
              result,
              null,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.distantRelative:
            expect(
              result,
              null,
              reason: "Cause: $type",
            );
            break;

          //in laws
          case PlatonicRelationshipType.parentInLaw:
            expect(
              result,
              PlatonicRelationshipType.parentInLaw,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.siblingInLaw:
            expect(
              result,
              null,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepSiblingInLaw:
            expect(
              result,
              null,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.childInLaw:
            expect(
              result,
              null,
              reason: "Cause: $type",
            );
            break;
          case PlatonicRelationshipType.stepChildInLaw:
            expect(
              result,
              null,
              reason: "Cause: $type",
            );
            break;

          //friend
          case PlatonicRelationshipType.friend:
            expect(
              result,
              null,
              reason: "Cause: $type",
            );
            break;

          //acquaintance
          case PlatonicRelationshipType.acquaintance:
            expect(
              result,
              null,
              reason: "Cause: $type",
            );
            break;
        }
      }
    });
  });
}
