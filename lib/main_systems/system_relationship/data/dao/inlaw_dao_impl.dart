import 'package:sqflite/sqflite.dart';
import 'package:toplife/core/data_source/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/dao/inlaw_dao.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/inlaw.dart';

class InLawDaoImpl implements InLawDao {
  final DatabaseProvider _databaseProvider = DatabaseProvider.instance;

  static const inLawTable = "in_law";

  static const createTableQuery ="";
//       '''
//     CREATE TABLE $inLawTable(
//       ${InLaw.mainPersonIDColumn} $integerType,
//       ${InLaw.inLawIDColumn} $integerType,
//       ${InLaw.likesMainPersonColumn} $boolType,
//       ${InLaw.inLawRelationshipTypeColumn} $textType,
//       ${InLaw.haveRomanticRelationshipColumn} $boolType,
//       ${InLaw.relationshipColumn} $integerType,
//       PRIMARY KEY (${InLaw.mainPersonIDColumn}, ${InLaw.inLawIDColumn}),
//       FOREIGN KEY (${InLaw.mainPersonIDColumn})
//        REFERENCES ${PersonDaoImpl.personTable} () 
//        ON UPDATE CASCADE
//        ON DELETE CASCADE,
//       FOREIGN KEY (${InLaw.inLawIDColumn})
//        REFERENCES ${PersonDaoImpl.personTable} () 
//        ON UPDATE CASCADE
//        ON DELETE CASCADE
//     )
// ''';

  @override
  Future<InLaw> createInLaw(InLaw inLaw) async {
    final db = await _databaseProvider.database;
    await db.insert(
      inLawTable,
      inLaw.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return inLaw;
  }

  @override
  Future<void> deleteInLaw(int mainPersonID, int inLawID) async {
    final db = await _databaseProvider.database;
    await db.delete(
      inLawTable,
      where:
          "${InLaw.mainPersonIDColumn} = ? and ${InLaw.inLawIDColumn} = ?",
      whereArgs: [
        mainPersonID,
        inLawID,
      ],
    );
  }

  @override
  Future<List<InLaw>> getAllInLaws(int mainPersonID) async {
    final db = await _databaseProvider.database;
    final inLawsMap = await db.query(
      inLawTable,
      columns: InLaw.allColumns,
      where: "${InLaw.mainPersonIDColumn} = ?",
      whereArgs: [mainPersonID],
    );

    return inLawsMap
        .map((inLawMap) => InLaw.fromMap(inLawMap: inLawMap))
        .toList();
  }

  @override
  Future<InLaw?> getInLaw(int mainPersonID, int inLawID) async {
    final db = await _databaseProvider.database;
    final inLawsMap = await db.query(
      inLawTable,
      columns: InLaw.allColumns,
      where:
          "${InLaw.mainPersonIDColumn} = ? and ${InLaw.inLawIDColumn} = ?",
      whereArgs: [
        mainPersonID,
        inLawID,
      ],
    );

    if (inLawsMap.isNotEmpty) {
      return InLaw.fromMap(inLawMap: inLawsMap.first);
    } else {
      return null;
    }
  }

  @override
  Future<void> updateInLaw(InLaw inLaw) async {
    final db = await _databaseProvider.database;
    await db.update(
      inLawTable,
      inLaw.toMap(),
      where:
          "${InLaw.mainPersonIDColumn} = ? and ${InLaw.inLawIDColumn} = ?",
      whereArgs: [
        inLaw.mainPersonID,
        inLaw.inLawID,
      ],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
