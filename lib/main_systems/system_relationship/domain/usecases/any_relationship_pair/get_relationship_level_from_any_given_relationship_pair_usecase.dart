import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';

class GetRelationshipLevelFromAnyGivenRelationshipPairUsecase {
  int? execute({required RelationshipPair relationshipPair}) {
    
    switch (relationshipPair.informalRelationshipType) {
      case InformalRelationshipType.acquaintance:
        final relationshipObject = relationshipPair.relationship;
        if (relationshipObject is Acquaintance) {
          return relationshipObject.relationship;
        }
        break;

      case InformalRelationshipType.child:
        final relationshipObject = relationshipPair.relationship;
        if (relationshipObject is Child) {
          return relationshipObject.relationship;
        }
        break;

      case InformalRelationshipType.friend:
        final relationshipObject = relationshipPair.relationship;
        if (relationshipObject is Friend) {
          return relationshipObject.relationship;
        }
        break;

      case InformalRelationshipType.grave:
        //has no relationship leve
        return null;

      case InformalRelationshipType.inLaw:
        final relationshipObject = relationshipPair.relationship;
        if (relationshipObject is InLaw) {
          return relationshipObject.relationship;
        }
        break;

      case InformalRelationshipType.parent:
        final relationshipObject = relationshipPair.relationship;
        if (relationshipObject is Parent) {
          return relationshipObject.relationship;
        }
        break;

      case InformalRelationshipType.partner:
        final relationshipObject = relationshipPair.relationship;
        if (relationshipObject is Partner) {
          return relationshipObject.relationship;
        }
        break;

      case InformalRelationshipType.relative:
        final relationshipObject = relationshipPair.relationship;
        if (relationshipObject is Relative) {
          return relationshipObject.relationship;
        }
        break;

      case InformalRelationshipType.sibling:
        final relationshipObject = relationshipPair.relationship;
        if (relationshipObject is Sibling) {
          return relationshipObject.relationship;
        }
        break;
    }

    return null;
  }
}
