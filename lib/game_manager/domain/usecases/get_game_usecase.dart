import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_manager/domain/repository/game_repository.dart';

class GetGameUsecase {
  final GameRepository _gameRepository;

  const GetGameUsecase({required GameRepository gameRepository})
      : _gameRepository = gameRepository;

  Future<Game?> execute(int gameID) async {
    return _gameRepository.getGame(gameID);
  }
}
