import 'package:toplife/feature_game_manager/domain/model/game.dart';
import 'package:toplife/feature_game_manager/domain/repository/game_repository.dart';

class GetAllActiveGamesUsecase {
  final GameRepository _gameRepository;

  const GetAllActiveGamesUsecase({required GameRepository gameRepository})
      : _gameRepository = gameRepository;

  Future<List<Game>> execute() async {
    return _gameRepository.getAllActiveGames();
  }
}
