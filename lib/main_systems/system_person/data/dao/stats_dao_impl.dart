import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/dao/stats_dao.dart';
import 'package:toplife/main_systems/system_person/domain/model/stats.dart';

part 'stats_dao_impl.g.dart';

@DriftAccessor(tables: [StatsTable])
class StatsDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$StatsDaoImplMixin
    implements StatsDao {
  StatsDaoImpl(DatabaseProvider database) : super(database);

  @override
  Future<Stats> createStats(Stats stats) async {
    final StatsTableCompanion statsWithoutID =
        stats.toCompanion(false).copyWith(
              id: const Value.absent(),
            );
    final statsID = await into(statsTable).insertOnConflictUpdate(
      statsWithoutID,
    );
    return stats.copyWith(id: statsID);
  }

  @override
  Future<void> deleteStats(int statsID) {
    return (delete(statsTable)
          ..where(
            (stats) => stats.id.equals(statsID),
          ))
        .go();
  }

  @override
  Future<Stats?> getStats(int personID) {
    return (select(statsTable)
          ..where((stats) => stats.personId.equals(personID))
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<void> updateStats(Stats stats) {
    return update(statsTable).replace(stats);
  }

  @override
  Stream<Stats?> watchStats(int personID) {
    return (select(statsTable)
          ..where((stats) => stats.personId.equals(personID))
          ..limit(1))
        .watchSingleOrNull();
  }
}
