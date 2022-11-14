import 'package:sqflite/sqflite.dart';
import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/database_provider.dart';
import 'package:toplife/main_systems/system_person/data/dao/person_dao_impl.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/dao/car_dao.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/car.dart';

class CarDaoImpl implements CarDao {
  final DatabaseProvider _databaseProvider = DatabaseProvider.instance;

  static const carTable = "car";

  static const createTableQuery =
      '''
    CREATE TABLE $carTable(
      ${Car.idColumn} $idType,
      ${Car.personIDColumn} $integerType,
      ${Car.nameColumn} $textType,
      ${Car.typeColumn} $textType,
      ${Car.percentageOfTravelTimeColumn} $integerType,
      ${Car.qualityColumn} $textType,
      ${Car.basePriceColumn} $integerType,
      ${Car.dayOfPurchaseColumn} $integerType,
      ${Car.fuelTankColumn} $integerType,
      ${Car.problemColumn} $textType,
      ${Car.useConditionColumn} $integerType,
      ${Car.maxConditionAtPurchaseColumn} $integerType,
      ${Car.currentlyDrivingColumn} $boolType,
      ${Car.fullyPaidForColumn} $boolType,
      ${Car.isInsuredColumn} $boolType,
      ${Car.insuranceCostColumn} $integerType,
      ${Car.insuranceTypeColumn} $textType,
      FOREIGN KEY (${Car.personIDColumn})
       REFERENCES ${PersonDaoImpl.personTable} (${Person.idColumn}) 
       ON UPDATE CASCADE
       ON DELETE CASCADE
    )
''';

  @override
  Future<Car> createCar(Car car) async {
    final db = await _databaseProvider.database;
    final int id = await db.insert(
      carTable,
      car.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return car.copyWith(id: id);
  }

  @override
  Future<void> deleteCar(int carID) async {
    final db = await _databaseProvider.database;
    await db.delete(
      carTable,
      where: "${Car.idColumn} = ?",
      whereArgs: [carID],
    );
  }

  @override
  Future<List<Car>> getAllCars(int personID) async {
    final db = await _databaseProvider.database;
    final allCarMap = await db.query(
      carTable,
      columns: Car.allColumns,
      where: "${Car.personIDColumn} = ?",
      whereArgs: [personID],
    );

    return allCarMap
        .map((carMap) => Car.fromMap(
              carMap: carMap,
            ))
        .toList();
  }

  @override
  Future<Car?> getCar(int carID) async {
    final db = await _databaseProvider.database;
    final carMaps = await db.query(
      carTable,
      columns: Car.allColumns,
      where: "${Car.idColumn} = ?",
      whereArgs: [carID],
    );

    if (carMaps.isNotEmpty) {
      return Car.fromMap(carMap: carMaps.first);
    } else {
      return null;
    }
  }

  @override
  Future<void> updateCar(Car car) async {
    final db = await _databaseProvider.database;
    await db.update(
      carTable,
      car.toMap(),
      where: "${Car.idColumn} = ?",
      whereArgs: [car.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<Car?> getCurrentCar(int personID) async {
    final db = await _databaseProvider.database;
    final carMaps = await db.query(
      carTable,
      columns: Car.allColumns,
      where: "${Car.personIDColumn} = ? and ${Car.currentlyDrivingColumn} = ?",
      whereArgs: [
        personID,
        databaseTrueValue,
      ],
    );

    if (carMaps.isNotEmpty) {
      return Car.fromMap(carMap: carMaps.first);
    } else {
      return null;
    }
  }

  @override
  Future<List<Car>> getAllCurrentlyDrivingCars(int personID) async {
    final db = await _databaseProvider.database;
    final allCarMap = await db.query(
      carTable,
      columns: Car.allColumns,
      where: "${Car.personIDColumn} = ? and ${Car.currentlyDrivingColumn} = ?",
      whereArgs: [
        personID,
        databaseTrueValue,
      ],
    );

    return allCarMap
        .map((carMap) => Car.fromMap(
              carMap: carMap,
            ))
        .toList();
  }
}
