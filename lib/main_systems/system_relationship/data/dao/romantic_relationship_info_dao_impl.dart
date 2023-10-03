import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/dao/romantic_relationship_info_dao.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/romantic_relationship_info.dart';

part 'romantic_relationship_info_dao_impl.g.dart';

@DriftAccessor(tables: [RomanticRelationshipInfoTable])
class RomanticRelationshipInfoDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$RomanticRelationshipInfoDaoImplMixin
    implements RomanticRelationshipInfoDao {
  RomanticRelationshipInfoDaoImpl(DatabaseProvider database) : super(database);

  @override
  Future<RomanticRelationshipInfo> createRomanticRelationshipInfo(
    RomanticRelationshipInfo romanticRelationshipInfo,
  ) async {
    final RomanticRelationshipInfoTableCompanion
        romanticRelationshipInfoWithoutID = romanticRelationshipInfo
            .toCompanion(false)
            .copyWith(id: const Value.absent());

    final int romanticRelationshipInfoID =
        await into(romanticRelationshipInfoTable)
            .insertOnConflictUpdate(romanticRelationshipInfoWithoutID);

    return romanticRelationshipInfo.copyWith(id: romanticRelationshipInfoID);
  }

  @override
  Future<void> deleteRomanticRelationshipInfo(
    int romanticRelationshipInfoID,
  ) {
    return (delete(romanticRelationshipInfoTable)
          ..where((romanticRelationshipInfo) =>
              romanticRelationshipInfo.id.equals(romanticRelationshipInfoID)))
        .go();
  }

  @override
  Future<RomanticRelationshipInfo?> getRomanticRelationshipInfo(
    int romanticRelationshipInfoID,
  ) {
    return (select(romanticRelationshipInfoTable)
          ..where(
            (romanticRelationshipInfo) =>
                romanticRelationshipInfo.id.equals(romanticRelationshipInfoID),
          )
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<void> updateRomanticRelationshipInfo(
    RomanticRelationshipInfo romanticRelationshipInfo,
  ) {
    return update(romanticRelationshipInfoTable)
        .replace(romanticRelationshipInfo);
  }
}
