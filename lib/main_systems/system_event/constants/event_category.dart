//What is an autonomous dialog event?
//Autonomous dialog events are events that interrupt the players gameplay on their own to tell the player something and/or ask for input.
//Attendable events are not autonomous dialog events since the player has to trigger it themselves by choosing to attend.
//journal events are not autonomous dialog events since they dont show a popup/dialog but run in the background.
enum EventCategory {
  unmovableAutonomousEvent,
  movableAutonomousEvent,
  attendableEvent,
  journalOnlyEvent,
}
