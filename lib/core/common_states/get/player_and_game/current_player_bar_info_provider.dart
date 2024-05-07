import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/game/game_dependencies_providers.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_game_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/game_manager/domain/model/info_models/player_bar_info.dart';

part 'current_player_bar_info_provider.g.dart';

@riverpod
Future<PlayerBarInfo> currentPlayerBarInfo(
  CurrentPlayerBarInfoRef ref,
) async {
  //get recent data
  final Game? currentGame = await ref.watch(currentGameProvider.future);
  final Person? currentPlayer = await ref.watch(currentPlayerProvider.future);

  return ref
      .watch(gameUsecasesProvider)
      .getPlayerBarInfoFromDataUsecase
      .execute(
        currentGame: currentGame,
        currentPlayer: currentPlayer,
      );
}
