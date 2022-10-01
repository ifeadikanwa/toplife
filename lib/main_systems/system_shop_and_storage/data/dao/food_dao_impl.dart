import 'package:sqflite/sqflite.dart';
import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/dao/food_dao.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/food.dart';

class FoodDaoImpl implements FoodDao {
  final DatabaseProvider _databaseProvider = DatabaseProvider.instance;

  static const foodTable = "food";

  static const createTableQuery = '''
    CREATE TABLE $foodTable(
      ${Food.idColumn} $idType,
      ${Food.nameColumn} $textType,
      ${Food.typeColumn} $textType,
      ${Food.basePriceColumn} $integerType,
      ${Food.lifespanInDaysColumn} $integerType,
      ${Food.nutritionColumn} $integerType,
      ${Food.servingsColumn} $integerType,
      ${Food.isOrganicColumn} $boolType
    )
''';

  @override
  Future<Food> createFood(Food food) async {
    final db = await _databaseProvider.database;
    final int id = await db.insert(
      foodTable,
      food.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return food.copyWith(id: id);
  }

  @override
  Future<Food?> findFoodWithName(String foodName) async {
   final db = await _databaseProvider.database;
    final foodMaps = await db.query(
      foodTable,
      columns: Food.allColumns,
      where: "${Food.nameColumn} = ?",
      whereArgs: [foodName],
    );

    if (foodMaps.isNotEmpty) {
      return Food.fromMap(foodMap: foodMaps.first);
    } else {
      return null;
    }
  }

  @override
  Future<Food?> getFood(int foodID) async {
    final db = await _databaseProvider.database;
    final foodMaps = await db.query(
      foodTable,
      columns: Food.allColumns,
      where: "${Food.idColumn} = ?",
      whereArgs: [foodID],
    );

    if (foodMaps.isNotEmpty) {
      return Food.fromMap(foodMap: foodMaps.first);
    } else {
      return null;
    }
  }

  @override
  Future<void> updateFood(Food food) async {
    final db = await _databaseProvider.database;
    await db.update(
      foodTable,
      food.toMap(),
      where: "${Food.idColumn} = ?",
      whereArgs: [food.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
