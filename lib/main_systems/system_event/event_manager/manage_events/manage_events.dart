import 'package:toplife/main_systems/system_event/domain/repository/event_repository.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_manager.dart';
import 'package:toplife/main_systems/system_event/event_manager/manage_events/managers/report_unattended_events_to_days_journal.dart';
import 'package:toplife/main_systems/system_event/event_manager/manage_events/managers/run_scheduled_events_for_the_day.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';

class ManageEvents {
  final EventRepository _eventRepository;
  final EventManager _eventManager;
  final PersonUsecases _personUsecases;
  final JournalUsecases _journalUsecases;
  final RelationshipUsecases _relationshipUsecases;

  const ManageEvents(
    this._eventRepository,
    this._eventManager,
    this._personUsecases,
    this._journalUsecases,
    this._relationshipUsecases,
  );

  RunScheduledEventsForTheDay get runScheduledEventsForTheDay =>
      RunScheduledEventsForTheDay(
        _eventRepository,
        _eventManager,
      );

  ReportUnattendedEventsToDaysJournal get reportUnattendedEventsToDaysJournal =>
      ReportUnattendedEventsToDaysJournal(
        _eventRepository,
        _journalUsecases,
        _personUsecases,
        _relationshipUsecases,
      );
}
