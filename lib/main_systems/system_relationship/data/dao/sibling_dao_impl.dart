import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/core/utils/stats/stats_range/stats_range_constants.dart';
import 'package:toplife/main_systems/system_relationship/domain/dao/sibling_dao.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/sibling.dart';

part 'sibling_dao_impl.g.dart';

@DriftAccessor(tables: [SiblingTable])
class SiblingDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$SiblingDaoImplMixin
    implements SiblingDao {
  SiblingDaoImpl(DatabaseProvider database) : super(database);

  @override
  Future<Sibling> createSibling(Sibling sibling) async {
    final Sibling checkedSibling = sibling.copyWith(
      relationship: crossCheckStat(
        stat: sibling.relationship,
        statsRange: StatsRangeConstants.relationshipRange,
      ),
    );

    await into(siblingTable).insertOnConflictUpdate(checkedSibling);
    return checkedSibling;
  }

  @override
  Future<void> deleteSibling(int mainPersonID, int siblingID) {
    return (delete(siblingTable)
          ..where(
            (sibling) =>
                sibling.mainPersonId.equals(mainPersonID) &
                sibling.siblingId.equals(siblingID),
          ))
        .go();
  }

  @override
  Future<List<Sibling>> getAllSiblings(int mainPersonID) {
    return (select(siblingTable)
          ..where(
            (sibling) => sibling.mainPersonId.equals(mainPersonID),
          ))
        .get();
  }

  @override
  Future<Sibling?> getSibling(int mainPersonID, int siblingID) {
    return (select(siblingTable)
          ..where(
            (sibling) =>
                sibling.mainPersonId.equals(mainPersonID) &
                sibling.siblingId.equals(siblingID),
          )
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<void> updateSibling(Sibling sibling) {
    final Sibling checkedSibling = sibling.copyWith(
      relationship: crossCheckStat(
        stat: sibling.relationship,
        statsRange: StatsRangeConstants.relationshipRange,
      ),
    );
    return update(siblingTable).replace(checkedSibling);
  }

  @override
  Stream<Sibling?> watchSibling(int mainPersonID, int siblingID) {
    return (select(siblingTable)
          ..where(
            (sibling) =>
                sibling.mainPersonId.equals(mainPersonID) &
                sibling.siblingId.equals(siblingID),
          )
          ..limit(1))
        .watchSingleOrNull();
  }

  @override
  Stream<List<Sibling>> watchAllSiblings(int mainPersonID) {
    return (select(siblingTable)
          ..where(
            (sibling) => sibling.mainPersonId.equals(mainPersonID),
          ))
        .watch();
  }
}
