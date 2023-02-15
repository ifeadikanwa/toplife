import 'package:sqflite/sqflite.dart';
import 'package:toplife/core/data_source/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/dao/fridge_food_dao.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/fridge_food.dart';

class FridgeFoodDaoImpl implements FridgeFoodDao {
  final DatabaseProvider _databaseProvider = DatabaseProvider.instance;

  static const fridgeFoodTable = "fridge_food";

  static const createTableQuery ="";
//       '''
//     CREATE TABLE $fridgeFoodTable(
//       ${FridgeFood.idColumn} $idType,
//       ${FridgeFood.personIDColumn} $integerType,
//       ${FridgeFood.foodIDColumn} $integerType,
//       ${FridgeFood.servingsLeftColumn} $integerType,
//       ${FridgeFood.expiryDayColumn} $integerType,
//       FOREIGN KEY (${FridgeFood.personIDColumn})
//        REFERENCES ${PersonDaoImpl.personTable} () 
//        ON UPDATE CASCADE
//        ON DELETE CASCADE,
//       FOREIGN KEY (${FridgeFood.foodIDColumn})
//        REFERENCES ${FoodDaoImpl.foodTable} (${Food.idColumn}) 
//        ON UPDATE CASCADE
//        ON DELETE NO ACTION
//     )
// ''';

  @override
  Future<FridgeFood> createFridgeFood(FridgeFood fridgeFood) async {
    final db = await _databaseProvider.database;
    final int id = await db.insert(
      fridgeFoodTable,
      fridgeFood.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return fridgeFood.copyWith(id: id);
  }

  @override
  Future<void> deleteFridgeFood(int fridgeFoodID) async {
    final db = await _databaseProvider.database;
    await db.delete(
      fridgeFoodTable,
      where: "${FridgeFood.idColumn} = ?",
      whereArgs: [fridgeFoodID],
    );
  }

  @override
  Future<List<FridgeFood>> getAllFridgeFood(int personID) async {
    final db = await _databaseProvider.database;
    final allFridgeFoodMap = await db.query(
      fridgeFoodTable,
      columns: FridgeFood.allColumns,
      where: "${FridgeFood.personIDColumn} = ?",
      whereArgs: [personID],
    );

    return allFridgeFoodMap
        .map((fridgeFoodMap) => FridgeFood.fromMap(
              fridgeFoodMap: fridgeFoodMap,
            ))
        .toList();
  }

  @override
  Future<FridgeFood?> getFridgeFood(int fridgeFoodID) async {
    final db = await _databaseProvider.database;
    final fridgeFoodMaps = await db.query(
      fridgeFoodTable,
      columns: FridgeFood.allColumns,
      where: "${FridgeFood.idColumn} = ?",
      whereArgs: [fridgeFoodID],
    );

    if (fridgeFoodMaps.isNotEmpty) {
      return FridgeFood.fromMap(fridgeFoodMap: fridgeFoodMaps.first);
    } else {
      return null;
    }
  }

  @override
  Future<void> updateFridgeFood(FridgeFood fridgeFood) async {
    final db = await _databaseProvider.database;
    await db.update(
      fridgeFoodTable,
      fridgeFood.toMap(),
      where: "${FridgeFood.idColumn} = ?",
      whereArgs: [fridgeFood.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<FridgeFood?> findParticularFridgeFood({
    required int personID,
    required int foodID,
    required int expiryDay,
  }) async {
    final db = await _databaseProvider.database;
    final foundFridgeFoodMap = await db.query(
      fridgeFoodTable,
      columns: FridgeFood.allColumns,
      where:
          "${FridgeFood.personIDColumn} = ? and ${FridgeFood.foodIDColumn} = ? and ${FridgeFood.expiryDayColumn} = ?",
      whereArgs: [
        personID,
        foodID,
        expiryDay,
      ],
    );

   if (foundFridgeFoodMap.isNotEmpty) {
      return FridgeFood.fromMap(fridgeFoodMap: foundFridgeFoodMap.first);
    } else {
      return null;
    }
  }
}
