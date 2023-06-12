import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/core/utils/stats/stats_range/stats_range_constants.dart';
import 'package:toplife/main_systems/system_relationship/constants/relative_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/dao/relative_dao.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/relative.dart';

part 'relative_dao_impl.g.dart';

@DriftAccessor(tables: [RelativeTable])
class RelativeDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$RelativeDaoImplMixin
    implements RelativeDao {
  RelativeDaoImpl(DatabaseProvider database) : super(database);

  @override
  Future<Relative> createRelative(Relative relative) async {
    final Relative checkedRelative = relative.copyWith(
      relationship: crossCheckStat(
        stat: relative.relationship,
        statsRange: StatsRangeConstants.relationshipRange,
      ),
    );

    await into(relativeTable).insertOnConflictUpdate(checkedRelative);
    return checkedRelative;
  }

  @override
  Future<void> deleteRelative(int mainPersonID, int relativeID) {
    return (delete(relativeTable)
          ..where(
            (relative) =>
                relative.mainPersonId.equals(mainPersonID) &
                relative.relativeId.equals(relativeID),
          ))
        .go();
  }

  @override
  Future<List<Relative>> getAllGrandchildren(int mainPersonID) {
    return (select(relativeTable)
          ..where(
            (relative) =>
                relative.mainPersonId.equals(mainPersonID) &
                relative.relativeRelationshipType
                    .equals(RelativeRelationshipType.grandchild.name),
          ))
        .get();
  }

  @override
  Future<List<Relative>> getAllNiblings(int mainPersonID) {
    return (select(relativeTable)
          ..where(
            (relative) =>
                relative.mainPersonId.equals(mainPersonID) &
                relative.relativeRelationshipType
                    .equals(RelativeRelationshipType.nibling.name),
          ))
        .get();
  }

  @override
  Future<List<Relative>> getAllPiblings(int mainPersonID) {
    return (select(relativeTable)
          ..where(
            (relative) =>
                relative.mainPersonId.equals(mainPersonID) &
                relative.relativeRelationshipType
                    .equals(RelativeRelationshipType.pibling.name),
          ))
        .get();
  }

  @override
  Future<List<Relative>> getAllRelatives(int mainPersonID) {
    return (select(relativeTable)
          ..where(
            (relative) => relative.mainPersonId.equals(mainPersonID),
          ))
        .get();
  }

  @override
  Future<Relative?> getRelative(int mainPersonID, int relativeID) {
    return (select(relativeTable)
          ..where(
            (relative) =>
                relative.mainPersonId.equals(mainPersonID) &
                relative.relativeId.equals(relativeID),
          )
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<void> updateRelative(Relative relative) {
    final Relative checkedRelative = relative.copyWith(
      relationship: crossCheckStat(
        stat: relative.relationship,
        statsRange: StatsRangeConstants.relationshipRange,
      ),
    );
    return update(relativeTable).replace(checkedRelative);
  }

  @override
  Stream<Relative?> watchRelative(int mainPersonID, int relativeID) {
    return (select(relativeTable)
          ..where(
            (relative) =>
                relative.mainPersonId.equals(mainPersonID) &
                relative.relativeId.equals(relativeID),
          )
          ..limit(1))
        .watchSingleOrNull();
  }

  @override
  Stream<List<Relative>> watchAllGrandchildren(int mainPersonID) {
    return (select(relativeTable)
          ..where(
            (relative) =>
                relative.mainPersonId.equals(mainPersonID) &
                relative.relativeRelationshipType
                    .equals(RelativeRelationshipType.grandchild.name),
          ))
        .watch();
  }

  @override
  Stream<List<Relative>> watchAllNiblings(int mainPersonID) {
    return (select(relativeTable)
          ..where(
            (relative) =>
                relative.mainPersonId.equals(mainPersonID) &
                relative.relativeRelationshipType
                    .equals(RelativeRelationshipType.nibling.name),
          ))
        .watch();
  }

  @override
  Stream<List<Relative>> watchAllPiblings(int mainPersonID) {
    return (select(relativeTable)
          ..where(
            (relative) =>
                relative.mainPersonId.equals(mainPersonID) &
                relative.relativeRelationshipType
                    .equals(RelativeRelationshipType.pibling.name),
          ))
        .watch();
  }

  @override
  Stream<List<Relative>> watchAllRelatives(int mainPersonID) {
    return (select(relativeTable)
          ..where(
            (relative) => relative.mainPersonId.equals(mainPersonID),
          ))
        .watch();
  }
}
