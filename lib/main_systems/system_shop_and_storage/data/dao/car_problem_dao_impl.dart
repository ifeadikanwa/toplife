import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/dao/car_problem_dao.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/car_problem.dart';

part 'car_problem_dao_impl.g.dart';

@DriftAccessor(tables: [CarProblemTable])
class CarProblemDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$CarProblemDaoImplMixin
    implements CarProblemDao {
  CarProblemDaoImpl(DatabaseProvider database) : super(database);

  @override
  Future<CarProblem> createCarProblem(CarProblem carProblem) async {
    //if a car problem with the same car id and type exists we do nothing
    await into(carProblemTable).insert(
      carProblem,
      onConflict: DoNothing(),
    );
    return carProblem;
  }

  @override
  Future<void> deleteCarProblem(int carID, String type) {
    return (delete(carProblemTable)
          ..where(
            (carProblem) =>
                carProblem.carId.equals(carID) & carProblem.type.equals(type),
          ))
        .go();
  }

  @override
  Future<List<CarProblem>> getAllOfACarsProblems(int carID) {
    return (select(carProblemTable)
          ..where(
            (carProblem) => carProblem.carId.equals(carID),
          ))
        .get();
  }

  @override
  Future<CarProblem?> getCarProblem(int carID, String type) {
    return (select(carProblemTable)
          ..where(
            (carProblem) =>
                carProblem.carId.equals(carID) & carProblem.type.equals(type),
          )
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<void> updateCarProblem(CarProblem carProblem) {
    return update(carProblemTable).replace(carProblem);
  }
}
