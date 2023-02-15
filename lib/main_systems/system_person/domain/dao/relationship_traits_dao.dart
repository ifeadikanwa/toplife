import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class RelationshipTraitsDao {
  Future<RelationshipTraits> createRelationshipTraits(RelationshipTraits relationshipTraits);
  Future<RelationshipTraits?> getRelationshipTraits(int personID);
  Future<void> updateRelationshipTraits(RelationshipTraits relationshipTraits);
  Future<void> deleteRelationshipTraits(int relationshipTraitsID);
}