import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/dao/grave_dao.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/grave.dart';

part 'grave_dao_impl.g.dart';

@DriftAccessor(tables: [GraveTable])
class GraveDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$GraveDaoImplMixin
    implements GraveDao {
  GraveDaoImpl(DatabaseProvider database) : super(database);

  @override
  Future<Grave> createGrave(Grave grave) async {
    await into(graveTable).insertOnConflictUpdate(grave);
    return grave;
  }

  @override
  Future<void> deleteGrave(int mainPersonID, int deadPersonID) {
    return (delete(graveTable)
          ..where(
            (grave) =>
                grave.mainPersonId.equals(mainPersonID) &
                grave.deadPersonId.equals(deadPersonID),
          ))
        .go();
  }

  @override
  Future<List<Grave>> getAllGraves(int mainPersonID) {
    return (select(graveTable)
          ..where(
            (grave) => grave.mainPersonId.equals(mainPersonID),
          ))
        .get();
  }

  @override
  Future<Grave?> getGrave(int mainPersonID, int deadPersonID) {
    return (select(graveTable)
          ..where(
            (grave) =>
                grave.mainPersonId.equals(mainPersonID) &
                grave.deadPersonId.equals(deadPersonID),
          )
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<void> updateGrave(Grave grave) {
    return update(graveTable).replace(grave);
  }

  @override
  Stream<Grave?> watchGrave(int mainPersonID, int deadPersonID) {
    return (select(graveTable)
          ..where(
            (grave) =>
                grave.mainPersonId.equals(mainPersonID) &
                grave.deadPersonId.equals(deadPersonID),
          )
          ..limit(1))
        .watchSingleOrNull();
  }

  @override
  Stream<List<Grave>> watchAllGraves(int mainPersonID) {
    return (select(graveTable)
          ..where(
            (grave) => grave.mainPersonId.equals(mainPersonID),
          ))
        .watch();
  }
}
