import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/dao/graveyard_dao.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/graveyard.dart';

part 'graveyard_dao_impl.g.dart';

@DriftAccessor(tables: [GraveyardTable])
class GraveyardDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$GraveyardDaoImplMixin
    implements GraveyardDao {
  GraveyardDaoImpl(DatabaseProvider database) : super(database);

  @override
  Future<Graveyard> createGraveyard(Graveyard graveyard) async {
    await into(graveyardTable).insertOnConflictUpdate(graveyard);
    return graveyard;
  }

  @override
  Future<void> deleteGraveyard(int mainPersonID, int deadPersonID) {
    return (delete(graveyardTable)
          ..where(
            (graveyard) =>
                graveyard.mainPersonId.equals(mainPersonID) &
                graveyard.deadPersonId.equals(deadPersonID),
          ))
        .go();
  }

  @override
  Future<List<Graveyard>> getAllGraveyards(int mainPersonID) {
    return (select(graveyardTable)
          ..where(
            (graveyard) => graveyard.mainPersonId.equals(mainPersonID),
          ))
        .get();
  }

  @override
  Future<Graveyard?> getGraveyard(int mainPersonID, int deadPersonID) {
    return (select(graveyardTable)
          ..where(
            (graveyard) =>
                graveyard.mainPersonId.equals(mainPersonID) &
                graveyard.deadPersonId.equals(deadPersonID),
          )
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<void> updateGraveyard(Graveyard graveyard) {
    return update(graveyardTable).replace(graveyard);
  }

  @override
  Stream<Graveyard?> watchGraveyard(int mainPersonID, int deadPersonID) {
    return (select(graveyardTable)
          ..where(
            (graveyard) =>
                graveyard.mainPersonId.equals(mainPersonID) &
                graveyard.deadPersonId.equals(deadPersonID),
          )
          ..limit(1))
        .watchSingleOrNull();
  }

  @override
  Stream<List<Graveyard>> watchAllGraveyards(int mainPersonID) {
    return (select(graveyardTable)
          ..where(
            (graveyard) => graveyard.mainPersonId.equals(mainPersonID),
          ))
        .watch();
  }
}
