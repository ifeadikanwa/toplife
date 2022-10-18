import 'package:flutter/material.dart';
import 'package:toplife/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/main_systems/system_event/constants/event_type.dart';
import 'package:toplife/main_systems/system_event/domain/model/event.dart';
import 'package:toplife/main_systems/system_event/domain/repository/event_repository.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_scheduler.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/scheduled_events.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
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

  static EventType? convertEventTypeStringToEnum(String eventType) {
    final eventTypeMap = EventType.values.asNameMap();
    return eventTypeMap[eventType];
  }
}
