import 'package:sqflite/sqflite.dart';
import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/database_provider.dart';
import 'package:toplife/main_systems/system_person/data/dao/person_dao_impl.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/dao/house_dao.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/house.dart';

class HouseDaoImpl implements HouseDao {
  final DatabaseProvider _databaseProvider = DatabaseProvider.instance;

  static const houseTable = "house";

  static const createTableQuery = '''
    CREATE TABLE $houseTable(
      ${House.idColumn} $idType,
      ${House.personIDColumn} $integerType,
      ${House.isCurrentHomeColumn} $boolType,
      ${House.bedroomsColumn} $integerType,
      ${House.bathroomsColumn} $integerType,
      ${House.storageColumn} $integerType,
      ${House.addressColumn} $textType,
      ${House.isForRentColumn} $boolType,
      ${House.buildingTypeColumn} $textType,
      ${House.settlementColumn} $textType,
      ${House.countryColumn} $textType,
      ${House.styleColumn} $textType,
      ${House.lastMaintainedDayColumn} $integerType,
      ${House.basePriceColumn} $integerType,
      ${House.dayOfPurchaseColumn} $integerType,
      ${House.endOfLeaseDayColumn} $integerType,
      ${House.conditionColumn} $integerType,
      ${House.purchasePriceColumn} $integerType,
      ${House.fullyPaidForColumn} $boolType,
      FOREIGN KEY (${House.personIDColumn})
       REFERENCES ${PersonDaoImpl.personTable} (${Person.idColumn}) 
       ON UPDATE CASCADE
       ON DELETE CASCADE
    )
''';

  @override
  Future<House> createHouse(House house) async {
    final db = await _databaseProvider.database;
    final int id = await db.insert(
      houseTable,
      house.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return house.copyWith(id: id);
  }

  @override
  Future<void> deleteHouse(int houseID) async {
    final db = await _databaseProvider.database;
    await db.delete(
      houseTable,
      where: "${House.idColumn} = ?",
      whereArgs: [houseID],
    );
  }

  @override
  Future<List<House>> getAllHouses(int personID) async {
    final db = await _databaseProvider.database;
    final allHouseMap = await db.query(
      houseTable,
      columns: House.allColumns,
      where: "${House.personIDColumn} = ?",
      whereArgs: [personID],
    );

    return allHouseMap
        .map((houseMap) => House.fromMap(
              houseMap: houseMap,
            ))
        .toList();
  }

  @override
  Future<House?> getHouse(int houseID) async {
    final db = await _databaseProvider.database;
    final houseMaps = await db.query(
      houseTable,
      columns: House.allColumns,
      where: "${House.idColumn} = ?",
      whereArgs: [houseID],
    );

    if (houseMaps.isNotEmpty) {
      return House.fromMap(houseMap: houseMaps.first);
    } else {
      return null;
    }
  }

  @override
  Future<void> updateHouse(House house) async {
    final db = await _databaseProvider.database;
    await db.update(
      houseTable,
      house.toMap(),
      where: "${House.idColumn} = ?",
      whereArgs: [house.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<House?> getCurrentHouse(int personID) async {
    final db = await _databaseProvider.database;
    final houseMaps = await db.query(
      houseTable,
      columns: House.allColumns,
      where: "${House.personIDColumn} = ? and ${House.isCurrentHomeColumn} = ?",
      whereArgs: [
        personID,
        databaseTrueValue,
      ],
    );

    if (houseMaps.isNotEmpty) {
      return House.fromMap(houseMap: houseMaps.first);
    } else {
      return null;
    }
  }
}
