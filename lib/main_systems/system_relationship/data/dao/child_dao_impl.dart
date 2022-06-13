import 'package:sqflite/sqflite.dart';
import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/database_provider.dart';
import 'package:toplife/main_systems/system_person/data/dao/person_dao_impl.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_relationship/constants/child_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/dao/child_dao.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/child.dart';

class ChildDaoImpl implements ChildDao {
  final DatabaseProvider _databaseProvider = DatabaseProvider.instance;

  static const childTable = "child";

  static const createTableQuery = '''
    CREATE TABLE $childTable(
      ${Child.mainPersonIDColumn} $integerType,
      ${Child.childIDColumn} $integerType,
      ${Child.custodianIDColumn} $integerType,
      ${Child.childRelationshipTypeColumn} $textType,
      ${Child.relationshipColumn} $integerType,
      PRIMARY KEY (${Child.mainPersonIDColumn}, ${Child.childIDColumn}),
      FOREIGN KEY (${Child.mainPersonIDColumn})
       REFERENCES ${PersonDaoImpl.personTable} (${Person.idColumn}) 
       ON UPDATE CASCADE
       ON DELETE CASCADE,
      FOREIGN KEY (${Child.childIDColumn})
       REFERENCES ${PersonDaoImpl.personTable} (${Person.idColumn}) 
       ON UPDATE CASCADE
       ON DELETE CASCADE
    )
''';

  @override
  Future<Child> createChild(Child child) async {
    final db = await _databaseProvider.database;
    await db.insert(
      childTable,
      child.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return child;
  }

  @override
  Future<void> deleteAllStepChildren(int mainPersonID) async {
    final db = await _databaseProvider.database;
    await db.delete(
      childTable,
      where:
          "${Child.mainPersonIDColumn} = ? and ${Child.childRelationshipTypeColumn} = ?",
      whereArgs: [
        mainPersonID,
        ChildRelationshipType.step.name,
      ],
    );
  }

  @override
  Future<void> deleteChild(int mainPersonID, int childID) async {
    final db = await _databaseProvider.database;
    await db.delete(
      childTable,
      where:
          "${Child.mainPersonIDColumn} = ? and ${Child.childIDColumn} = ?",
      whereArgs: [
        mainPersonID,
        childID,
      ],
    );
  }

  @override
  Future<List<Child>> getAllChildren(int mainPersonID) async {
    final db = await _databaseProvider.database;
    final childrenMap = await db.query(
      childTable,
      columns: Child.allColumns,
      where:
          "${Child.mainPersonIDColumn} = ?",
      whereArgs: [mainPersonID],
    );

    return childrenMap
        .map((childMap) => Child.fromMap(childMap: childMap))
        .toList();
  }

  @override
  Future<Child?> getChild(int mainPersonID, int childID) async {
    final db = await _databaseProvider.database;
    final childrenMap = await db.query(
      childTable,
      columns: Child.allColumns,
      where:
          "${Child.mainPersonIDColumn} = ? and ${Child.childIDColumn} = ?",
      whereArgs: [
        mainPersonID,
        childID,
      ],
    );

    if (childrenMap.isNotEmpty) {
      return Child.fromMap(childMap: childrenMap.first);
    } else {
      return null;
    }
  }

  @override
  Future<void> updateChild(Child child) async {
    final db = await _databaseProvider.database;
    await db.update(
      childTable,
      child.toMap(),
      where:
          "${Child.mainPersonIDColumn} = ? and ${Child.childIDColumn} = ?",
      whereArgs: [
        child.mainPersonID,
        child.childID,
      ],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

}