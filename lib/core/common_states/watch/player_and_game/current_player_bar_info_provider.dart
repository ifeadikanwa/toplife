import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_game_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_manager/domain/model/info_models/player_bar_info.dart';
import 'package:toplife/game_manager/presentation/game_states.dart';

final currentPlayerBarInfoProvider = FutureProvider<PlayerBarInfo>((ref) async {

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
});
