import 'package:sqflite/sqflite.dart';
import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/database_provider.dart';
import 'package:toplife/main_systems/system_person/data/dao/person_dao_impl.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/dao/jewelry_dao.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/jewelry.dart';

class JewelryDaoImpl implements JewelryDao {
  final DatabaseProvider _databaseProvider = DatabaseProvider.instance;

  static const jewelryTable = "jewelry";

  static const createTableQuery = '''
    CREATE TABLE $jewelryTable(
      ${Jewelry.idColumn} $idType,
      ${Jewelry.personIDColumn} $integerType,
      ${Jewelry.jewelColumn} $textType,
      ${Jewelry.typeColumn} $textType,
      ${Jewelry.caratColumn} $decimalType,
      ${Jewelry.qualityColumn} $textType,
      ${Jewelry.basePriceColumn} $integerType,
      ${Jewelry.dayOfPurchaseColumn} $integerType,
      ${Jewelry.maxConditionAtPurchaseColumn} $integerType,
      FOREIGN KEY (${Jewelry.personIDColumn})
       REFERENCES ${PersonDaoImpl.personTable} (${Person.idColumn}) 
       ON UPDATE CASCADE
       ON DELETE CASCADE
    )
''';

  @override
  Future<Jewelry> createJewelry(Jewelry jewelry) async {
    final db = await _databaseProvider.database;
    final int id = await db.insert(
      jewelryTable,
      jewelry.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return jewelry.copyWith(id: id);
  }

  @override
  Future<void> deleteJewelry(int jewelryID) async {
    final db = await _databaseProvider.database;
    await db.delete(
      jewelryTable,
      where: "${Jewelry.idColumn} = ?",
      whereArgs: [jewelryID],
    );
  }

  @override
  Future<List<Jewelry>> getAllJewelry(int personID) async {
    final db = await _databaseProvider.database;
    final allJewelryMap = await db.query(
      jewelryTable,
      columns: Jewelry.allColumns,
      where: "${Jewelry.personIDColumn} = ?",
      whereArgs: [personID],
    );

    return allJewelryMap
        .map((jewelryMap) => Jewelry.fromMap(
              jewelryMap: jewelryMap,
            ))
        .toList();
  }

  @override
  Future<Jewelry?> getJewelry(int jewelryID) async {
    final db = await _databaseProvider.database;
    final jewelryMaps = await db.query(
      jewelryTable,
      columns: Jewelry.allColumns,
      where: "${Jewelry.idColumn} = ?",
      whereArgs: [jewelryID],
    );

    if (jewelryMaps.isNotEmpty) {
      return Jewelry.fromMap(jewelryMap: jewelryMaps.first);
    } else {
      return null;
    }
  }

  @override
  Future<void> updateJewelry(Jewelry jewelry) async {
    final db = await _databaseProvider.database;
    await db.update(
      jewelryTable,
      jewelry.toMap(),
      where: "${Jewelry.idColumn} = ?",
      whereArgs: [jewelry.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
