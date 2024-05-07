import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/event/event_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/transportation/transportation_dependencies_providers.dart';
import 'package:toplife/core/common_states/watch/event/current_attendable_events_for_today_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_game_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/event_item.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/event_person_pair.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_manager.dart';
import 'package:toplife/main_systems/system_transportation/constants/transportation_default.dart';
import 'package:toplife/main_systems/system_transportation/domain/model/travel_detail.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/get_land_travel_time_usecase.dart';

part 'event_section_view_model.g.dart';

@riverpod
Future<List<EventItem>> eventSectionViewModel(
  EventSectionViewModelRef ref,
) async {
  //get
  final int? currentGameTimeInMinutes = await ref.watch(
    currentGameProvider.selectAsync((data) => data?.currentTimeInMinutes),
  );

  final int? currentPlayerId = await ref.watch(
    currentPlayerProvider.selectAsync((data) => data?.id),
  );

  final List<EventPersonPair> attendableEventsForToday =
      await ref.watch(currentAttendableEventsForTodayProvider.future);

  final GetLandTravelTimeUsecase getLandTravelTimeUsecase =
      ref.watch(transportationUsecasesProvider).getLandTravelTimeUsecase;

  final EventManager eventManager = ref.watch(eventManagerProvider);

  //if we have a valid player id and game time
  if (currentGameTimeInMinutes != null && currentPlayerId != null) {
    List<EventItem> eventItems = [];

    for (var attendableEvent in attendableEventsForToday) {
      //check that start and end time are not null so we can promise that it's not inside the loop.
      if (attendableEvent.event.startTime != null &&
          attendableEvent.event.endTime != null) {
        //get the travel time for this specific event
        final int travelTime = await getLandTravelTimeUsecase.execute(
          travellerPersonID: currentPlayerId,
          travelDetail: TravelDetail(
            destinationCountryString: attendableEvent.person.currentCountry,
            destinationStateString: attendableEvent.person.currentState,
            destinationSettlementString:
                TransportationDefault.destinationSettlement.name,
          ),
        );

        //check if this event is open
        final bool eventIsOpen = eventManager.checkIfEventIsOpen.execute(
          startTime: attendableEvent.event.startTime!,
          endTime: attendableEvent.event.endTime!,
          travelTime: travelTime,
          currentTime: currentGameTimeInMinutes,
        );

        //check if this event can still be attended
        final bool eventCanStillBeAttended =
            eventManager.checkIfEventCanStillBeAttended.execute(
          startTime: attendableEvent.event.startTime!,
          endTime: attendableEvent.event.endTime!,
          travelTime: travelTime,
          currentTime: currentGameTimeInMinutes,
        );

        //add the event item to list
        eventItems.add(
          EventItem(
            eventPersonPair: attendableEvent,
            eventIsOpen: eventIsOpen,
            eventCanStillBeAttended: eventCanStillBeAttended,
          ),
        );
      }
    }
    //update the state with new list
    return eventItems;
  }
  //else if game is null or there is no valid current player, say there are no events
  else {
    return [];
  }
}
