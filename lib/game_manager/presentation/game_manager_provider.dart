import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/game_manager/domain/model/game.dart';
import 'package:toplife/game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/game_manager/presentation/game_states.dart';

final gameManagerProvider =
    StateNotifierProvider<CurrentGameManager, AsyncValue<Game?>>((ref) {
  return CurrentGameManager(gameUsecases: ref.watch(gameUsecasesProvider));
});

//this is who every aspect of the game looks at for the sate of the current game only.
class CurrentGameManager extends StateNotifier<AsyncValue<Game?>> {
  final GameUsecases _gameUsecases;

  CurrentGameManager({required GameUsecases gameUsecases})
      : _gameUsecases = gameUsecases,
        super(const AsyncValue.loading()) {
    _fetchNewestGame();
  }

  Future<void> _fetchNewestGame() async {
    state = await AsyncValue.guard(
        () => _gameUsecases.getLastPlayedActiveGameUsecase.execute());
  }

  Future<void> updateGame(Game game) async {
    await _gameUsecases.updateGameUsecase.execute(game);
    _fetchNewestGame();
  }

  Future<void> setNewCurrentGame(Game game) async {
    await _gameUsecases.setLastPlayedActiveGameUsecase.execute(game);
    _fetchNewestGame();
  }

  void refresh() {
    _fetchNewestGame();
  }
}
