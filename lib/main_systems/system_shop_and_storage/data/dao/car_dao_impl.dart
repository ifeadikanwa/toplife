import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/dao/car_dao.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/car.dart';

part 'car_dao_impl.g.dart';

@DriftAccessor(tables: [CarTable])
class CarDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$CarDaoImplMixin
    implements CarDao {
  CarDaoImpl(DatabaseProvider database) : super(database);

  @override
  Future<Car> createCar(Car car) async {
    final CarTableCompanion carWithoutID =
        car.toCompanion(false).copyWith(id: const Value.absent());

    final carID = await into(carTable).insertOnConflictUpdate(carWithoutID);
    return car.copyWith(id: carID);
  }

  @override
  Future<void> deleteCar(int carID) {
    return (delete(carTable)..where((car) => car.id.equals(carID))).go();
  }

  @override
  Future<List<Car>> getAllCars(int personID) {
    return (select(carTable)
          ..where(
            (car) => car.personId.equals(personID),
          ))
        .get();
  }

  @override
  Future<List<Car>> getAllCurrentlyDrivingCars(int personID) {
    return (select(carTable)
          ..where(
            (car) =>
                car.personId.equals(personID) &
                car.currentlyDriving.equals(true),
          ))
        .get();
  }

  @override
  Future<Car?> getCar(int carID) {
    return (select(carTable)
          ..where((car) => car.id.equals(carID))
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<Car?> getCurrentCar(int personID) {
    return (select(carTable)
          ..where(
            (car) =>
                car.personId.equals(personID) &
                car.currentlyDriving.equals(true),
          )
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<void> updateCar(Car car) {
    return update(carTable).replace(car);
  }

  @override
  Stream<List<Car>> watchAllCars(int personID) {
    return (select(carTable)
          ..where(
            (car) => car.personId.equals(personID),
          ))
        .watch();
  }

  @override
  Stream<Car?> watchCar(int carID) {
    return (select(carTable)
          ..where((car) => car.id.equals(carID))
          ..limit(1))
        .watchSingleOrNull();
  }
}
