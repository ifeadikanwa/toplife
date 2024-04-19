import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/scheduled_events.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/test_events/test_event_type.dart';

class RunTestEvent {
  final ScheduledEvents _scheduledEvents;

  const RunTestEvent(this._scheduledEvents);

  Future<void> execute({
    required TestEventType testEventType,
    required int mainPlayerID,
    required int gameId,
    required int eventDay,
  }) async {
    switch (testEventType) {
      case TestEventType.playing:
        return _scheduledEvents.testEvents.playingEvent(
          gameId,
          eventDay,
          mainPlayerID,
        );
      case TestEventType.dancing:
        return _scheduledEvents.testEvents.dancingEvent(
          gameId,
          eventDay,
          mainPlayerID,
        );
      case TestEventType.singing:
        return _scheduledEvents.testEvents.singingEvent(
          gameId,
          eventDay,
          mainPlayerID,
        );
      case TestEventType.eating:
        return _scheduledEvents.testEvents.eatingEvent(
          gameId,
          eventDay,
          mainPlayerID,
        );
      case TestEventType.sayHello:
        return _scheduledEvents.testEvents.sayHelloEvent(
          gameId,
          eventDay,
          mainPlayerID,
        );
      case TestEventType.sayBye:
        return _scheduledEvents.testEvents.sayByeEvent(
          gameId,
          eventDay,
          mainPlayerID,
        );
      case TestEventType.sayGoodluck:
        return _scheduledEvents.testEvents.sayGoodluckEvent(
          gameId,
          eventDay,
          mainPlayerID,
        );
      case TestEventType.sayGoodMorning:
        return _scheduledEvents.testEvents.sayGoodMorningEvent(
          gameId,
          eventDay,
          mainPlayerID,
        );
      case TestEventType.sayGoodDay:
        return _scheduledEvents.testEvents.sayGoodDayEvent(
          gameId,
          eventDay,
          mainPlayerID,
        );
      case TestEventType.sayGoodNight:
        return _scheduledEvents.testEvents.sayGoodNightEvent(
          gameId,
          eventDay,
          mainPlayerID,
        );
      default:
    }
  }
}
