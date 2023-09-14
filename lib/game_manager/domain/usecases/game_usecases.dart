import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/age/age_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/event/event_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/game/game_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/common_states/dependencies/transportation/transportation_dependencies_providers.dart';
import 'package:toplife/game_manager/action_runner/action_runner.dart';
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

class GameUsecases {
  final Ref _ref;

  const GameUsecases({required Ref ref}) : _ref = ref;

  ActionRunner get actionRunner => ActionRunner(
        moveTimeForwardUsecase,
        getCurrentGameAndPlayerUsecase,
        _ref.read(personUsecasesProvider),
        _ref.read(transportationUsecasesProvider),
      );

  CreateNewGameUsecase get createGameUsecase => CreateNewGameUsecase(
        gameRepository: _ref.read(gameRepositoryProvider),
        personUsecases: _ref.read(personUsecasesProvider),
        relationshipUsecases: _ref.read(relationshipUsecasesProvider),
        ageUsecases: _ref.read(ageUsecasesProvider),
      );

  UpdateGameUsecase get updateGameUsecase => UpdateGameUsecase(
        gameRepository: _ref.read(gameRepositoryProvider),
      );

  DeleteGameUsecase get deleteGameUsecase =>
      DeleteGameUsecase(gameRepository: _ref.read(gameRepositoryProvider));

  GetAllActiveGamesUsecase get getAllActiveGamesUsecase =>
      GetAllActiveGamesUsecase(
          gameRepository: _ref.read(gameRepositoryProvider));

  GetGameUsecase get getGameUsecase =>
      GetGameUsecase(gameRepository: _ref.read(gameRepositoryProvider));

  GetLastPlayedActiveGameUsecase get getLastPlayedActiveGameUsecase =>
      GetLastPlayedActiveGameUsecase(
          gameRepository: _ref.read(gameRepositoryProvider));

  ChangeCurrentPlayerUsecase get changeCurrentPlayerUsecase =>
      ChangeCurrentPlayerUsecase(
          gameRepository: _ref.read(gameRepositoryProvider));

  MoveTimeForwardUsecase get moveTimeForwardUsecase =>
      MoveTimeForwardUsecase(gameRepository: _ref.read(gameRepositoryProvider));

  SetLastPlayedActiveGameUsecase get setLastPlayedActiveGameUsecase =>
      SetLastPlayedActiveGameUsecase(
          gameRepository: _ref.read(gameRepositoryProvider));

  GetCurrentGameAndPlayerUsecase get getCurrentGameAndPlayerUsecase =>
      GetCurrentGameAndPlayerUsecase(
        getLastPlayedActiveGameUsecase,
        _ref.read(personUsecasesProvider),
      );

  GetPlayerBarInfoUsecase get getPlayerBarInfoUsecase =>
      GetPlayerBarInfoUsecase(
        getCurrentGameAndPlayerUsecase,
        getPlayerBarInfoFromDataUsecase,
      );

  GetPlayerBarInfoFromDataUsecase get getPlayerBarInfoFromDataUsecase =>
      GetPlayerBarInfoFromDataUsecase(
        _ref.read(personUsecasesProvider),
      );

  WatchLastPlayedActiveGameUsecase get watchLastPlayedActiveGameUsecase =>
      WatchLastPlayedActiveGameUsecase(
        gameRepository: _ref.read(gameRepositoryProvider),
      );

  GameControllerUsecase get gameControllerUsecase => GameControllerUsecase(
        decayAndAlterPlayerStatsUsecase,
        _ref.read(eventManagerProvider),
      );

  DecayAndAlterPlayerStatsUsecase get decayAndAlterPlayerStatsUsecase =>
      DecayAndAlterPlayerStatsUsecase(_ref.read(personUsecasesProvider));
}
