import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/game_manager/domain/repository/game_repository.dart';

class WatchLastPlayedActiveGameUsecase {
  final GameRepository _gameRepository;

  const WatchLastPlayedActiveGameUsecase(
      {required GameRepository gameRepository})
      : _gameRepository = gameRepository;

  Stream<Game?> execute() {
    return _gameRepository.watchLastPlayedActiveGame();
  }
}
