import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/event/event_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/transportation/transportation_dependencies_providers.dart';
import 'package:toplife/core/common_states/watch/event/current_attendable_events_for_today_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_game_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
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
  //get recent
  final Game? currentGame = await ref.watch(currentGameProvider.future);

  final List<EventPersonPair> attendableEventsForToday =
      await ref.watch(currentAttendableEventsForTodayProvider.future);

  final GetLandTravelTimeUsecase getLandTravelTimeUsecase =
      ref.watch(transportationUsecasesProvider).getLandTravelTimeUsecase;

  final EventManager eventManager = ref.watch(eventManagerProvider);

  //await game
  //if game = null
  //set data to empty list
  //else
  //create an empty eventItem list
  //await the list of attendable events
  //for each
  //await the travel time
  //create an event item obj
  //add the object to the list

  //if the current game and current player is valid, get all the information the ui needs

  final int? currentPlayerId = currentGame?.currentPlayerID;

  if (currentGame != null && currentPlayerId != null) {
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

        //add the event item to list
        eventItems.add(
          EventItem(
            eventPersonPair: attendableEvent,
            eventIsOpen: eventManager.checkIfEventIsOpen.execute(
              startTime: attendableEvent.event.startTime!,
              endTime: attendableEvent.event.endTime!,
              travelTime: travelTime,
              currentTime: currentGame.currentTimeInMinutes,
            ),
            eventCanStillBeAttended:
                eventManager.checkIfEventCanStillBeAttended.execute(
              startTime: attendableEvent.event.startTime!,
              endTime: attendableEvent.event.endTime!,
              travelTime: travelTime,
              currentTime: currentGame.currentTimeInMinutes,
            ),
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
