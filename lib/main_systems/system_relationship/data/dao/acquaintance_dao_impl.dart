import 'package:sqflite/sqflite.dart';
import 'package:toplife/core/data_source/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/dao/acquaintance_dao.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/acquaintance.dart';

class AcquaintanceDaoImpl implements AcquaintanceDao {
  final DatabaseProvider _databaseProvider = DatabaseProvider.instance;

  static const acquaintanceTable = "acquaintance";

  static const createTableQuery ="";
//    '''
//     CREATE TABLE $acquaintanceTable(
//       ${Acquaintance.mainPersonIDColumn} $integerType,
//       ${Acquaintance.acquaintanceIDColumn} $integerType,
//       ${Acquaintance.metAtColumn} $textType,
//       ${Acquaintance.relationshipColumn} $integerType,
//       PRIMARY KEY (${Acquaintance.mainPersonIDColumn}, ${Acquaintance.acquaintanceIDColumn}),
//       FOREIGN KEY (${Acquaintance.mainPersonIDColumn})
//        REFERENCES ${PersonDaoImpl.personTable} () 
//        ON UPDATE CASCADE
//        ON DELETE CASCADE,
//       FOREIGN KEY (${Acquaintance.acquaintanceIDColumn})
//        REFERENCES ${PersonDaoImpl.personTable} () 
//        ON UPDATE CASCADE
//        ON DELETE CASCADE
//     )
// ''';


  @override
  Future<Acquaintance> createAcquaintance(Acquaintance acquaintance) async {
    final db = await _databaseProvider.database;
    await db.insert(
      acquaintanceTable,
      acquaintance.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return acquaintance;
  }

  @override
  Future<void> deleteAcquaintance(int mainPersonID, int acquaintanceID) async {
    final db = await _databaseProvider.database;
    await db.delete(
      acquaintanceTable,
      where:
          "${Acquaintance.mainPersonIDColumn} = ? and ${Acquaintance.acquaintanceIDColumn} = ?",
      whereArgs: [
        mainPersonID,
        acquaintanceID,
      ],
    );
  }

  @override
  Future<Acquaintance?> getAcquaintance(
    int mainPersonID,
    int acquaintanceID,
  ) async {
    final db = await _databaseProvider.database;
    final acquaintancesMap = await db.query(
      acquaintanceTable,
      columns: Acquaintance.allColumns,
      where:
          "${Acquaintance.mainPersonIDColumn} = ? and ${Acquaintance.acquaintanceIDColumn} = ?",
      whereArgs: [
        mainPersonID,
        acquaintanceID,
      ],
    );

    if (acquaintancesMap.isNotEmpty) {
      return Acquaintance.fromMap(acquaintanceMap: acquaintancesMap.first);
    } else {
      return null;
    }
  }

  @override
  Future<List<Acquaintance>> getAllAcquaintance(int mainPersonID) async {
    final db = await _databaseProvider.database;
    final acquaintancesMap = await db.query(
      acquaintanceTable,
      columns: Acquaintance.allColumns,
      where: "${Acquaintance.mainPersonIDColumn} = ?",
      whereArgs: [mainPersonID],
    );

    return acquaintancesMap
        .map((acquaintanceMap) =>
            Acquaintance.fromMap(acquaintanceMap: acquaintanceMap))
        .toList();
  }

  @override
  Future<void> updateAcquaintance(Acquaintance acquaintance) async {
    final db = await _databaseProvider.database;
    await db.update(
      acquaintanceTable,
      acquaintance.toMap(),
      where:
          "${Acquaintance.mainPersonIDColumn} = ? and ${Acquaintance.acquaintanceIDColumn} = ?",
      whereArgs: [
        acquaintance.mainPersonID,
        acquaintance.acquaintanceID,
      ],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
