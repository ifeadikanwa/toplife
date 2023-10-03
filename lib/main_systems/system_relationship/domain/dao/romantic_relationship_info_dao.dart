import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class RomanticRelationshipInfoDao {
  Future<RomanticRelationshipInfo> createRomanticRelationshipInfo(
      RomanticRelationshipInfo romanticRelationshipInfo);

  Future<void> updateRomanticRelationshipInfo(
      RomanticRelationshipInfo romanticRelationshipInfo);

  Future<RomanticRelationshipInfo?> getRomanticRelationshipInfo(
      int romanticRelationshipInfoID);

  Future<void> deleteRomanticRelationshipInfo(int romanticRelationshipInfoID);
}
