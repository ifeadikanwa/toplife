import 'package:toplife/game_manager/domain/repository/game_repository.dart';
import 'package:toplife/game_manager/domain/usecases/change_current_player_usecase.dart';
import 'package:toplife/game_manager/domain/usecases/create_new_game_usecase.dart';
import 'package:toplife/game_manager/domain/usecases/delete_game_usecase.dart';
import 'package:toplife/game_manager/domain/usecases/get_all_active_games_usecase.dart';
import 'package:toplife/game_manager/domain/usecases/get_game_usecase.dart';
import 'package:toplife/game_manager/domain/usecases/get_last_played_active_game_usecase.dart';
import 'package:toplife/game_manager/domain/usecases/update_game_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';

class GameUsecases {
  final GameRepository _gameRepository;
  final PersonUsecases _personUsecases;
  final RelationshipUsecases _relationshipUsecases;

  const GameUsecases(
    GameRepository gameRepository,
    PersonUsecases personUsecases,
    RelationshipUsecases relationshipUsecases,
  )   : _gameRepository = gameRepository,
        _personUsecases = personUsecases,
        _relationshipUsecases = relationshipUsecases;

  CreateNewGameUsecase get createGameUsecase => CreateNewGameUsecase(
        gameRepository: _gameRepository,
        personUsecases: _personUsecases,
        relationshipUsecases: _relationshipUsecases,
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
