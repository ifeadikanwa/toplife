import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/dao/current_home_dao.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/current_home.dart';

part 'current_home_dao_impl.g.dart';

@DriftAccessor(tables: [CurrentHomeTable])
class CurrentHomeDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$CurrentHomeDaoImplMixin
    implements CurrentHomeDao {
  CurrentHomeDaoImpl(DatabaseProvider database) : super(database);

  @override
  Future<CurrentHome> createCurrentHome(CurrentHome currentHome) async {
    //I use insert with a replace mode because insertOnConflictUpdate
    //does not recognize unique contraints that aren't primary keys.
    //This table has no primary key, only a UNIQUE column
    await into(currentHomeTable)
        .insert(currentHome, mode: InsertMode.insertOrReplace);
    return currentHome;
  }

  @override
  Future<void> deleteCurrentHome(int personID) {
    return (delete(currentHomeTable)
          ..where((currentHome) => currentHome.personId.equals(personID)))
        .go();
  }

  @override
  Future<List<CurrentHome>> getAllPeopleInAHouse(int houseID) {
    return (select(currentHomeTable)
          ..where(
            (currentHome) => currentHome.houseId.equals(houseID),
          ))
        .get();
  }

  @override
  Future<CurrentHome?> getCurrentHome(int personID) {
    return (select(currentHomeTable)
          ..where((currentHome) => currentHome.personId.equals(personID))
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<void> updateCurrentHome(CurrentHome currentHome) {
    //I can't use replace method because there is no primary key
    return (update(currentHomeTable)
          ..where((dbCurrentHome) =>
              dbCurrentHome.personId.equals(currentHome.personId)))
        .write(currentHome);
  }

  @override
  Stream<List<CurrentHome>> watchAllPeopleInAHouse(int houseID) {
    return (select(currentHomeTable)
          ..where(
            (currentHome) => currentHome.houseId.equals(houseID),
          ))
        .watch();
  }

  @override
  Stream<CurrentHome?> watchCurrentHome(int personID) {
    return (select(currentHomeTable)
          ..where((currentHome) => currentHome.personId.equals(personID))
          ..limit(1))
        .watchSingleOrNull();
  }
}
