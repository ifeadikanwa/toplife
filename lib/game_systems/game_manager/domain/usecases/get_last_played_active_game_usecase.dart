import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/game_manager/domain/repository/game_repository.dart';

class GetLastPlayedActiveGameUsecase {
  final GameRepository _gameRepository;

  const GetLastPlayedActiveGameUsecase({required GameRepository gameRepository})
      : _gameRepository = gameRepository;

  Future<Game?> execute() async {
    return _gameRepository.getLastPlayedActiveGame();
  }
}
