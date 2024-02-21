import 'package:flutter/material.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/scheduled_events.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/test_events/test_event_type.dart';

class RunTestEvent {
  final ScheduledEvents _scheduledEvents;

  const RunTestEvent(this._scheduledEvents);

  Future<void> execute({
    required int mainPlayerID,
    required Event event,
    required BuildContext context,
  }) async {
    final testEventTypeMap = TestEventType.values.asNameMap();
    final TestEventType? testEventType = testEventTypeMap[event.eventType];

    switch (testEventType) {
      case TestEventType.playing:
        return _scheduledEvents.testEvents.playingEvent(
          event,
          mainPlayerID,
        );
      case TestEventType.dancing:
        return _scheduledEvents.testEvents.dancingEvent(
          event,
          mainPlayerID,
        );
      case TestEventType.singing:
        return _scheduledEvents.testEvents.singingEvent(
          event,
          mainPlayerID,
        );
      case TestEventType.eating:
        return _scheduledEvents.testEvents.eatingEvent(
          event,
          mainPlayerID,
        );
      case TestEventType.sayHello:
        return _scheduledEvents.testEvents.sayHelloEvent(
          event,
          mainPlayerID,
          context,
        );
      case TestEventType.sayBye:
        return _scheduledEvents.testEvents.sayByeEvent(
          event,
          mainPlayerID,
          context,
        );
      case TestEventType.sayGoodluck:
        return _scheduledEvents.testEvents.sayGoodluckEvent(
          event,
          mainPlayerID,
          context,
        );
      case TestEventType.sayGoodMorning:
        return _scheduledEvents.testEvents.sayGoodMorningEvent(
          event,
          mainPlayerID,
          context,
        );
      case TestEventType.sayGoodDay:
        return _scheduledEvents.testEvents.sayGoodDayEvent(
          event,
          mainPlayerID,
          context,
        );
      case TestEventType.sayGoodNight:
        return _scheduledEvents.testEvents.sayGoodNightEvent(
          event,
          mainPlayerID,
          context,
        );
      default:
    }
  }
}
