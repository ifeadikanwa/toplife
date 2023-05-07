import 'package:toplife/main_systems/system_event/domain/repository/event_repository.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_manager.dart';
import 'package:toplife/main_systems/system_event/event_manager/manage_events/managers/run_scheduled_events_for_the_day.dart';

class ManageEvents {
  final EventRepository _eventRepository;
  final EventManager _eventManager;

  const ManageEvents(
    this._eventRepository,
    this._eventManager,
  );

  RunScheduledEventsForTheDay get runScheduledEventsForTheDay =>
      RunScheduledEventsForTheDay(
        _eventRepository,
        _eventManager,
      );
}
