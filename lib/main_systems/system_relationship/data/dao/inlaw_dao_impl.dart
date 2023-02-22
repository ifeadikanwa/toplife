import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
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
    await into(inLawTable).insertOnConflictUpdate(inLaw);
    return inLaw;
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
    return update(inLawTable).replace(inLaw);
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
