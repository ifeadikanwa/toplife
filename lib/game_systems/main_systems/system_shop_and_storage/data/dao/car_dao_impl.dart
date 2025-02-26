import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/core/utils/stats/stats_range/stats_range_constants.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/dao/car_dao.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/model/car.dart';

part 'car_dao_impl.g.dart';

@DriftAccessor(tables: [CarTable])
class CarDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$CarDaoImplMixin
    implements CarDao {
  CarDaoImpl(super.database);

  @override
  Future<Car> createCar(Car car) async {
    final Car checkedCar = car.copyWith(
      percentageOfTravelTime: crossCheckStat(
        stat: car.percentageOfTravelTime,
        statsRange: StatsRangeConstants.defaultRange,
      ),
      fuelTank: crossCheckStat(
        stat: car.fuelTank,
        statsRange: StatsRangeConstants.defaultRange,
      ),
      maxConditionAtPurchase: crossCheckStat(
        stat: car.maxConditionAtPurchase,
        statsRange: StatsRangeConstants.defaultRange,
      ),
    );

    final CarTableCompanion carWithoutID =
        checkedCar.toCompanion(false).copyWith(id: const Value.absent());

    final carID = await into(carTable).insertOnConflictUpdate(carWithoutID);
    return checkedCar.copyWith(id: carID);
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
    final Car checkedCar = car.copyWith(
      percentageOfTravelTime: crossCheckStat(
        stat: car.percentageOfTravelTime,
        statsRange: StatsRangeConstants.defaultRange,
      ),
      fuelTank: crossCheckStat(
        stat: car.fuelTank,
        statsRange: StatsRangeConstants.defaultRange,
      ),
      maxConditionAtPurchase: crossCheckStat(
        stat: car.maxConditionAtPurchase,
        statsRange: StatsRangeConstants.defaultRange,
      ),
    );

    return update(carTable).replace(checkedCar);
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
