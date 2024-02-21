import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/dao/deplete_stats_flag_dao.dart';
import 'package:toplife/main_systems/system_person/domain/model/deplete_stats_flag.dart';

part 'deplete_stats_flag_dao_impl.g.dart';

@DriftAccessor(tables: [DepleteStatsFlagTable])
class DepleteStatsFlagDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$DepleteStatsFlagDaoImplMixin
    implements DepleteStatsFlagDao {
  DepleteStatsFlagDaoImpl(DatabaseProvider database) : super(database);

  @override
  Future<DepleteStatsFlag> createOrUpdateDepleteStatsFlag(
    DepleteStatsFlag depleteStatsFlag,
  ) async {
    //I use insert with a replace mode because insertOnConflictUpdate
    //does not recognize unique constraints that aren't primary keys.
    //This table has no primary key, only a UNIQUE column
    await into(depleteStatsFlagTable)
        .insert(depleteStatsFlag, mode: InsertMode.insertOrReplace);
    return depleteStatsFlag;
  }

  @override
  Future<void> deleteDepleteStatsFlag(int personID) {
    return (delete(depleteStatsFlagTable)
          ..where(
            (depleteStatsFlag) => depleteStatsFlag.personId.equals(personID),
          ))
        .go();
  }

  @override
  Future<DepleteStatsFlag?> getDepleteStatsFlag(int personID) {
    return (select(depleteStatsFlagTable)
          ..where(
              (depleteStatsFlag) => depleteStatsFlag.personId.equals(personID))
          ..limit(1))
        .getSingleOrNull();
  }
}
