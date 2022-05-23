import 'package:toplife/feature_game_manager/domain/repository/game_repository.dart';

class DeleteGameUsecase {
  final GameRepository _gameRepository;

  const DeleteGameUsecase({required GameRepository gameRepository})
      : _gameRepository = gameRepository;

  Future<void> execute(int gameID) async {
    return _gameRepository.deleteGame(gameID);
  }
}
