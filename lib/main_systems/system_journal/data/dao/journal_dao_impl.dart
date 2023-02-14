import 'package:sqflite/sqflite.dart';
import 'package:toplife/core/data_source/database_provider.dart';
import 'package:toplife/main_systems/system_journal/domain/dao/journal_dao.dart';
import 'package:toplife/main_systems/system_journal/domain/model/journal.dart';

class JournalDaoImpl implements JournalDao {
  final DatabaseProvider _databaseProvider = DatabaseProvider.instance;

  static const journalTable = "journal";

  static const createTableQuery ="";
//       '''
//     CREATE TABLE $journalTable(
//       ${Journal.gameIDColumn} $integerType,
//       ${Journal.dayColumn} $integerType,
//       ${Journal.mainPlayerIDColumn} $integerType,
//       ${Journal.entryColumn} $textType,
//       PRIMARY KEY (${Journal.gameIDColumn}, ${Journal.dayColumn}),
//       FOREIGN KEY (${Journal.gameIDColumn})
//        REFERENCES ${GameDaoImpl.gameTable} (${Game.idColumn}) 
//        ON UPDATE CASCADE
//        ON DELETE NO ACTION,
//       FOREIGN KEY (${Journal.mainPlayerIDColumn})
//        REFERENCES ${PersonDaoImpl.personTable} (${Person.idColumn}) 
//        ON UPDATE CASCADE
//        ON DELETE NO ACTION
//     )
// ''';

  @override
  Future<Journal> createJournal(Journal journal) async {
    final db = await _databaseProvider.database;
    await db.insert(
      journalTable,
      journal.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return journal;
  }

  @override
  Future<Journal?> getJournal(int gameID, int day) async {
    final db = await _databaseProvider.database;
    final journalsMap = await db.query(
      journalTable,
      columns: Journal.allColumns,
      where: "${Journal.gameIDColumn} = ? and ${Journal.dayColumn} = ?",
      whereArgs: [gameID, day],
    );

    if (journalsMap.isNotEmpty) {
      return Journal.fromMap(journalMap: journalsMap.first);
    } else {
      return null;
    }
  }

  @override
  Future<List<Journal>> getMainPlayerJournals(
      int gameID, int mainPlayerID) async {
    final db = await _databaseProvider.database;
    final allMainPlayerJournalsMap = await db.query(
      journalTable,
      columns: Journal.allColumns,
      where:
          "${Journal.gameIDColumn} = ? and ${Journal.mainPlayerIDColumn} = ?",
      whereArgs: [gameID, mainPlayerID],
    );

    return allMainPlayerJournalsMap
        .map((journalMap) => Journal.fromMap(journalMap: journalMap))
        .toList();
  }

  @override
  Future<void> updateJournal(Journal journal) async {
    final db = await _databaseProvider.database;
    await db.update(
      journalTable,
      journal.toMap(),
      where: "${Journal.gameIDColumn} = ? and ${Journal.dayColumn} = ?",
      whereArgs: [journal.gameID, journal.day],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> deleteJournal(int gameID, int day) async {
    final db = await _databaseProvider.database;
    await db.delete(
      journalTable,
      where: "${Journal.gameIDColumn} = ? and ${Journal.dayColumn} = ?",
      whereArgs: [gameID, day],
    );
  }
}
