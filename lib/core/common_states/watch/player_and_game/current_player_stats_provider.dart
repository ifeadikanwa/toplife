import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_manager/presentation/game_states.dart';

final currentPlayerStatsProvider = StreamProvider<Stats?>((ref) async* {
  //watch for change in player ID only
  final int? currentPlayerID =
      await ref.watch(currentPlayerProvider.selectAsync(
    (currentPlayer) => currentPlayer?.id,
  ));

  //yield
  if (currentPlayerID != null) {
    final currentPlayerStatsStream = ref
        .watch(personUsecasesProvider)
        .watchPersonStatsUsecase
        .execute(personID: currentPlayerID);

    await for (final stats in currentPlayerStatsStream) {
      yield stats;
    }
  } else {
    yield null;
  }
});
