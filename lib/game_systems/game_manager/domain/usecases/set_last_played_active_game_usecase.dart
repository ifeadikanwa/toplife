import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/game_manager/domain/repository/game_repository.dart';

class SetLastPlayedActiveGameUsecase {
  final GameRepository _gameRepository;

  const SetLastPlayedActiveGameUsecase({required GameRepository gameRepository})
      : _gameRepository = gameRepository;

  Future<void> execute(Game game) async {
    return _gameRepository.updateGame(
      game.copyWith(
        lastPlayedTime: DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }
}
