import 'package:flutter/material.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_event/domain/repository/event_repository.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_manager.dart';

class RunScheduledEventsForTheDay {
  final EventRepository _eventRepository;
  final EventManager _eventManager;

  const RunScheduledEventsForTheDay(this._eventRepository, this._eventManager);

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
    final List<Event> journalOnlyEvents = unperformedEventsForTheDay
        .where((event) => event.journalEntryOnly == true)
        .toList();

    //run them all
    for (var event in journalOnlyEvents) {
      if (context.mounted) {
        await _eventManager.runEvent(
          playerID,
          event.copyWith(eventDay: dayToLogEventTo),
          context,
        );
      }
    }

    //get all the untimed non-journal events
    final List<Event> untimedNonJournalEvents = unperformedEventsForTheDay
        .where((event) =>
            event.journalEntryOnly == false &&
            event.startTime == null &&
            event.endTime == null)
        .toList();

    //run them all
    for (var event in untimedNonJournalEvents) {
      if (context.mounted) {
        await _eventManager.runEvent(
          playerID,
          event.copyWith(eventDay: dayToLogEventTo),
          context,
        );
      }
    }

    //get all the start time before or equal to current time but no end time journal events
    final List<Event> startTimedNonJournalEvents = unperformedEventsForTheDay
        .where((event) =>
            event.journalEntryOnly == false &&
            event.startTime != null &&
            event.startTime! <= currentTimeInMinutes &&
            event.endTime == null)
        .toList();

    //run them all
    for (var event in startTimedNonJournalEvents) {
      if (context.mounted) {
        await _eventManager.runEvent(
          playerID,
          event.copyWith(eventDay: dayToLogEventTo),
          context,
        );
      }
    }
  }
}
