import 'package:toplife/core/data_source/drift_database/database_provider.dart';
abstract class GameDao {
  Future<Game> createGame(Game game);
  Future<Game?> getGame(int gameID);
  Future<void> updateGame(Game game);
  Future<void> deleteGame(int gameID);
  Future<List<Game>> getAllActiveGames();
  Future<Game?> getLastPlayedActiveGame();
  Stream<Game?> watchLastPlayedActiveGame();
  Stream<Game?> watchGame(int gameID);
}
