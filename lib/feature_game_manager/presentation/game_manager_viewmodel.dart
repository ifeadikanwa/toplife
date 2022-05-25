import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/feature_game_manager/domain/model/game.dart';
import 'package:toplife/feature_game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';

class GameManagerViewModel extends StateNotifier<AsyncValue<Game?>> {
  final GameUsecases _gameUsecases;

  GameManagerViewModel({required GameUsecases gameUsecases})
      : _gameUsecases = gameUsecases,
        super(const AsyncValue.loading()) {
    _fetchNewestGame();
  }

  Future<void> _fetchNewestGame() async {
    state = await AsyncValue.guard(
        () => _gameUsecases.getNewestActiveGameUsecase.execute());
  }

  Future<void> createGame(Person person) async {
    await _gameUsecases.createGameUsecase.execute(person);
    _fetchNewestGame();
  }

  Future<void> updateGame(Game game) async {
    await _gameUsecases.updateGameUsecase.execute(game);
    _fetchNewestGame();
  }

  Future<void> deleteGame(int gameID) async {
    await _gameUsecases.deleteGameUsecase.execute(gameID);
    _fetchNewestGame();
  }

  Future<Game?> getGame(int gameID) async {
    return _gameUsecases.getGameUsecase.execute(gameID);
  }

  Future<List<Game>> getAllActiveGames() async {
    return _gameUsecases.getAllActiveGamesUsecase.execute();
  }
}
