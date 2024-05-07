import 'package:toplife/main_systems/system_event/event_manager/event_manager.dart';

class CheckIfEventIsOpen {
  //this is checking if access to travelling to the event is available so we can communicate that specific situation through the UI
  //for example we disable only the attend button until the event is open
  bool execute({
    required int startTime,
    required int endTime,
    required int travelTime,
    required int currentTime,
  }) {
    //check if the player can start making the journey to attend the event.
    //this way we always account for the players actual travel time, even when it changes
    //attendance allowance is the max minutes before the event starts that the player can arrive at the event
    return currentTime >=
        (startTime - travelTime - EventManager.eventAttendanceAllowanceTime);
  }
}
