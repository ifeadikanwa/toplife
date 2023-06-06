import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';
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
    final Stats checkedStats = stats.copyWith(
      energy: crossCheckStat(stats.energy),
      health: crossCheckStat(stats.health),
      mood: crossCheckStat(stats.mood),
      hunger: crossCheckStat(stats.hunger),
      sober: crossCheckStat(stats.sober),
      looks: crossCheckStat(stats.looks),
      athleticism: crossCheckStat(stats.athleticism),
      intellect: crossCheckStat(stats.intellect),
      alcoholTolerance: crossCheckStat(stats.alcoholTolerance),
    );

    final StatsTableCompanion statsWithoutID =
        checkedStats.toCompanion(false).copyWith(
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
    final Stats checkedStats = stats.copyWith(
      energy: crossCheckStat(stats.energy),
      health: crossCheckStat(stats.health),
      mood: crossCheckStat(stats.mood),
      hunger: crossCheckStat(stats.hunger),
      sober: crossCheckStat(stats.sober),
      looks: crossCheckStat(stats.looks),
      athleticism: crossCheckStat(stats.athleticism),
      intellect: crossCheckStat(stats.intellect),
      alcoholTolerance: crossCheckStat(stats.alcoholTolerance),
    );

    return update(statsTable).replace(checkedStats);
  }

  @override
  Stream<Stats?> watchStats(int personID) {
    return (select(statsTable)
          ..where((stats) => stats.personId.equals(personID))
          ..limit(1))
        .watchSingleOrNull();
  }
}
