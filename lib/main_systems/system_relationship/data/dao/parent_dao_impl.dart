import 'package:sqflite/sqflite.dart';
import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/database_provider.dart';
import 'package:toplife/main_systems/system_person/data/dao/person_dao_impl.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_relationship/domain/dao/parent_dao.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/parent.dart';

class ParentDaoImpl implements ParentDao {
  final DatabaseProvider _databaseProvider = DatabaseProvider.instance;

  static const parentTable = "parent";

  static const createTableQuery = '''
    CREATE TABLE $parentTable(
      ${Parent.mainPersonIDColumn} $integerType,
      ${Parent.parentIDColumn} $integerType,
      ${Parent.parentRelationshipTypeColumn} $textType,
      ${Parent.relationshipColumn} $integerType,
      ${Parent.isActiveColumn} $boolType,
      PRIMARY KEY (${Parent.mainPersonIDColumn}, ${Parent.parentIDColumn}),
      FOREIGN KEY (${Parent.mainPersonIDColumn})
       REFERENCES ${PersonDaoImpl.personTable} (${Person.idColumn}) 
       ON UPDATE CASCADE
       ON DELETE CASCADE,
      FOREIGN KEY (${Parent.parentIDColumn})
       REFERENCES ${PersonDaoImpl.personTable} (${Person.idColumn}) 
       ON UPDATE CASCADE
       ON DELETE CASCADE
    )
''';

  @override
  Future<Parent> createParent(Parent parent) async {
    final db = await _databaseProvider.database;
    await db.insert(
      parentTable,
      parent.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return parent;
  }

  @override
  Future<void> deleteParent(int mainPersonID, int parentID) async {
    final db = await _databaseProvider.database;
    await db.delete(
      parentTable,
      where:
          "${Parent.mainPersonIDColumn} = ? and ${Parent.parentIDColumn} = ?",
      whereArgs: [
        mainPersonID,
        parentID,
      ],
    );
  }

  @override
  Future<List<Parent>> getAllActiveParents(int mainPersonID) async {
    final db = await _databaseProvider.database;
    final parentsMap = await db.query(
      parentTable,
      columns: Parent.allColumns,
      where:
          "${Parent.mainPersonIDColumn} = ? and ${Parent.isActiveColumn} = ?",
      whereArgs: [mainPersonID, databaseTrueValue],
    );

    return parentsMap
        .map((parentMap) => Parent.fromMap(parentMap: parentMap))
        .toList();
  }

  @override
  Future<Parent?> getParent(int mainPersonID, int parentID) async {
    final db = await _databaseProvider.database;
    final parentsMap = await db.query(
      parentTable,
      columns: Parent.allColumns,
      where:
          "${Parent.mainPersonIDColumn} = ? and ${Parent.parentIDColumn} = ?",
      whereArgs: [
        mainPersonID,
        parentID,
      ],
    );

    if (parentsMap.isNotEmpty) {
      return Parent.fromMap(parentMap: parentsMap.first);
    } else {
      return null;
    }
  }

  @override
  Future<void> updateParent(Parent parent) async {
    final db = await _databaseProvider.database;
    await db.update(
      parentTable,
      parent.toMap(),
      where:
          "${Parent.mainPersonIDColumn} = ? and ${Parent.parentIDColumn} = ?",
      whereArgs: [
        parent.mainPersonID,
        parent.parentID,
      ],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
