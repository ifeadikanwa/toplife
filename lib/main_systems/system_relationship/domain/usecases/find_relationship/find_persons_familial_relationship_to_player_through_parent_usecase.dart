import 'package:toplife/main_systems/system_person/domain/model/info_models/person_platonic_relationship_type_pair.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/platonic_relationship_type_with_parent_type_indicator.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_siblings_through_deduction_usecase.dart';

class FindPersonsFamilialRelationshipToPlayerThroughParentUsecase {
  final GetSiblingsThroughDeductionUsecase _getSiblingsThroughDeductionUsecase;

  const FindPersonsFamilialRelationshipToPlayerThroughParentUsecase(
    this._getSiblingsThroughDeductionUsecase,
  );

  Future<PlatonicRelationshipType?> execute({
    required PlatonicRelationshipTypeWithParentTypeIndicator
        parentRelationshipToPlayer,
    required int childPersonID,
    required int playerPersonID,
  }) async {
    late final PlatonicRelationshipType? relationshipTypeToChild;

    switch (parentRelationshipToPlayer.platonicRelationshipType) {
      //Parent
      case PlatonicRelationshipType.birthParent:
      case PlatonicRelationshipType.adoptiveParent:
      case PlatonicRelationshipType.stepParent:
        //child = sibling
        //since there is some nuance to figuring out type of a sibling, we'll rely on our deduction function here
        final List<PersonPlatonicRelationshipTypePair> playerSiblings =
            await _getSiblingsThroughDeductionUsecase.execute(
          personID: playerPersonID,
          onlyLivingPeople: false,
        );

        relationshipTypeToChild = playerSiblings
            .where((element) => element.person.id == childPersonID)
            .firstOrNull
            ?.platonicRelationshipType;

        break;

      //Grandparent
      case PlatonicRelationshipType.grandParent:
      case PlatonicRelationshipType.stepGrandParent:
        //if the parent is a step parent or it is a step grandparent = step pibling
        //else = pibling
        if (parentRelationshipToPlayer.isStepParent ||
            parentRelationshipToPlayer.platonicRelationshipType ==
                PlatonicRelationshipType.stepGrandParent) {
          relationshipTypeToChild = PlatonicRelationshipType.stepPibling;
        } else {
          relationshipTypeToChild = PlatonicRelationshipType.pibling;
        }

        break;

      //Great grandparent
      case PlatonicRelationshipType.greatGrandParent:
      case PlatonicRelationshipType.stepGreatGrandParent:
        //This is in outside territory, so add them as distant relatives
        relationshipTypeToChild = PlatonicRelationshipType.distantRelative;

        break;

      //Child
      case PlatonicRelationshipType.birthChild:
      case PlatonicRelationshipType.adoptiveChild:
      case PlatonicRelationshipType.stepChild:
        //if the parent is a step parent or it is a step child = step grandchild
        //else = grandchild
        if (parentRelationshipToPlayer.isStepParent ||
            parentRelationshipToPlayer.platonicRelationshipType ==
                PlatonicRelationshipType.stepChild) {
          relationshipTypeToChild = PlatonicRelationshipType.stepGrandChild;
        } else {
          relationshipTypeToChild = PlatonicRelationshipType.grandChild;
        }

        break;

      //Grandchild
      case PlatonicRelationshipType.grandChild:
      case PlatonicRelationshipType.stepGrandChild:
        //if the parent is a step parent or it is a step grandchild = step great grandchild
        //else = great grandchild
        if (parentRelationshipToPlayer.isStepParent ||
            parentRelationshipToPlayer.platonicRelationshipType ==
                PlatonicRelationshipType.stepGrandChild) {
          relationshipTypeToChild =
              PlatonicRelationshipType.stepGreatGrandChild;
        } else {
          relationshipTypeToChild = PlatonicRelationshipType.greatGrandChild;
        }

        break;

      //GreatGrandchild
      case PlatonicRelationshipType.greatGrandChild:
      case PlatonicRelationshipType.stepGreatGrandChild:
        //Nobody should live long enogh to see their great-great-grandchild but if it happens just add it as distant relative
        relationshipTypeToChild = PlatonicRelationshipType.distantRelative;

        break;

      //Siblings
      case PlatonicRelationshipType.fullSibling:
      case PlatonicRelationshipType.halfSibling:
      case PlatonicRelationshipType.adoptiveSibling:
      case PlatonicRelationshipType.stepSibling:
        //if the parent is a step parent or it is a step sibling = step nibling
        //else = nibling
        if (parentRelationshipToPlayer.isStepParent ||
            parentRelationshipToPlayer.platonicRelationshipType ==
                PlatonicRelationshipType.stepSibling) {
          relationshipTypeToChild = PlatonicRelationshipType.stepNibling;
        } else {
          relationshipTypeToChild = PlatonicRelationshipType.nibling;
        }

        break;

      //Nibling
      case PlatonicRelationshipType.nibling:
      case PlatonicRelationshipType.stepNibling:
        //if the parent is a step parent or it is a step nibling = step grandNibling
        //else = grandNibling
        if (parentRelationshipToPlayer.isStepParent ||
            parentRelationshipToPlayer.platonicRelationshipType ==
                PlatonicRelationshipType.stepNibling) {
          relationshipTypeToChild = PlatonicRelationshipType.stepGrandNibling;
        } else {
          relationshipTypeToChild = PlatonicRelationshipType.grandNibling;
        }

        break;

      //GrandNibling
      case PlatonicRelationshipType.grandNibling:
      case PlatonicRelationshipType.stepGrandNibling:
        //if the parent is a step parent or it is a step grandnibling = step greatgrandNibling
        //else = greatgrandNibling
        if (parentRelationshipToPlayer.isStepParent ||
            parentRelationshipToPlayer.platonicRelationshipType ==
                PlatonicRelationshipType.stepGrandNibling) {
          relationshipTypeToChild =
              PlatonicRelationshipType.stepGreatGrandNibling;
        } else {
          relationshipTypeToChild = PlatonicRelationshipType.greatGrandNibling;
        }

        break;

      //GreatGrandNibling
      case PlatonicRelationshipType.greatGrandNibling:
      case PlatonicRelationshipType.stepGreatGrandNibling:
        //This is in outside territory, so add them as distant relatives
        relationshipTypeToChild = PlatonicRelationshipType.distantRelative;

        break;

      //piblings
      case PlatonicRelationshipType.pibling:
      case PlatonicRelationshipType.stepPibling:
        //if the parent is a step parent or it is a step pibling = step cousin
        //else = cousin
        if (parentRelationshipToPlayer.isStepParent ||
            parentRelationshipToPlayer.platonicRelationshipType ==
                PlatonicRelationshipType.stepPibling) {
          relationshipTypeToChild = PlatonicRelationshipType.stepCousin;
        } else {
          relationshipTypeToChild = PlatonicRelationshipType.cousin;
        }

        break;

      //cousin
      case PlatonicRelationshipType.cousin:
      case PlatonicRelationshipType.stepCousin:
        //if the parent is a step parent or it is a step cousin = step grandcousin
        //else = grandcousin
        if (parentRelationshipToPlayer.isStepParent ||
            parentRelationshipToPlayer.platonicRelationshipType ==
                PlatonicRelationshipType.stepCousin) {
          relationshipTypeToChild = PlatonicRelationshipType.stepGrandCousin;
        } else {
          relationshipTypeToChild = PlatonicRelationshipType.grandCousin;
        }

        break;

      //grandcousin
      case PlatonicRelationshipType.grandCousin:
      case PlatonicRelationshipType.stepGrandCousin:
        //if the parent is a step parent or it is a step grandcousin = step greatgrandcousin
        //else = greatgrandcousin
        if (parentRelationshipToPlayer.isStepParent ||
            parentRelationshipToPlayer.platonicRelationshipType ==
                PlatonicRelationshipType.stepGrandCousin) {
          relationshipTypeToChild =
              PlatonicRelationshipType.stepGreatGrandCousin;
        } else {
          relationshipTypeToChild = PlatonicRelationshipType.greatGrandCousin;
        }

        break;

      //greatgrandcousin
      case PlatonicRelationshipType.greatGrandCousin:
      case PlatonicRelationshipType.stepGreatGrandCousin:
        //This is in outside territory, so add them as distant relatives
        relationshipTypeToChild = PlatonicRelationshipType.distantRelative;

        break;

      //distant relative
      case PlatonicRelationshipType.distantRelative:
        //This is in outside territory, so add them as distant relatives
        relationshipTypeToChild = PlatonicRelationshipType.distantRelative;

        break;

      //parent in law
      case PlatonicRelationshipType.parentInLaw:
        //child = sibling in law
        relationshipTypeToChild = PlatonicRelationshipType.siblingInLaw;

        break;

      //child in law
      case PlatonicRelationshipType.childInLaw:
      case PlatonicRelationshipType.stepChildInLaw:
        //doesnt get recognised here, it will get recognised through player child.
        relationshipTypeToChild = null;

        break;

      //sibling in law
      case PlatonicRelationshipType.siblingInLaw:
      case PlatonicRelationshipType.stepSiblingInLaw:
        //doesnt get recognised here,
        //if it is your siblings child, it will get recognised through your sibling
        //if it your spouse siblings child, it shouldnt be added
        relationshipTypeToChild = null;

        break;

      //friend
      case PlatonicRelationshipType.friend:
        //no family relations
        relationshipTypeToChild = null;

        break;

      //acquaintance
      case PlatonicRelationshipType.acquaintance:
        //no family relations
        relationshipTypeToChild = null;

        break;
    }

    return relationshipTypeToChild;
  }
}
