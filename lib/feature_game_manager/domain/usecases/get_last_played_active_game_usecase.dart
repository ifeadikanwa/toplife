import 'package:toplife/feature_game_manager/domain/model/game.dart';
import 'package:toplife/feature_game_manager/domain/repository/game_repository.dart';

class GetLastPlayedActiveGameUsecase {
  final GameRepository _gameRepository;

  const GetLastPlayedActiveGameUsecase({required GameRepository gameRepository})
      : _gameRepository = gameRepository;

  Future<Game?> execute() async {
    return _gameRepository.getLastPlayedActiveGame();
  }
}
