import 'package:toplife/game_systems/main_systems/system_event/event_manager/event_manager.dart';

class CheckIfEventCanStillBeAttended {
  //this is checking if the event has passed so we can communicate that specific situation through the UI
  bool execute({
    required int startTime,
    required int endTime,
    required int travelTime,
    required int currentTime,
  }) {
    //if we look at the remaining event duration(taking current time into consideration),
    // then we take the travel time out of the duration,
    //if whatever time is left is equal to or greater than the min time the player has to attend the event for
    // then it can still be attended.
    final int eventDuration = (endTime - currentTime);
    final int eventDurationAfterTravelling = eventDuration - travelTime;

    return eventDurationAfterTravelling >=
        EventManager.eventMinimumAttendanceTime;
  }
}
