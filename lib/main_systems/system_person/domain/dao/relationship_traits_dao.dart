import 'package:toplife/main_systems/system_person/domain/model/relationship_traits.dart';

abstract class RelationshipTraitsDao {
  Future<RelationshipTraits> createRelationshipTraits(RelationshipTraits relationshipTraits);
  Future<RelationshipTraits?> getRelationshipTraits(int personID);
  Future<void> updateRelationshipTraits(RelationshipTraits relationshipTraits);
  Future<void> deleteRelationshipTraits(int relationshipTraitsID);
}