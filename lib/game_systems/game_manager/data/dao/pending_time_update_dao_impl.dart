import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/game_manager/domain/dao/pending_time_update_dao.dart';
import 'package:toplife/game_systems/game_manager/domain/model/pending_time_update.dart';

part 'pending_time_update_dao_impl.g.dart';

@DriftAccessor(tables: [PendingTimeUpdateTable])
class PendingTimeUpdateDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$PendingTimeUpdateDaoImplMixin
    implements PendingTimeUpdateDao {
  PendingTimeUpdateDaoImpl(super.database);

  @override
  Future<PendingTimeUpdate> createOrUpdatePendingTimeUpdate(
    PendingTimeUpdate pendingTimeUpdate,
  ) async {
    //I use insert with a replace mode because insertOnConflictUpdate
    //does not recognize unique constraints that aren't primary keys.
    //This table has no primary key, only a UNIQUE column

    await into(pendingTimeUpdateTable)
        .insert(pendingTimeUpdate, mode: InsertMode.insertOrReplace);
    return pendingTimeUpdate;
  }

  @override
  Future<void> deletePendingTimeUpdate(int gameId) {
    return (delete(pendingTimeUpdateTable)
          ..where(
              (pendingTimeUpdate) => pendingTimeUpdate.gameId.equals(gameId)))
        .go();
  }

  @override
  Future<PendingTimeUpdate?> getPendingTimeUpdate(int gameId) {
    return (select(pendingTimeUpdateTable)
          ..where(
              (pendingTimeUpdate) => pendingTimeUpdate.gameId.equals(gameId)))
        .getSingleOrNull();
  }

  @override
  Future<List<PendingTimeUpdate>> getAllPendingTimeUpdates() {
    return select(pendingTimeUpdateTable).get();
  }
}
