import 'package:sqflite/sqflite.dart';
import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/database_provider.dart';
import 'package:toplife/main_systems/system_person/data/dao/person_dao_impl.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_shop_and_storage/data/dao/item_dao_impl.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/dao/storeroom_item_dao.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/item.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/storeroom_item.dart';

class StoreroomItemDaoImpl implements StoreroomItemDao {
  final DatabaseProvider _databaseProvider = DatabaseProvider.instance;

  static const storeroomItemTable = "storeroom_item";

  static const createTableQuery =
      '''
    CREATE TABLE $storeroomItemTable(
      ${StoreroomItem.idColumn} $idType,
      ${StoreroomItem.personIDColumn} $integerType,
      ${StoreroomItem.itemIDColumn} $integerType,
      ${StoreroomItem.countsLeftColumn} $integerType,
      FOREIGN KEY (${StoreroomItem.personIDColumn})
       REFERENCES ${PersonDaoImpl.personTable} (${Person.idColumn}) 
       ON UPDATE CASCADE
       ON DELETE CASCADE,
      FOREIGN KEY (${StoreroomItem.itemIDColumn})
       REFERENCES ${ItemDaoImpl.itemTable} (${Item.idColumn}) 
       ON UPDATE CASCADE
       ON DELETE NO ACTION
    )
''';

  @override
  Future<StoreroomItem> createStoreroomItem(StoreroomItem storeroomItem) async {
    final db = await _databaseProvider.database;
    final int id = await db.insert(
      storeroomItemTable,
      storeroomItem.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return storeroomItem.copyWith(id: id);
  }

  @override
  Future<void> deleteStoreroomItem(int storeroomItemID) async {
    final db = await _databaseProvider.database;
    await db.delete(
      storeroomItemTable,
      where: "${StoreroomItem.idColumn} = ?",
      whereArgs: [storeroomItemID],
    );
  }

  @override
  Future<List<StoreroomItem>> getAllStoreroomItems(int personID) async {
    final db = await _databaseProvider.database;
    final allStoreroomItemMap = await db.query(
      storeroomItemTable,
      columns: StoreroomItem.allColumns,
      where: "${StoreroomItem.personIDColumn} = ?",
      whereArgs: [personID],
    );

    return allStoreroomItemMap
        .map((storeroomItemMap) => StoreroomItem.fromMap(
              storeroomItemMap: storeroomItemMap,
            ))
        .toList();
  }

  @override
  Future<StoreroomItem?> getStoreroomItem(int storeroomItemID) async {
    final db = await _databaseProvider.database;
    final storeroomItemMaps = await db.query(
      storeroomItemTable,
      columns: StoreroomItem.allColumns,
      where: "${StoreroomItem.idColumn} = ?",
      whereArgs: [storeroomItemID],
    );

    if (storeroomItemMaps.isNotEmpty) {
      return StoreroomItem.fromMap(storeroomItemMap: storeroomItemMaps.first);
    } else {
      return null;
    }
  }

  @override
  Future<void> updateStoreroomItem(StoreroomItem storeroomItem) async {
    final db = await _databaseProvider.database;
    await db.update(
      storeroomItemTable,
      storeroomItem.toMap(),
      where: "${StoreroomItem.idColumn} = ?",
      whereArgs: [storeroomItem.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<StoreroomItem?> findParticularStoreroomItem({
    required int personID,
    required int itemID,
  }) async {
    final db = await _databaseProvider.database;
    final storeroomItemMaps = await db.query(
      storeroomItemTable,
      columns: StoreroomItem.allColumns,
      where:
          "${StoreroomItem.personIDColumn} = ? and ${StoreroomItem.itemIDColumn} = ?",
      whereArgs: [
        personID,
        itemID,
      ],
    );

    if (storeroomItemMaps.isNotEmpty) {
      return StoreroomItem.fromMap(storeroomItemMap: storeroomItemMaps.first);
    } else {
      return null;
    }
  }
}
