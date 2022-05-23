import 'package:toplife/feature_game_manager/domain/repository/game_repository.dart';
import 'package:toplife/feature_game_manager/domain/usecases/create_game_usecase.dart';
import 'package:toplife/feature_game_manager/domain/usecases/delete_game_usecase.dart';
import 'package:toplife/feature_game_manager/domain/usecases/get_all_active_games_usecase.dart';
import 'package:toplife/feature_game_manager/domain/usecases/get_game_usecase.dart';
import 'package:toplife/feature_game_manager/domain/usecases/get_newest_active_game_usecas.dart';
import 'package:toplife/feature_game_manager/domain/usecases/update_game_usecase.dart';

class GameUsecases {
  final GameRepository _gameRepository;

  const GameUsecases(GameRepository gameRepository)
      : _gameRepository = gameRepository;

  CreateGameUsecase get createGameUsecase =>
      CreateGameUsecase(gameRepository: _gameRepository);

  UpdateGameUsecase get updateGameUsecase =>
      UpdateGameUsecase(gameRepository: _gameRepository);

  DeleteGameUsecase get deleteGameUsecase =>
      DeleteGameUsecase(gameRepository: _gameRepository);

  GetAllActiveGamesUsecase get getAllActiveGamesUsecase =>
      GetAllActiveGamesUsecase(gameRepository: _gameRepository);

  GetGameUsecase get getGameUsecase =>
      GetGameUsecase(gameRepository: _gameRepository);
      
  GetNewestActiveGameUsecase get getNewestActiveGameUsecase =>
      GetNewestActiveGameUsecase(gameRepository: _gameRepository);
}
