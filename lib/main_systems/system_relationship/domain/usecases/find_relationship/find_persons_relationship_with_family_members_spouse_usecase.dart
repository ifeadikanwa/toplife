import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';

class FindPersonsRelationshipWithFamilyMembersSpouseUsecase {
  //even though we take in a list of relationships, we only return one because spouse can only have one.
  //the relationships types that have their spouses recognized can never co-exist so we never end up with multiple.
  //example, your birth parent cannot also be your sister because blood related family cannot procreate
  PlatonicRelationshipType? execute({
    required List<PlatonicRelationshipType>
        familyMemberPlatonicRelationshipTypes,
  }) {
    //parent -> step parent
    if (familyMemberPlatonicRelationshipTypes
            .contains(PlatonicRelationshipType.birthParent) |
        familyMemberPlatonicRelationshipTypes
            .contains(PlatonicRelationshipType.adoptiveParent)) {
      return PlatonicRelationshipType.stepParent;
    }

    //half, full or adoptive sibling -> sibling in law
    else if (familyMemberPlatonicRelationshipTypes
            .contains(PlatonicRelationshipType.fullSibling) |
        familyMemberPlatonicRelationshipTypes
            .contains(PlatonicRelationshipType.halfSibling) |
        familyMemberPlatonicRelationshipTypes
            .contains(PlatonicRelationshipType.adoptiveSibling)) {
      return PlatonicRelationshipType.siblingInLaw;
    }

    //step sibling -> step sibling in law
    else if (familyMemberPlatonicRelationshipTypes
        .contains(PlatonicRelationshipType.stepSibling)) {
      return PlatonicRelationshipType.stepSiblingInLaw;
    }

    //birth or adoptive child ->  child in law
    else if (familyMemberPlatonicRelationshipTypes
            .contains(PlatonicRelationshipType.birthChild) |
        familyMemberPlatonicRelationshipTypes
            .contains(PlatonicRelationshipType.adoptiveChild)) {
      return PlatonicRelationshipType.childInLaw;
    }

    //step child -> step child in law
    else if (familyMemberPlatonicRelationshipTypes
        .contains(PlatonicRelationshipType.stepChild)) {
      return PlatonicRelationshipType.stepChildInLaw;
    }

    //grandparent -> step grandparent
    else if (familyMemberPlatonicRelationshipTypes
        .contains(PlatonicRelationshipType.grandParent)) {
      return PlatonicRelationshipType.stepGrandParent;
    }

    //greatgrandparent -> step greatgrandparent
    else if (familyMemberPlatonicRelationshipTypes
        .contains(PlatonicRelationshipType.greatGrandParent)) {
      return PlatonicRelationshipType.stepGreatGrandParent;
    }

    //parentinlaw -> parentinlaw
    else if (familyMemberPlatonicRelationshipTypes
        .contains(PlatonicRelationshipType.parentInLaw)) {
      return PlatonicRelationshipType.parentInLaw;
    }

    //if none of the above
    return null;
  }
}
