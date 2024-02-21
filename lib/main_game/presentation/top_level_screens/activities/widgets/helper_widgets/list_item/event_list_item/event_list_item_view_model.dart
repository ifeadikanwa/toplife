import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/event/event_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/game/game_dependencies_providers.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_manager/domain/usecases/get_last_played_active_game_usecase.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_manager.dart';
import 'package:toplife/main_systems/system_event/util/get_attendable_event_time.dart';
import 'package:toplife/main_systems/system_event/util/get_attendable_event_title.dart';

//provider
final eventListItemViewModelProvider = Provider((ref) {
  //create viewmodel instance
  final eventListItemViewModel = EventListItemViewModel(
    ref.watch(gameUsecasesProvider).getLastPlayedActiveGameUsecase,
    ref.watch(eventManagerProvider),
  );

  //return instance
  return eventListItemViewModel;
});

//view model
class EventListItemViewModel {
  final GetLastPlayedActiveGameUsecase _getLastPlayedActiveGameUsecase;
  final EventManager _eventManager;

  const EventListItemViewModel(
    this._getLastPlayedActiveGameUsecase,
    this._eventManager,
  );

  void attendEvent(
    Event event,
    BuildContext context,
  ) async {
    final Game? currentGame = await _getLastPlayedActiveGameUsecase.execute();

    if (currentGame != null && context.mounted) {
      //if we have a valid current player
      final int? currentPlayerId = currentGame.currentPlayerID;

      if (currentPlayerId != null) {
        _eventManager.runEvent.execute(
          mainPlayerID: currentPlayerId,
          event: event,
          context: context,
        );
      }
    }
  }

  String getEventTitle({
    required Person eventMainPerson,
    required Event event,
  }) =>
      getAttendableEventTitle(
        eventMainPerson: eventMainPerson,
        event: event,
      );

  String getEventTime({
    required Event event,
  }) =>
      getAttendableEventTime(event: event);

  String getEventLocation({
    required Person eventMainPerson,
  }) {
    return "Location: ${eventMainPerson.currentState}, ${eventMainPerson.currentCountry}";
  }

  bool checkIfEventButtonIsUnavailable({
    required bool eventIsOpen,
    required bool eventCanStillBeAttended,
  }) =>
      (!eventIsOpen || !eventCanStillBeAttended);
}
