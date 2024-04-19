import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_event/constants/event_type.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/scheduled_events.dart';
import 'package:toplife/main_systems/system_event/util/convert_event_type_string_to_enum.dart';

class RunEvent {
  final ScheduledEvents _scheduledEvents;

  const RunEvent(this._scheduledEvents);

  Future<void> execute({
    required int mainPlayerID,
    required Event event,
  }) async {
    final eventTypeEnum = convertEventTypeStringToEnum(event.eventType);
    if (eventTypeEnum != null) {
      switch (eventTypeEnum) {
        //NON-attendable events
        case EventType.birthday:
          return _scheduledEvents.birthdayEvent.execute(
            mainPlayerID,
            event,
          );
        case EventType.death:
          return _scheduledEvents.deathEvent.execute(
            deathEvent: event,
            mainPlayerID: mainPlayerID,
          );
        case EventType.schoolAdmission:
          break;
        case EventType.engagement:
          break;
        case EventType.employment:
          break;
        case EventType.askForSchoolTuition:
          break;

        //
        //Attendable events
        case EventType.birthdayParty:
        case EventType.funeral:
          return _scheduledEvents.attendEvent.execute(
            event: event,
            mainPlayerID: mainPlayerID,
          );

        case EventType.wedding:
          break;
        case EventType.graduation:
          break;
      }
    }
  }
}
