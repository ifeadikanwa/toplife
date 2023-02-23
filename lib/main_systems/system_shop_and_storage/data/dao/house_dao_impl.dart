import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/dao/house_dao.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/house.dart';

part 'house_dao_impl.g.dart';

@DriftAccessor(tables: [HouseTable])
class HouseDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$HouseDaoImplMixin
    implements HouseDao {
  HouseDaoImpl(DatabaseProvider database) : super(database);

  @override
  Future<House> createHouse(House house) async {
    final HouseTableCompanion houseWithoutID =
        house.toCompanion(false).copyWith(id: const Value.absent());

    final houseID =
        await into(houseTable).insertOnConflictUpdate(houseWithoutID);
    return house.copyWith(id: houseID);
  }

  @override
  Future<void> deleteHouse(int houseID) {
    return (delete(houseTable)..where((house) => house.id.equals(houseID)))
        .go();
  }

  @override
  Future<List<House>> getAllCurrentHouses(int personID) {
    return (select(houseTable)
          ..where(
            (house) =>
                house.personId.equals(personID) &
                house.isCurrentHome.equals(true),
          ))
        .get();
  }

  @override
  Future<List<House>> getAllHouses(int personID) {
    return (select(houseTable)
          ..where(
            (house) => house.personId.equals(personID),
          ))
        .get();
  }

  @override
  Future<House?> getCurrentHouse(int personID) {
    return (select(houseTable)
          ..where(
            (house) =>
                house.personId.equals(personID) &
                house.isCurrentHome.equals(true),
          )
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<House?> getHouse(int houseID) {
    return (select(houseTable)
          ..where((house) => house.id.equals(houseID))
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<void> updateHouse(House house) {
    return update(houseTable).replace(house);
  }

  @override
  Stream<List<House>> watchAllHouses(int personID) {
    return (select(houseTable)
          ..where(
            (house) => house.personId.equals(personID),
          ))
        .watch();
  }

  @override
  Stream<House?> watchHouse(int houseID) {
    return (select(houseTable)
          ..where((house) => house.id.equals(houseID))
          ..limit(1))
        .watchSingleOrNull();
  }
}
