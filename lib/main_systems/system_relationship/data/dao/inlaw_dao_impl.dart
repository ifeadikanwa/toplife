import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/main_systems/system_relationship/domain/dao/inlaw_dao.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/inlaw.dart';

part 'inlaw_dao_impl.g.dart';

@DriftAccessor(tables: [InLawTable])
class InLawDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$InLawDaoImplMixin
    implements InLawDao {
  InLawDaoImpl(DatabaseProvider database) : super(database);

  @override
  Future<InLaw> createInLaw(InLaw inLaw) async {
    final InLaw checkedInLaw = inLaw.copyWith(
      relationship: crossCheckStat(inLaw.relationship),
    );

    await into(inLawTable).insertOnConflictUpdate(checkedInLaw);
    return checkedInLaw;
  }

  @override
  Future<void> deleteInLaw(int mainPersonID, int inLawID) {
    return (delete(inLawTable)
          ..where(
            (inLaw) =>
                inLaw.mainPersonId.equals(mainPersonID) &
                inLaw.inLawId.equals(inLawID),
          ))
        .go();
  }

  @override
  Future<List<InLaw>> getAllInLaws(int mainPersonID) {
    return (select(inLawTable)
          ..where(
            (inLaw) => inLaw.mainPersonId.equals(mainPersonID),
          ))
        .get();
  }

  @override
  Future<InLaw?> getInLaw(int mainPersonID, int inLawID) {
    return (select(inLawTable)
          ..where(
            (inLaw) =>
                inLaw.mainPersonId.equals(mainPersonID) &
                inLaw.inLawId.equals(inLawID),
          )
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<void> updateInLaw(InLaw inLaw) {
    final InLaw checkedInLaw = inLaw.copyWith(
      relationship: crossCheckStat(inLaw.relationship),
    );

    return update(inLawTable).replace(checkedInLaw);
  }

  @override
  Stream<InLaw?> watchInLaw(int mainPersonID, int inLawID) {
    return (select(inLawTable)
          ..where(
            (inLaw) =>
                inLaw.mainPersonId.equals(mainPersonID) &
                inLaw.inLawId.equals(inLawID),
          )
          ..limit(1))
        .watchSingleOrNull();
  }

  @override
  Stream<List<InLaw>> watchAllInLaws(int mainPersonID) {
    return (select(inLawTable)
          ..where(
            (inLaw) => inLaw.mainPersonId.equals(mainPersonID),
          ))
        .watch();
  }
}
