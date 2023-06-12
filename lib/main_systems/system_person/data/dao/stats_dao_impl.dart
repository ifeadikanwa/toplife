import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/core/utils/stats/stats_range/stats_range_constants.dart';
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
      energy: crossCheckStat(
        stat: stats.energy,
        statsRange: StatsRangeConstants.defaultRange,
      ),
      health: crossCheckStat(
        stat: stats.health,
        statsRange: StatsRangeConstants.defaultRange,
      ),
      mood: crossCheckStat(
        stat: stats.mood,
        statsRange: StatsRangeConstants.defaultRange,
      ),
      hunger: crossCheckStat(
        stat: stats.hunger,
        statsRange: StatsRangeConstants.defaultRange,
      ),
      sober: crossCheckStat(
        stat: stats.sober,
        statsRange: StatsRangeConstants.defaultRange,
      ),
      looks: crossCheckStat(
        stat: stats.looks,
        statsRange: StatsRangeConstants.defaultRange,
      ),
      athleticism: crossCheckStat(
        stat: stats.athleticism,
        statsRange: StatsRangeConstants.defaultRange,
      ),
      intellect: crossCheckStat(
        stat: stats.intellect,
        statsRange: StatsRangeConstants.defaultRange,
      ),
      alcoholTolerance: crossCheckStat(
        stat: stats.alcoholTolerance,
        statsRange: StatsRangeConstants.defaultRange,
      ),
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
      energy: crossCheckStat(
        stat: stats.energy,
        statsRange: StatsRangeConstants.defaultRange,
      ),
      health: crossCheckStat(
        stat: stats.health,
        statsRange: StatsRangeConstants.defaultRange,
      ),
      mood: crossCheckStat(
        stat: stats.mood,
        statsRange: StatsRangeConstants.defaultRange,
      ),
      hunger: crossCheckStat(
        stat: stats.hunger,
        statsRange: StatsRangeConstants.defaultRange,
      ),
      sober: crossCheckStat(
        stat: stats.sober,
        statsRange: StatsRangeConstants.defaultRange,
      ),
      looks: crossCheckStat(
        stat: stats.looks,
        statsRange: StatsRangeConstants.defaultRange,
      ),
      athleticism: crossCheckStat(
        stat: stats.athleticism,
        statsRange: StatsRangeConstants.defaultRange,
      ),
      intellect: crossCheckStat(
        stat: stats.intellect,
        statsRange: StatsRangeConstants.defaultRange,
      ),
      alcoholTolerance: crossCheckStat(
        stat: stats.alcoholTolerance,
        statsRange: StatsRangeConstants.defaultRange,
      ),
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
