import 'package:toplife/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/main_systems/system_event/domain/repository/event_repository.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_scheduler.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/birthday/birthday_event.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';

class ScheduledEvents {
  //getter for all scheduled events
  //provides them with all needed dependencies

  final RelationshipUsecases _relationshipUsecases;
  final PersonUsecases _personUsecases;
  final AgeUsecases _ageUsecases;
  final JournalUsecases _journalUsecases;
  final EventScheduler _eventScheduler;
  final EventRepository _eventRepository;

  const ScheduledEvents(
    this._relationshipUsecases,
    this._personUsecases,
    this._ageUsecases,
    this._journalUsecases,
    this._eventScheduler,
    this._eventRepository,
  );

  BirthdayEvent get birthdayEvent => BirthdayEvent(
        _relationshipUsecases,
        _personUsecases,
        _ageUsecases,
        _journalUsecases,
        _eventScheduler,
        _eventRepository,
      );
}
