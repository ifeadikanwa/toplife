import 'package:flutter/material.dart';
import 'package:toplife/game_manager/domain/model/game.dart';
import 'package:toplife/game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/main_systems/system_event/constants/event_type.dart';
import 'package:toplife/main_systems/system_event/domain/model/event.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/event_person_pair.dart';
import 'package:toplife/main_systems/system_event/domain/repository/event_repository.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_scheduler.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/scheduled_events.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/transportation_usecases.dart';

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
  final GameUsecases _gameUsecases;
  final TransportationUsescases _transportationUsescases;

  const EventManager({
    required RelationshipUsecases relationshipUsecases,
    required PersonUsecases personUsecases,
    required AgeUsecases ageUsecases,
    required JournalUsecases journalUsecases,
    required ShopAndStorageUsecases shopAndStorageUsecases,
    required EventRepository eventRepository,
    required GameUsecases gameUsecases,
    required TransportationUsescases transportationUsescases,
  })  : _relationshipUsecases = relationshipUsecases,
        _personUsecases = personUsecases,
        _ageUsecases = ageUsecases,
        _journalUsecases = journalUsecases,
        _shopAndStorageUsecases = shopAndStorageUsecases,
        _eventRepository = eventRepository,
        _gameUsecases = gameUsecases,
        _transportationUsescases = transportationUsescases;

  EventScheduler get _eventScheduler => EventScheduler(
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

  static const int eventAttendanceAllowanceTime = 30;

  void runEvent(int mainPlayerID, Event event, BuildContext context) {
    final eventTypeEnum = convertEventTypeStringToEnum(event.eventType);

    switch (eventTypeEnum) {
      case EventType.birthday:
        _scheduledEvents.birthdayEvent.execute(
          mainPlayerID,
          event,
        );
        break;
      case EventType.birthdayParty:
        _scheduledEvents.birthdayPartyEvent.execute(
          context: context,
          birthdayEvent: event,
          mainPlayerID: mainPlayerID,
        );
        break;
      case EventType.death:
        _scheduledEvents.deathEvent.execute(
          context: context,
          deathEvent: event,
          mainPlayerID: mainPlayerID,
        );
        break;
      case EventType.funeral:
        _scheduledEvents.funeralEvent.execute(
          context: context,
          funeralEvent: event,
          mainPlayerID: mainPlayerID,
        );
        break;
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
        personID: event.mainPersonID,
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

 static bool checkIfEventCanStillBeAttended({
    required int startTime,
    required int endTime,
    required int travelTime,
    required int currentTime,
  }) {
    //if the event duration is greater than the travel time
    return (endTime - currentTime) > travelTime;
  }

  static EventType? convertEventTypeStringToEnum(String eventType) {
    final eventTypeMap = EventType.values.asNameMap();
    return eventTypeMap[eventType];
  }
}
