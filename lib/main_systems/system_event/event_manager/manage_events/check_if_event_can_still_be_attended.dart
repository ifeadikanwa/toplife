class CheckIfEventCanStillBeAttended {
  //this is checking if the event has passed so we can communicate that specific situation through the UI
  bool execute({
    required int startTime,
    required int endTime,
    required int travelTime,
    required int currentTime,
  }) {
    //if the event duration is greater than the travel time
    return (endTime - currentTime) > travelTime;
  }
}
