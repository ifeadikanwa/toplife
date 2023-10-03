import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/dao/romantic_relationship_info_dao.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/romantic_relationship_info_repository.dart';

class RomanticRelationshipInfoRepositoryImpl
    implements RomanticRelationshipInfoRepository {
  final RomanticRelationshipInfoDao _romanticRelationshipInfoDao;

  const RomanticRelationshipInfoRepositoryImpl({
    required RomanticRelationshipInfoDao romanticRelationshipInfoDao,
  }) : _romanticRelationshipInfoDao = romanticRelationshipInfoDao;

  @override
  Future<RomanticRelationshipInfo> createRomanticRelationshipInfo(
      RomanticRelationshipInfo romanticRelationshipInfo) {
    return _romanticRelationshipInfoDao
        .createRomanticRelationshipInfo(romanticRelationshipInfo);
  }

  @override
  Future<void> updateRomanticRelationshipInfo(
      RomanticRelationshipInfo romanticRelationshipInfo) {
    return _romanticRelationshipInfoDao
        .updateRomanticRelationshipInfo(romanticRelationshipInfo);
  }

  @override
  Future<void> deleteRomanticRelationshipInfo(int romanticRelationshipInfoID) {
    return _romanticRelationshipInfoDao
        .deleteRomanticRelationshipInfo(romanticRelationshipInfoID);
  }

  @override
  Future<RomanticRelationshipInfo?> getRomanticRelationshipInfo(
      int romanticRelationshipInfoID) {
    return _romanticRelationshipInfoDao
        .getRomanticRelationshipInfo(romanticRelationshipInfoID);
  }
}
