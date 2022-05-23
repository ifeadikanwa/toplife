import 'package:toplife/feature_game_manager/domain/model/game.dart';
import 'package:toplife/feature_game_manager/domain/repository/game_repository.dart';

class UpdateGameUsecase {
  final GameRepository _gameRepository;

  const UpdateGameUsecase({required GameRepository gameRepository})
      : _gameRepository = gameRepository;

  Future<void> execute(Game game) async {
    return _gameRepository.updateGame(game);
  }
}
