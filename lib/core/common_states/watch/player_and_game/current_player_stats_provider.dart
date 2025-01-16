import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

part 'current_player_stats_provider.g.dart';

@riverpod
Stream<Stats?> currentPlayerStats(CurrentPlayerStatsRef ref) async* {
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
}
