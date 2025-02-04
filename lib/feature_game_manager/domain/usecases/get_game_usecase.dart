import 'package:toplife/feature_game_manager/domain/model/game.dart';
import 'package:toplife/feature_game_manager/domain/repository/game_repository.dart';

class GetGameUsecase {
  final GameRepository _gameRepository;

  const GetGameUsecase({required GameRepository gameRepository})
      : _gameRepository = gameRepository;

  Future<Game?> execute(int gameID) async {
    return _gameRepository.getGame(gameID);
  }
}
