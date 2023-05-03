import 'package:toplife/game_manager/domain/repository/game_repository.dart';
import 'package:toplife/game_manager/domain/usecases/change_current_player_usecase.dart';
import 'package:toplife/game_manager/domain/usecases/control_game/decay_and_alter_player_stats_usecase.dart';
import 'package:toplife/game_manager/domain/usecases/control_game/game_controller_usecase.dart';
import 'package:toplife/game_manager/domain/usecases/create_new_game_usecase.dart';
import 'package:toplife/game_manager/domain/usecases/delete_game_usecase.dart';
import 'package:toplife/game_manager/domain/usecases/get_all_active_games_usecase.dart';
import 'package:toplife/game_manager/domain/usecases/get_current_game_and_player_usecase.dart';
import 'package:toplife/game_manager/domain/usecases/get_game_usecase.dart';
import 'package:toplife/game_manager/domain/usecases/get_last_played_active_game_usecase.dart';
import 'package:toplife/game_manager/domain/usecases/get_player_bar_info_from_data_usecase.dart';
import 'package:toplife/game_manager/domain/usecases/get_player_bar_info_usecase.dart';
import 'package:toplife/game_manager/domain/usecases/move_time_forward_usecase.dart';
import 'package:toplife/game_manager/domain/usecases/set_last_played_active_game_usecase.dart';
import 'package:toplife/game_manager/domain/usecases/update_game_usecase.dart';
import 'package:toplife/game_manager/domain/usecases/watch_last_played_active_game_usecase.dart';
import 'package:toplife/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';

class GameUsecases {
  final GameRepository _gameRepository;
  final PersonUsecases _personUsecases;
  final RelationshipUsecases _relationshipUsecases;
  final AgeUsecases _ageUsecases;

  const GameUsecases(
    GameRepository gameRepository,
    PersonUsecases personUsecases,
    RelationshipUsecases relationshipUsecases,
    AgeUsecases ageUsecases,
  )   : _gameRepository = gameRepository,
        _personUsecases = personUsecases,
        _relationshipUsecases = relationshipUsecases,
        _ageUsecases = ageUsecases;

  CreateNewGameUsecase get createGameUsecase => CreateNewGameUsecase(
        gameRepository: _gameRepository,
        personUsecases: _personUsecases,
        relationshipUsecases: _relationshipUsecases,
        ageUsecases: _ageUsecases,
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

  MoveTimeForwardUsecase get moveTimeForwardUsecase =>
      MoveTimeForwardUsecase(gameRepository: _gameRepository);

  SetLastPlayedActiveGameUsecase get setLastPlayedActiveGameUsecase =>
      SetLastPlayedActiveGameUsecase(gameRepository: _gameRepository);

  GetCurrentGameAndPlayerUsecase get getCurrentGameAndPlayerUsecase =>
      GetCurrentGameAndPlayerUsecase(
        getLastPlayedActiveGameUsecase,
        _personUsecases,
      );

  GetPlayerBarInfoUsecase get getPlayerBarInfoUsecase =>
      GetPlayerBarInfoUsecase(
        getCurrentGameAndPlayerUsecase,
        getPlayerBarInfoFromDataUsecase,
      );

  GetPlayerBarInfoFromDataUsecase get getPlayerBarInfoFromDataUsecase =>
      GetPlayerBarInfoFromDataUsecase(
        _personUsecases,
        _relationshipUsecases,
      );

  WatchLastPlayedActiveGameUsecase get watchLastPlayedActiveGameUsecase =>
      WatchLastPlayedActiveGameUsecase(
        gameRepository: _gameRepository,
      );

  GameControllerUsecase get gameControllerUsecase =>
      GameControllerUsecase(decayAndAlterPlayerStatsUsecase);

  DecayAndAlterPlayerStatsUsecase get decayAndAlterPlayerStatsUsecase =>
      DecayAndAlterPlayerStatsUsecase(_personUsecases);
}
