import 'package:sqflite/sqflite.dart';
import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/database_provider.dart';
import 'package:toplife/main_systems/system_person/data/dao/person_dao_impl.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_relationship/domain/dao/sibling_dao.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/sibling.dart';

class SiblingDaoImpl implements SiblingDao{
  final DatabaseProvider _databaseProvider = DatabaseProvider.instance;

  static const siblingTable = "sibling";

  static const createTableQuery = '''
    CREATE TABLE $siblingTable(
      ${Sibling.mainPersonIDColumn} $integerType,
      ${Sibling.siblingIDColumn} $integerType,
      ${Sibling.siblingRelationshipTypeColumn} $textType,
      ${Sibling.relationshipColumn} $integerType,
      PRIMARY KEY (${Sibling.mainPersonIDColumn}, ${Sibling.siblingIDColumn}),
      FOREIGN KEY (${Sibling.mainPersonIDColumn})
       REFERENCES ${PersonDaoImpl.personTable} (${Person.idColumn}) 
       ON UPDATE CASCADE
       ON DELETE CASCADE,
      FOREIGN KEY (${Sibling.siblingIDColumn})
       REFERENCES ${PersonDaoImpl.personTable} (${Person.idColumn}) 
       ON UPDATE CASCADE
       ON DELETE CASCADE
    )
''';



  @override
  Future<Sibling> createSibling(Sibling sibling) async {
    final db = await _databaseProvider.database;
    await db.insert(
      siblingTable,
      sibling.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return sibling;
  }

  @override
  Future<void> deleteSibling(int mainPersonID, int siblingID) async {
     final db = await _databaseProvider.database;
    await db.delete(
      siblingTable,
      where:
          "${Sibling.mainPersonIDColumn} = ? and ${Sibling.siblingIDColumn} = ?",
      whereArgs: [
        mainPersonID,
        siblingID,
      ],
    );
  }

  @override
  Future<List<Sibling>> getAllSiblings(int mainPersonID) async {
     final db = await _databaseProvider.database;
    final siblingsMap = await db.query(
      siblingTable,
      columns: Sibling.allColumns,
      where: "${Sibling.mainPersonIDColumn} = ?",
      whereArgs: [mainPersonID],
    );

    return siblingsMap
        .map((siblingMap) => Sibling.fromMap(siblingMap: siblingMap))
        .toList();
  }

  @override
  Future<Sibling?> getSibling(int mainPersonID, int siblingID) async {
    final db = await _databaseProvider.database;
    final siblingsMap = await db.query(
      siblingTable,
      columns: Sibling.allColumns,
      where:
          "${Sibling.mainPersonIDColumn} = ? and ${Sibling.siblingIDColumn} = ?",
      whereArgs: [
        mainPersonID,
        siblingID,
      ],
    );

    if (siblingsMap.isNotEmpty) {
      return Sibling.fromMap(siblingMap: siblingsMap.first);
    } else {
      return null;
    }
  }

  @override
  Future<void> updateSibling(Sibling sibling) async {
   final db = await _databaseProvider.database;
    await db.update(
      siblingTable,
      sibling.toMap(),
      where:
          "${Sibling.mainPersonIDColumn} = ? and ${Sibling.siblingIDColumn} = ?",
      whereArgs: [
        sibling.mainPersonID,
        sibling.siblingID,
      ],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

}