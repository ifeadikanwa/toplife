import 'package:sqflite/sqflite.dart';
import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/dao/item_dao.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/item.dart';

class ItemDaoImpl implements ItemDao {
  final DatabaseProvider _databaseProvider = DatabaseProvider.instance;

  static const itemTable = "item";

  static const createTableQuery = '''
    CREATE TABLE $itemTable(
      ${Item.idColumn} $idType,
      ${Item.nameColumn} $textType,
      ${Item.typeColumn} $textType,
      ${Item.basePriceColumn} $integerType,
      ${Item.countColumn} $integerType
    )
''';

  @override
  Future<Item> createItem(Item item) async {
   final db = await _databaseProvider.database;
    final int id = await db.insert(
      itemTable,
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return item.copyWith(id: id);
  }

  @override
  Future<Item?> findItemWithName(String itemName) async {
    final db = await _databaseProvider.database;
    final itemMaps = await db.query(
      itemTable,
      columns: Item.allColumns,
      where: "${Item.nameColumn} = ?",
      whereArgs: [itemName],
    );

    if (itemMaps.isNotEmpty) {
      return Item.fromMap(itemMap: itemMaps.first);
    } else {
      return null;
    }
  }

  @override
  Future<Item?> getItem(int itemID) async {
   final db = await _databaseProvider.database;
    final itemMaps = await db.query(
      itemTable,
      columns: Item.allColumns,
      where: "${Item.idColumn} = ?",
      whereArgs: [itemID],
    );

    if (itemMaps.isNotEmpty) {
      return Item.fromMap(itemMap: itemMaps.first);
    } else {
      return null;
    }
  }

  @override
  Future<void> updateItem(Item item) async {
  final db = await _databaseProvider.database;
    await db.update(
      itemTable,
      item.toMap(),
      where: "${Item.idColumn} = ?",
      whereArgs: [item.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
