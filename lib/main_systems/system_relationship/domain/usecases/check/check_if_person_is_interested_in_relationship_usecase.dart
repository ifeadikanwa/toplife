import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';

class CheckIfPersonIsInterestedInRelationshipUsecase {
  bool execute({
    required RelationshipPair relationshipPair,
  }) {
    //go over all relationship types
    //if it is a valid type cast
    //get the value for interestedInRelationship

    //child
    if (relationshipPair.relationship is Child) {
      final Child child = relationshipPair.relationship as Child;
      return child.interestedInRelationship;
    }

    //parent
    if (relationshipPair.relationship is Parent) {
      final Parent parent = relationshipPair.relationship as Parent;
      return parent.interestedInRelationship;
    }

    //sibling
    if (relationshipPair.relationship is Sibling) {
      final Sibling sibling = relationshipPair.relationship as Sibling;
      return sibling.interestedInRelationship;
    }

    //partner
    if (relationshipPair.relationship is Partner) {
      final Partner partner = relationshipPair.relationship as Partner;
      return partner.interestedInRelationship;
    }

    //relative
    if (relationshipPair.relationship is Relative) {
      final Relative relative = relationshipPair.relationship as Relative;
      return relative.interestedInRelationship;
    }

    //friend
    if (relationshipPair.relationship is Friend) {
      final Friend friend = relationshipPair.relationship as Friend;
      return friend.interestedInRelationship;
    }

    //inLaw
    if (relationshipPair.relationship is InLaw) {
      final InLaw inLaw = relationshipPair.relationship as InLaw;
      return inLaw.interestedInRelationship;
    }

    //acquaintance
    if (relationshipPair.relationship is Acquaintance) {
      final Acquaintance acquaintance =
          relationshipPair.relationship as Acquaintance;
      return acquaintance.interestedInRelationship;
    }

    //if it is not a valid relationship type, return false
    return false;
  }
}
