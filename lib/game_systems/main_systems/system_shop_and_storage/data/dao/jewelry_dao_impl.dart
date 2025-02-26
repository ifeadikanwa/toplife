import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/core/utils/stats/stats_range/stats_range_constants.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/dao/jewelry_dao.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/model/jewelry.dart';

part 'jewelry_dao_impl.g.dart';

@DriftAccessor(tables: [JewelryTable])
class JewelryDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$JewelryDaoImplMixin
    implements JewelryDao {
  JewelryDaoImpl(super.database);

  @override
  Future<Jewelry> createJewelry(Jewelry jewelry) async {
    final Jewelry checkedJewelry = jewelry.copyWith(
      maxConditionAtPurchase: crossCheckStat(
        stat: jewelry.maxConditionAtPurchase,
        statsRange: StatsRangeConstants.defaultRange,
      ),
    );
    final JewelryTableCompanion jewelryWithoutID =
        checkedJewelry.toCompanion(false).copyWith(id: const Value.absent());

    final jewelryID =
        await into(jewelryTable).insertOnConflictUpdate(jewelryWithoutID);
    return checkedJewelry.copyWith(id: jewelryID);
  }

  @override
  Future<void> deleteJewelry(int jewelryID) {
    return (delete(jewelryTable)
          ..where((jewelry) => jewelry.id.equals(jewelryID)))
        .go();
  }

  @override
  Future<List<Jewelry>> getAllJewelry(int personID) {
    return (select(jewelryTable)
          ..where(
            (jewelry) => jewelry.personId.equals(personID),
          ))
        .get();
  }

  @override
  Future<Jewelry?> getJewelry(int jewelryID) {
    return (select(jewelryTable)
          ..where((jewelry) => jewelry.id.equals(jewelryID))
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<void> updateJewelry(Jewelry jewelry) {
    final Jewelry checkedJewelry = jewelry.copyWith(
      maxConditionAtPurchase: crossCheckStat(
        stat: jewelry.maxConditionAtPurchase,
        statsRange: StatsRangeConstants.defaultRange,
      ),
    );

    return update(jewelryTable).replace(checkedJewelry);
  }

  @override
  Stream<List<Jewelry>> watchAllJewelry(int personID) {
    return (select(jewelryTable)
          ..where(
            (jewelry) => jewelry.personId.equals(personID),
          ))
        .watch();
  }

  @override
  Stream<Jewelry?> watchJewelry(int jewelryID) {
    return (select(jewelryTable)
          ..where((jewelry) => jewelry.id.equals(jewelryID))
          ..limit(1))
        .watchSingleOrNull();
  }
}
