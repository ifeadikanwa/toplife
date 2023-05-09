import 'dart:math';

import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/date_and_time/time.dart';
import 'package:toplife/main_systems/system_event/constants/event_type.dart';
import 'package:toplife/main_systems/system_event/domain/repository/event_repository.dart';
import 'package:toplife/main_systems/system_event/util/convert_event_type_string_to_enum.dart';

class ScheduleEvent {
  final EventRepository _eventRepository;

  const ScheduleEvent(this._eventRepository);

  //Max 
  static const int maxAutonomousDialogEventsInADay = 3;

  Future<Event> execute({
    required Event event,
  }) async {
    final EventType? eventType = convertEventTypeStringToEnum(event.eventType);

    if (eventType != null) {
      //if it is NOT an autonomous dialog event or it is an unmovable autonomous dialog event
      //(it is probably one of these: journal only event, unmovable autonomous dialog event, an attendable event)
      //Schedule it as it is
      if (unmovableAutonomousEvents.contains(eventType) ||
          !eventType.isAutonomousDialogEvent) {
        //schedule the event
        return _eventRepository.createEvent(event);
      } else {
        //it is a moveable autonomous dialog event
        return _findADayAndScheduleAutonomousDialogEvent(event, eventType);
      }
    }
    //if event type is not valid, create it anyways. it wont be processed.
    return await _eventRepository.createEvent(event);
  }

  Future<Event> _findADayAndScheduleAutonomousDialogEvent(
    Event event,
    EventType eventType,
  ) async {
    bool eventIsScheduled = false;
    int chosenDay = event.eventDay;

    //get list of names of all autonomous event types
    List<String> autonomousEventsInGame = EventType.values
        .where((eventType) => eventType.isAutonomousDialogEvent == true)
        .map((autonomousEventType) => autonomousEventType.name)
        .toList();

    //while event has not been scheduled
    while (!eventIsScheduled) {
      //get list of events for the day
      final List<Event> eventsForTheDay =
          await _eventRepository.getEventsForDay(
        day: chosenDay,
        gameID: event.gameId,
      );

      //filter the list of events for autonomous events only
      final List<Event> autonomousEventsForTheDay = eventsForTheDay
          .where((event) => autonomousEventsInGame.contains(event.eventType))
          .toList();

      //if the number of autonomous events in a day is less than the max, schedule the event
      if (autonomousEventsForTheDay.length <
         maxAutonomousDialogEventsInADay) {
        //get event start time
        //if a day is divided into (24/maxAutoDaialogInADay) parts
        //start time is a random number in one of those parts
        //it depend on what number the event will be for that day (1st, 2nd, 3rd etc)

        final int eventNumber = autonomousEventsForTheDay.length + 1;

        const int totalPartsInADay =
            Time.hoursInADay ~/ maxAutonomousDialogEventsInADay;

        final int lowerStartTimeLimit = (eventNumber - 1) * totalPartsInADay;

        final int upperStartTimeLimit = eventNumber * totalPartsInADay;

        //choose a random number in range: lower - upper
        final int startTimeHour =
            Random().nextInt(upperStartTimeLimit - lowerStartTimeLimit) +
                lowerStartTimeLimit;

        final int startTimeInMinutes = startTimeHour * Time.minutesInAnHour;

        //end the loop
        eventIsScheduled = true;

        //schedule the event for the day and start time
        return _eventRepository.createEvent(
          event.copyWith(
            eventDay: chosenDay,
            startTime: Value(startTimeInMinutes),
            endTime: const Value(null),
          ),
        );
      }
      //else move on and try to schedule on the next day
      else {
        chosenDay++;
      }
    }

    //you shouldnt get here but if you do
    return _eventRepository.createEvent(event);
  }
}
