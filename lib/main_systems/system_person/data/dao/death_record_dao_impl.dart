import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/dao/death_record_dao.dart';
import 'package:toplife/main_systems/system_person/domain/model/death_record.dart';

part 'death_record_dao_impl.g.dart';

@DriftAccessor(tables: [DeathRecordTable])
class DeathRecordDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$DeathRecordDaoImplMixin
    implements DeathRecordDao {
  DeathRecordDaoImpl(DatabaseProvider database) : super(database);

  @override
  Future<DeathRecord> createOrUpdateDeathRecord(
    DeathRecord deathRecord,
  ) async {
    await into(deathRecordTable).insertOnConflictUpdate(deathRecord);
    return deathRecord;
  }

  @override
  Future<void> deleteDeathRecord(int gameID, int personID) {
    return (delete(deathRecordTable)
          ..where(
            (deathRecord) =>
                deathRecord.gameId.equals(gameID) &
                deathRecord.personId.equals(personID),
          ))
        .go();
  }

  @override
  Future<DeathRecord?> getDeathRecord(int gameID, int personID) {
    return (select(deathRecordTable)
          ..where(
            (deathRecord) =>
                deathRecord.gameId.equals(gameID) &
                deathRecord.personId.equals(personID),
          )
          ..limit(1))
        .getSingleOrNull();
  }
}
