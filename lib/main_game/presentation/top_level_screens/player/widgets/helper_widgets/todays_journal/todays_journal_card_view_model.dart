import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/watch/journal/current_journal_for_today_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

//provider
final todaysJournalCardViewModelProvider =
    StateNotifierProvider<TodaysJournalCardViewModel, AsyncValue<Journal?>>(
        (ref) {
  //get recent future
  final currentJournalForTodayFuture =
      ref.watch(currentJournalForTodayProvider.future);


  return TodaysJournalCardViewModel(
    currentJournalForTodayFuture: currentJournalForTodayFuture,
  );
});

class TodaysJournalCardViewModel extends StateNotifier<AsyncValue<Journal?>> {
  TodaysJournalCardViewModel({
    required Future<Journal?> currentJournalForTodayFuture,
  }) : super(const AsyncLoading()) {
    _fetch(currentJournalForTodayFuture);
  }

  void _fetch(Future<Journal?> currentJournalForTodayFuture) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => currentJournalForTodayFuture);
  }
}
