import 'package:sqflite/sqflite.dart';
import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/database_provider.dart';
import 'package:toplife/main_systems/system_person/data/dao/person_dao_impl.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_relationship/domain/dao/graveyard_dao.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/graveyard.dart';


class GraveyardDaoImpl implements GraveyardDao {
  final DatabaseProvider _databaseProvider = DatabaseProvider.instance;

  static const graveyardTable = "graveyard";

  static const createTableQuery =
      '''
    CREATE TABLE $graveyardTable(
      ${Graveyard.mainPersonIDColumn} $integerType,
      ${Graveyard.deadPersonIDColumn} $integerType,
      ${Graveyard.relationshipTypeColumn} $textType,
      ${Graveyard.dayOfDeathColumn} $integerType,
      ${Graveyard.fullNameColumn} $textType,
      ${Graveyard.ageAtDeathColumn} $textType,
      PRIMARY KEY (${Graveyard.mainPersonIDColumn}, ${Graveyard.deadPersonIDColumn}),
      FOREIGN KEY (${Graveyard.mainPersonIDColumn})
       REFERENCES ${PersonDaoImpl.personTable} (${Person.idColumn}) 
       ON UPDATE CASCADE
       ON DELETE CASCADE,
      FOREIGN KEY (${Graveyard.deadPersonIDColumn})
       REFERENCES ${PersonDaoImpl.personTable} (${Person.idColumn}) 
       ON UPDATE CASCADE
       ON DELETE CASCADE
    )
''';

  @override
  Future<Graveyard> createGraveyard(Graveyard graveyard) async {
    final db = await _databaseProvider.database;
    await db.insert(
      graveyardTable,
      graveyard.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return graveyard;
  }

  @override
  Future<void> deleteGraveyard(int mainPersonID, int deadPersonID) async {
    final db = await _databaseProvider.database;
    await db.delete(
      graveyardTable,
      where:
          "${Graveyard.mainPersonIDColumn} = ? and ${Graveyard.deadPersonIDColumn} = ?",
      whereArgs: [
        mainPersonID,
        deadPersonID,
      ],
    );
  }

  @override
  Future<List<Graveyard>> getAllGraveyards(int mainPersonID) async {
    final db = await _databaseProvider.database;
    final graveyardsMap = await db.query(
      graveyardTable,
      columns: Graveyard.allColumns,
      where: "${Graveyard.mainPersonIDColumn} = ?",
      whereArgs: [mainPersonID],
    );

    return graveyardsMap
        .map((graveyardMap) => Graveyard.fromMap(graveyardMap: graveyardMap))
        .toList();
  }

  @override
  Future<Graveyard?> getGraveyard(int mainPersonID, int deadPersonID) async {
    final db = await _databaseProvider.database;
    final graveyardsMap = await db.query(
      graveyardTable,
      columns: Graveyard.allColumns,
      where:
          "${Graveyard.mainPersonIDColumn} = ? and ${Graveyard.deadPersonIDColumn} = ?",
      whereArgs: [
        mainPersonID,
        deadPersonID,
      ],
    );

    if (graveyardsMap.isNotEmpty) {
      return Graveyard.fromMap(graveyardMap: graveyardsMap.first);
    } else {
      return null;
    }
  }

  @override
  Future<void> updateGraveyard(Graveyard graveyard) async {
    final db = await _databaseProvider.database;
    await db.update(
      graveyardTable,
      graveyard.toMap(),
      where:
          "${Graveyard.mainPersonIDColumn} = ? and ${Graveyard.deadPersonIDColumn} = ?",
      whereArgs: [
        graveyard.mainPersonID,
        graveyard.deadPersonID,
      ],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
