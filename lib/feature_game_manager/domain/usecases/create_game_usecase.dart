import 'package:toplife/feature_game_manager/domain/model/game.dart';
import 'package:toplife/feature_game_manager/domain/repository/game_repository.dart';

class CreateGameUsecase {
  final GameRepository _gameRepository;

  const CreateGameUsecase({required GameRepository gameRepository})
      : _gameRepository = gameRepository;

  Future<Game> execute(Game game) async {
    return _gameRepository.createGame(game);
  }
}
