import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/journal/journal_dependencies_providers.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_game_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

final currentJournalForTodayProvider = StreamProvider<Journal?>((ref) async* {
  //get recent
  final Game? currentGame = await ref.watch(currentGameProvider.future);

  //yield
  if (currentGame != null) {
    final Stream<Journal?> todaysJournalStream =
        ref.watch(journalUsecasesProvider).watchJournalUsecase.execute(
              gameID: currentGame.id,
              day: currentGame.currentDay,
            );

    await for (final journal in todaysJournalStream) {
      yield journal;
    }
  } else {
    yield null;
  }
});
