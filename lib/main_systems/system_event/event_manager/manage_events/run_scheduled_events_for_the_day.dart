import 'package:flutter/material.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_event/constants/event_category.dart';
import 'package:toplife/main_systems/system_event/domain/repository/event_repository.dart';
import 'package:toplife/main_systems/system_event/event_manager/manage_events/run_event.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/util/event_util.dart';

class RunScheduledEventsForTheDay {
  final EventRepository _eventRepository;
  final RunEvent _runEvent;

  const RunScheduledEventsForTheDay(
    this._eventRepository,
    this._runEvent,
  );

  Future<void> execute({
    required int gameID,
    required int playerID,
    required int dayToCheckForEvents,
    required int dayToLogEventTo, //journal entry day
    required int currentTimeInMinutes,
    required BuildContext context,
  }) async {
    //this is the heart of daily events
    //We run the unperformed scheduled events for the day
    //this class will be called multiple times in a day

    //get all the unperformed events for the day

    final List<Event> unperformedEventsForTheDay =
        await _eventRepository.getUnperformedEventsForDay(
      day: dayToCheckForEvents,
      gameID: gameID,
    );

    //get all the journal only events
    final List<String> allGameJournalOnlyEventTypes =
        EventUtil.getEventTypeNamesInCategory(EventCategory.journalOnlyEvent);

    final List<Event> journalOnlyEvents = unperformedEventsForTheDay
        .where(
          (event) => allGameJournalOnlyEventTypes.contains(
            event.eventType,
          ),
        )
        .toList();

    //run them all
    for (var event in journalOnlyEvents) {
      if (context.mounted) {
        await _runEvent.execute(
          mainPlayerID: playerID,
          event: event.copyWith(eventDay: dayToLogEventTo),
          context: context,
        );
      }
    }

    //get all the untimed events
    //we want to catch any strays, events that aren't journal only but also have not time set at all
    final List<Event> untimedEvents = unperformedEventsForTheDay
        .where((event) =>
            !(journalOnlyEvents.contains(event)) &&
            event.startTime == null &&
            event.endTime == null)
        .toList();

    //run them all
    for (var event in untimedEvents) {
      if (context.mounted) {
        await _runEvent.execute(
          mainPlayerID: playerID,
          event: event.copyWith(eventDay: dayToLogEventTo),
          context: context,
        );
      }
    }

    //get all the start time before or equal to current time but no end time events
    //I set start time on dialog events to space them out so there is a better chance they don't overwhelm the player
    final List<Event> startTimedEvents = unperformedEventsForTheDay
        .where((event) =>
            event.startTime != null &&
            event.startTime! <= currentTimeInMinutes &&
            event.endTime == null)
        .toList();

    //run them all
    for (var event in startTimedEvents) {
      if (context.mounted) {
        await _runEvent.execute(
          mainPlayerID: playerID,
          event: event.copyWith(eventDay: dayToLogEventTo),
          context: context,
        );
      }
    }
  }
}
