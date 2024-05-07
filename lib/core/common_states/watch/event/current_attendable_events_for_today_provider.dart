import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/event/event_dependencies_providers.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_game_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_event/domain/model/info_models/event_person_pair.dart';

part 'current_attendable_events_for_today_provider.g.dart';

@riverpod
Stream<List<EventPersonPair>> currentAttendableEventsForToday(
    CurrentAttendableEventsForTodayRef ref) async* {
  //get recent game
  final Game? currentGame = await ref.watch(currentGameProvider.future);

  //get recent events list if game is not null
  if (currentGame != null) {
    final todaysEventsStream =
        ref.watch(eventManagerProvider).watchTodaysAttendableEvents.execute(
              currentDay: currentGame.currentDay,
              gameID: currentGame.id,
            );
    await for (final eventList in todaysEventsStream) {
      yield eventList;
    }
  }
  //return empty list if game is null
  else {
    yield [];
  }
  return;
}
