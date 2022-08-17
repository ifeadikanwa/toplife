import 'package:sqflite/sqflite.dart';
import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/database_provider.dart';
import 'package:toplife/main_systems/system_person/data/dao/person_dao_impl.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_relationship/constants/relative_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/dao/relative_dao.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/relative.dart';

class RelativeDaoImpl implements RelativeDao {
  final DatabaseProvider _databaseProvider = DatabaseProvider.instance;

  static const relativeTable = "relative";

  static const createTableQuery = '''
    CREATE TABLE $relativeTable(
      ${Relative.mainPersonIDColumn} $integerType,
      ${Relative.relativeIDColumn} $integerType,
      ${Relative.inYourCustodyColumn} $boolType,
      ${Relative.relativeRelationshipTypeColumn} $textType,
      ${Relative.relationshipColumn} $integerType,
      PRIMARY KEY (${Relative.mainPersonIDColumn}, ${Relative.relativeIDColumn}),
      FOREIGN KEY (${Relative.mainPersonIDColumn})
       REFERENCES ${PersonDaoImpl.personTable} (${Person.idColumn}) 
       ON UPDATE CASCADE
       ON DELETE CASCADE,
      FOREIGN KEY (${Relative.relativeIDColumn})
       REFERENCES ${PersonDaoImpl.personTable} (${Person.idColumn}) 
       ON UPDATE CASCADE
       ON DELETE CASCADE
    )
''';

  @override
  Future<Relative> createRelative(Relative relative) async {
    final db = await _databaseProvider.database;
    await db.insert(
      relativeTable,
      relative.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return relative;
  }

  @override
  Future<void> deleteRelative(int mainPersonID, int relativeID) async {
    final db = await _databaseProvider.database;
    await db.delete(
      relativeTable,
      where:
          "${Relative.mainPersonIDColumn} = ? and ${Relative.relativeIDColumn} = ?",
      whereArgs: [
        mainPersonID,
        relativeID,
      ],
    );
  }

  @override
  Future<List<Relative>> getAllRelatives(int mainPersonID) async {
    final db = await _databaseProvider.database;
    final relativesMap = await db.query(
      relativeTable,
      columns: Relative.allColumns,
      where: "${Relative.mainPersonIDColumn} = ?",
      whereArgs: [mainPersonID],
    );

    return relativesMap
        .map((relativeMap) => Relative.fromMap(relativeMap: relativeMap))
        .toList();
  }

  @override
  Future<Relative?> getRelative(int mainPersonID, int relativeID) async {
    final db = await _databaseProvider.database;
    final relativesMap = await db.query(
      relativeTable,
      columns: Relative.allColumns,
      where:
          "${Relative.mainPersonIDColumn} = ? and ${Relative.relativeIDColumn} = ?",
      whereArgs: [
        mainPersonID,
        relativeID,
      ],
    );

    if (relativesMap.isNotEmpty) {
      return Relative.fromMap(relativeMap: relativesMap.first);
    } else {
      return null;
    }
  }

  @override
  Future<void> updateRelative(Relative relative) async {
    final db = await _databaseProvider.database;
    await db.update(
      relativeTable,
      relative.toMap(),
      where:
          "${Relative.mainPersonIDColumn} = ? and ${Relative.relativeIDColumn} = ?",
      whereArgs: [
        relative.mainPersonID,
        relative.relativeID,
      ],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<Relative>> getAllGrandchildren(int mainPersonID) async {
    final db = await _databaseProvider.database;
    final relativesMap = await db.query(
      relativeTable,
      columns: Relative.allColumns,
      where:
          "${Relative.mainPersonIDColumn} = ? and ${Relative.relativeRelationshipTypeColumn} = ?",
      whereArgs: [
        mainPersonID,
        RelativeRelationshipType.grandchild.name,
      ],
    );

    return relativesMap
        .map((relativeMap) => Relative.fromMap(relativeMap: relativeMap))
        .toList();
  }
}
