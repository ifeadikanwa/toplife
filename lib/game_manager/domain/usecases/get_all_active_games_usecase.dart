import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_manager/domain/repository/game_repository.dart';

class GetAllActiveGamesUsecase {
  final GameRepository _gameRepository;

  const GetAllActiveGamesUsecase({required GameRepository gameRepository})
      : _gameRepository = gameRepository;

  Future<List<Game>> execute() async {
    return _gameRepository.getAllActiveGames();
  }
}
