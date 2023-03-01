import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/watch/event/current_attendable_events_for_today_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_game_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_manager/presentation/game_states.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/event_person_pair.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_manager.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/get_travel_time_usecase.dart';

//provider
final eventSectionViewModelProvider = StateNotifierProvider.autoDispose<
    EventSectionViewModel, AsyncValue<List<EventPersonPair>>>((ref) {
  //get recent
  final Future<Game?> currentGameFuture = ref.watch(currentGameProvider.future);
  final Future<List<EventPersonPair>> attendableEventsForTodayFuture =
      ref.watch(currentAttendableEventsForTodayProvider.future);

  return EventSectionViewModel(
    currentGameFuture: currentGameFuture,
    attendableEventsForTodayFuture: attendableEventsForTodayFuture,
    getTravelTimeUsecase:
        ref.watch(transportationUsecaseProvider).getTravelTimeUsecase,
  );
});

//view model
class EventSectionViewModel
    extends StateNotifier<AsyncValue<List<EventPersonPair>>> {
  final GetTravelTimeUsecase _getTravelTimeUsecase;

  late final Game? _currentGame;
  late final int? _travelTime;

  EventSectionViewModel({
    required Future<Game?> currentGameFuture,
    required Future<List<EventPersonPair>> attendableEventsForTodayFuture,
    required GetTravelTimeUsecase getTravelTimeUsecase,
  })  : _getTravelTimeUsecase = getTravelTimeUsecase,
        super(const AsyncLoading()) {
    _fetch(
        currentGameFuture: currentGameFuture,
        attendableEventsForTodayFuture: attendableEventsForTodayFuture);
  }

  Future<void> _fetch({
    required Future<Game?> currentGameFuture,
    required Future<List<EventPersonPair>> attendableEventsForTodayFuture,
  }) async {
    //set all values
    _currentGame = await currentGameFuture;

    _travelTime = (_currentGame == null)
        ? null
        : await _getTravelTimeUsecase.execute(
            personID: _currentGame!.currentPlayerID,
          );

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => attendableEventsForTodayFuture);
  }

  bool checkIfEventIsOpen(Event event) {
    if (_currentGame != null &&
        _travelTime != null &&
        event.startTime != null &&
        event.endTime != null) {
      return EventManager.checkIfEventIsOpen(
        startTime: event.startTime!,
        endTime: event.endTime!,
        travelTime: _travelTime!,
        currentTime: _currentGame!.currentTimeInMinutes,
      );
    }

    return false;
  }

  bool checkIfEventCanStillBeAttended(Event event) {
    if (_currentGame != null &&
        _travelTime != null &&
        event.startTime != null &&
        event.endTime != null) {
      return EventManager.checkIfEventCanStillBeAttended(
        startTime: event.startTime!,
        endTime: event.endTime!,
        travelTime: _travelTime!,
        currentTime: _currentGame!.currentTimeInMinutes,
      );
    }

    return false;
  }
}
