import 'package:toplife/game_manager/domain/dao/game_dao.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_manager/domain/repository/game_repository.dart';

class GameRepositoryImpl implements GameRepository {
  final GameDao _gameDao;

  const GameRepositoryImpl(GameDao gameDao) : _gameDao = gameDao;

  @override
  Future<Game> createGame(Game game) async {
    return _gameDao.createGame(game);
  }

  @override
  Future<void> deleteGame(int gameID) async {
    return _gameDao.deleteGame(gameID);
  }

  @override
  Future<List<Game>> getAllActiveGames() async {
    return _gameDao.getAllActiveGames();
  }

  @override
  Future<Game?> getGame(int gameID) async {
    return _gameDao.getGame(gameID);
  }

  @override
  Future<void> updateGame(Game game) async {
    return _gameDao.updateGame(game);
  }

  @override
  Future<Game?> getLastPlayedActiveGame() {
    return _gameDao.getLastPlayedActiveGame();
  }

  @override
  Stream<Game?> watchGame(int gameID) {
    return _gameDao.watchGame(gameID);
  }
}
