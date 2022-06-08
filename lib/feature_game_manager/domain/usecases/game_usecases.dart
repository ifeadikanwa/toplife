import 'package:toplife/feature_game_manager/domain/repository/game_repository.dart';
import 'package:toplife/feature_game_manager/domain/usecases/change_current_player_usecase.dart';
import 'package:toplife/feature_game_manager/domain/usecases/create_game_usecase.dart';
import 'package:toplife/feature_game_manager/domain/usecases/delete_game_usecase.dart';
import 'package:toplife/feature_game_manager/domain/usecases/get_all_active_games_usecase.dart';
import 'package:toplife/feature_game_manager/domain/usecases/get_game_usecase.dart';
import 'package:toplife/feature_game_manager/domain/usecases/get_last_played_active_game_usecase.dart';
import 'package:toplife/feature_game_manager/domain/usecases/update_game_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';

class GameUsecases {
  final GameRepository _gameRepository;
  final PersonUsecases _personUsecases;

  const GameUsecases(
    GameRepository gameRepository,
    PersonUsecases personUsecases,
  )   : _gameRepository = gameRepository,
        _personUsecases = personUsecases;

  CreateGameUsecase get createGameUsecase => CreateGameUsecase(
        gameRepository: _gameRepository,
        personUsecases: _personUsecases,
      );

  UpdateGameUsecase get updateGameUsecase =>
      UpdateGameUsecase(gameRepository: _gameRepository);

  DeleteGameUsecase get deleteGameUsecase =>
      DeleteGameUsecase(gameRepository: _gameRepository);

  GetAllActiveGamesUsecase get getAllActiveGamesUsecase =>
      GetAllActiveGamesUsecase(gameRepository: _gameRepository);

  GetGameUsecase get getGameUsecase =>
      GetGameUsecase(gameRepository: _gameRepository);

  GetLastPlayedActiveGameUsecase get getLastPlayedActiveGameUsecase =>
      GetLastPlayedActiveGameUsecase(gameRepository: _gameRepository);

  ChangeCurrentPlayerUsecase get changeCurrentPlayerUsecase =>
      ChangeCurrentPlayerUsecase(gameRepository: _gameRepository);
}
