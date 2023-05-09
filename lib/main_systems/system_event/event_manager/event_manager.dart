import 'package:flutter/material.dart';
import 'package:toplife/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/main_systems/system_event/constants/event_type.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/event_person_pair.dart';
import 'package:toplife/main_systems/system_event/domain/repository/event_repository.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_scheduler/event_schedulers.dart';
import 'package:toplife/main_systems/system_event/event_manager/manage_events/manage_events.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/scheduled_events.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/test_events/test_event_type.dart';
import 'package:toplife/main_systems/system_event/util/convert_event_type_string_to_enum.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';

//The main point of contact for everything event related.
//other systems outside of the event system should only have access to this class.
//-run event
//-schedule new person events -> takes in relationship to you & other needed info
//-run random events
class EventManager {
  final RelationshipUsecases _relationshipUsecases;
  final PersonUsecases _personUsecases;
  final AgeUsecases _ageUsecases;
  final JournalUsecases _journalUsecases;
  final ShopAndStorageUsecases _shopAndStorageUsecases;
  final EventRepository _eventRepository;

  const EventManager({
    required RelationshipUsecases relationshipUsecases,
    required PersonUsecases personUsecases,
    required AgeUsecases ageUsecases,
    required JournalUsecases journalUsecases,
    required ShopAndStorageUsecases shopAndStorageUsecases,
    required EventRepository eventRepository,
  })  : _relationshipUsecases = relationshipUsecases,
        _personUsecases = personUsecases,
        _ageUsecases = ageUsecases,
        _journalUsecases = journalUsecases,
        _shopAndStorageUsecases = shopAndStorageUsecases,
        _eventRepository = eventRepository;

  EventSchedulers get _eventScheduler => EventSchedulers(
        _eventRepository,
        _ageUsecases,
      );

  ScheduledEvents get _scheduledEvents => ScheduledEvents(
        _relationshipUsecases,
        _personUsecases,
        _ageUsecases,
        _journalUsecases,
        _shopAndStorageUsecases,
        _eventScheduler,
        _eventRepository,
      );

  ManageEvents get manageEvents => ManageEvents(
        _eventRepository,
        this,
        _personUsecases,
        _journalUsecases,
        _relationshipUsecases,
      );

  static const int eventAttendanceAllowanceTime = 30;

  Future<void> runTestEvent(
    int mainPlayerID,
    Event event,
    BuildContext context,
  ) async {
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

  Future<void> runEvent(
    int mainPlayerID,
    Event event,
    BuildContext context,
  ) async {
    final eventTypeEnum = convertEventTypeStringToEnum(event.eventType);
    switch (eventTypeEnum) {
      case EventType.birthday:
        return _scheduledEvents.birthdayEvent.execute(
          mainPlayerID,
          event,
        );

      case EventType.birthdayParty:
        return _scheduledEvents.birthdayPartyEvent.execute(
          context: context,
          birthdayEvent: event,
          mainPlayerID: mainPlayerID,
        );

      case EventType.death:
        return _scheduledEvents.deathEvent.execute(
          context: context,
          deathEvent: event,
          mainPlayerID: mainPlayerID,
        );

      case EventType.funeral:
        return _scheduledEvents.funeralEvent.execute(
          context: context,
          funeralEvent: event,
          mainPlayerID: mainPlayerID,
        );

      case EventType.schoolAdmission:
        break;
      case EventType.engagement:
        break;
      case EventType.wedding:
        break;
      case EventType.graduation:
        break;
      case EventType.employment:
        break;
      default:
        //do nothing for now
        break;
    }
  }

  Future<List<EventPersonPair>> getTodaysAttendableEvents({
    required int currentDay,
    required int gameID,
  }) async {
    List<EventPersonPair> todaysAttendableEvents = [];

    final List<Event> events = await _eventRepository.getAttendableEventsForDay(
      day: currentDay,
      gameID: gameID,
    );

    for (var event in events) {
      final Person? mainPerson = await _personUsecases.getPersonUsecase.execute(
        personID: event.mainPersonId,
      );

      if (mainPerson != null) {
        todaysAttendableEvents.add(
          EventPersonPair(
            event: event,
            person: mainPerson,
          ),
        );
      }
    }

    return todaysAttendableEvents;
  }

  Stream<List<EventPersonPair>> watchTodaysAttendableEvents({
    required int currentDay,
    required int gameID,
  }) async* {
    final eventsStream = _eventRepository.watchAttendableEventsForDay(
      day: currentDay,
      gameID: gameID,
    );

    await for (final events in eventsStream) {
      List<EventPersonPair> todaysAttendableEvents = [];

      for (var event in events) {
        final Person? mainPerson =
            await _personUsecases.getPersonUsecase.execute(
          personID: event.mainPersonId,
        );

        if (mainPerson != null) {
          todaysAttendableEvents.add(
            EventPersonPair(
              event: event,
              person: mainPerson,
            ),
          );
        }
      }

      yield todaysAttendableEvents;
    }
  }

  //this is checking if access to travelling to the event is available so we can communicate that specific situation through the UI
  //for example we disable only the attend button until the event is open
  static bool checkIfEventIsOpen({
    required int startTime,
    required int endTime,
    required int travelTime,
    required int currentTime,
  }) {
    //check if the player can start making the journey to attend the event.
    //this way we always account for the players actual travel time, even when it changes
    return currentTime >=
        (startTime - travelTime - eventAttendanceAllowanceTime);
  }

//this is checking if the event has passed so we can communicate that specific situation through the UI
  static bool checkIfEventCanStillBeAttended({
    required int startTime,
    required int endTime,
    required int travelTime,
    required int currentTime,
  }) {
    //if the event duration is greater than the travel time
    return (endTime - currentTime) > travelTime;
  }
}
