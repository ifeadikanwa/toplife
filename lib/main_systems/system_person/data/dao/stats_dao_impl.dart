import 'package:sqflite/sqflite.dart';
import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/database_provider.dart';
import 'package:toplife/main_systems/system_person/data/dao/person_dao_impl.dart';
import 'package:toplife/main_systems/system_person/domain/dao/stats_dao.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_person/domain/model/stats.dart';

class StatsDaoImpl implements StatsDao {
  final DatabaseProvider _databaseProvider = DatabaseProvider.instance;

  static const statsTable = "stats";

  static const createTableQuery = '''
    CREATE TABLE $statsTable(
      ${Stats.idColumn} $idType,
      ${Stats.personIDColumn} $integerType $unique,
      ${Stats.energyColumn} $integerType,
      ${Stats.hungerColumn} $integerType,
      ${Stats.looksColumn} $integerType,
      ${Stats.intellectColumn} $integerType,
      ${Stats.athleticismColumn} $integerType,
      FOREIGN KEY (${Stats.personIDColumn})
       REFERENCES ${PersonDaoImpl.personTable} (${Person.idColumn}) 
       ON UPDATE CASCADE
       ON DELETE CASCADE
    )
  ''';

  @override
  Future<Stats> createStats(Stats stats) async {
    final db = await _databaseProvider.database;
    final id = await db.insert(
      statsTable,
      stats.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return stats.copyWith(id: id);
  }

  @override
  Future<void> deleteStats(int statsID) async {
    final db = await _databaseProvider.database;
    await db.delete(
      statsTable,
      where: "${Stats.idColumn} = ?",
      whereArgs: [statsID],
    );
  }

  @override
  Future<Stats?> getStats(int personID) async {
    final db = await _databaseProvider.database;
    final statsMaps = await db.query(
      statsTable,
      columns: Stats.allColumns,
      where: "${Stats.personIDColumn} = ?",
      whereArgs: [personID],
    );

    if (statsMaps.isNotEmpty) {
      return Stats.fromMap(statsMap: statsMaps.first);
    } else {
      return null;
    }
  }

  @override
  Future<void> updateStats(Stats stats) async {
    final db = await _databaseProvider.database;
    await db.update(
      statsTable,
      stats.toMap(),
      where: "${Stats.idColumn} = ?",
      whereArgs: [stats.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
