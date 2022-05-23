import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/database_provider.dart';
import 'package:toplife/feature_game_manager/domain/dao/game_dao.dart';
import 'package:toplife/feature_game_manager/domain/model/game.dart';

class GameDaoImpl implements GameDao {
  final DatabaseProvider _databaseProvider = DatabaseProvider.instance;

  static const gameTable = "game";

  static const createTableQuery = '''
    CREATE TABLE $gameTable(
      ${Game.idColumn} $idType,
      ${Game.currentPlayerIDColumn} $integerType,
      ${Game.isActiveColumn} $boolType,
      ${Game.lastPlayedTimeColumn} $integerType
    )
  ''';

  @override
  Future<Game> createGame(Game game) async {
    final db = await _databaseProvider.database;
    final id = await db.insert(gameTable, game.toMap());

    return game.copyWith(id: id);
  }

  @override
  Future<void> deleteGame(int gameID) async {
    final db = await _databaseProvider.database;
    await db.delete(
      gameTable,
      where: "${Game.idColumn} = ?",
      whereArgs: [gameID],
    );
  }

  @override
  Future<List<Game>> getAllActiveGames() async {
    final db = await _databaseProvider.database;
    final allActiveGamesMap = await db.query(
      gameTable,
      columns: Game.allColumns,
      where: "${Game.isActiveColumn} = ?",
      whereArgs: [1],
    );

    return allActiveGamesMap
        .map((activeGameMap) => Game.fromMap(gameMap: activeGameMap))
        .toList();
  }

  @override
  Future<Game?> getGame(int gameID) async {
    final db = await _databaseProvider.database;
    final gameMaps = await db.query(
      gameTable,
      columns: Game.allColumns,
      where: "${Game.idColumn} = ?",
      whereArgs: [gameID],
    );

    if (gameMaps.isNotEmpty) {
      return Game.fromMap(gameMap: gameMaps.first);
    } else {
      return null;
    }
  }

  @override
  Future<void> updateGame(Game game) async {
    final db = await _databaseProvider.database;
    await db.update(
      gameTable,
      game.toMap(),
      where: "${Game.idColumn} = ?",
      whereArgs: [game.id],
    );
  }

  @override
  Future<Game?> getNewestActiveGame() async {
    final db = await _databaseProvider.database;
    final gameMaps = await db.query(
      gameTable,
      columns: Game.allColumns,
      where: "${Game.isActiveColumn} = ?",
      whereArgs: [1],
      orderBy: "${Game.lastPlayedTimeColumn} DESC",
    );

    if (gameMaps.isNotEmpty) {
      return Game.fromMap(gameMap: gameMaps.first);
    } else {
      return null;
    }
  }
}
