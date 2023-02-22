import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/dao/acquaintance_dao.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/acquaintance.dart';

part 'acquaintance_dao_impl.g.dart';

@DriftAccessor(tables: [AcquaintanceTable])
class AcquaintanceDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$AcquaintanceDaoImplMixin
    implements AcquaintanceDao {
  AcquaintanceDaoImpl(DatabaseProvider database) : super(database);

  @override
  Future<Acquaintance> createAcquaintance(Acquaintance acquaintance) async {
    await into(acquaintanceTable).insertOnConflictUpdate(acquaintance);
    return acquaintance;
  }

  @override
  Future<void> deleteAcquaintance(int mainPersonID, int acquaintanceID) {
    return (delete(acquaintanceTable)
          ..where(
            (acquaintance) =>
                acquaintance.mainPersonId.equals(mainPersonID) &
                acquaintance.acquaintanceId.equals(acquaintanceID),
          ))
        .go();
  }

  @override
  Future<Acquaintance?> getAcquaintance(int mainPersonID, int acquaintanceID) {
    return (select(acquaintanceTable)
          ..where(
            (acquaintance) =>
                acquaintance.mainPersonId.equals(mainPersonID) &
                acquaintance.acquaintanceId.equals(acquaintanceID),
          )
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<List<Acquaintance>> getAllAcquaintance(int mainPersonID) {
    return (select(acquaintanceTable)
          ..where(
            (acquaintance) => acquaintance.mainPersonId.equals(mainPersonID),
          ))
        .get();
  }

  @override
  Future<void> updateAcquaintance(Acquaintance acquaintance) {
    return update(acquaintanceTable).replace(acquaintance);
  }

  @override
  Stream<Acquaintance?> watchAcquaintance(
      int mainPersonID, int acquaintanceID) {
    return (select(acquaintanceTable)
          ..where(
            (acquaintance) =>
                acquaintance.mainPersonId.equals(mainPersonID) &
                acquaintance.acquaintanceId.equals(acquaintanceID),
          )
          ..limit(1))
        .watchSingleOrNull();
  }

  @override
  Stream<List<Acquaintance>> watchAllAcquaintance(int mainPersonID) {
    return (select(acquaintanceTable)
          ..where(
            (acquaintance) => acquaintance.mainPersonId.equals(mainPersonID),
          ))
        .watch();
  }
}
