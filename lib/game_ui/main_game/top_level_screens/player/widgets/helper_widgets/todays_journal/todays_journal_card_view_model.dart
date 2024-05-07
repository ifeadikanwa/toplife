import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/journal/journal_dependencies_providers.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_game_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

part 'todays_journal_card_view_model.g.dart';

@riverpod
Stream<Journal?> todaysJournalCardViewModel(
    TodaysJournalCardViewModelRef ref) async* {
  //get recent
  final int? currentGameId = await ref.watch(
    currentGameProvider.selectAsync((data) => data?.id),
  );
  final int? currentDay = await ref.watch(
    currentGameProvider.selectAsync((data) => data?.currentDay),
  );

  //yield
  if (currentGameId != null && currentDay != null) {
    final Stream<Journal?> todaysJournalStream =
        ref.watch(journalUsecasesProvider).watchJournalUsecase.execute(
              gameID: currentGameId,
              day: currentDay,
            );

    await for (final journal in todaysJournalStream) {
      yield journal;
    }
  } else {
    yield null;
  }
}
