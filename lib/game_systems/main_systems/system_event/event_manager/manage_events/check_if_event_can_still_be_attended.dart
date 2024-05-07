import 'package:toplife/game_systems/main_systems/system_event/event_manager/event_manager.dart';

class CheckIfEventCanStillBeAttended {
  //this is checking if the event has passed so we can communicate that specific situation through the UI
  bool execute({
    required int startTime,
    required int endTime,
    required int travelTime,
    required int currentTime,
  }) {
    //if the event duration + min attendance time is greater than the travel time
    //this means that IF after we take out travel time from event duration the time left is at least the min attendance time,
    // it can still be attended.
    final int eventDuration = (endTime - currentTime);
    return (eventDuration + EventManager.eventMinimumAttendanceTime) >
        travelTime;
  }
}
