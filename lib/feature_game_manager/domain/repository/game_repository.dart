import 'package:toplife/feature_game_manager/domain/model/game.dart';

abstract class GameRepository {
  Future<Game> createGame(Game game);
  Future<Game?> getGame(int gameID);
  Future<void> updateGame(Game game);
  Future<void> deleteGame(int gameID);
  Future<List<Game>> getAllActiveGames();
  Future<Game?> getNewestActiveGame();
}
