import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_event/constants/event_type.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/attend_event_detail.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/event_text.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/scheduled_events.dart';
import 'package:toplife/main_systems/system_event/util/convert_event_type_string_to_enum.dart';

class RunEvent {
  final ScheduledEvents _scheduledEvents;

  const RunEvent(this._scheduledEvents);

  //Attendable events go through a dialog that collects data from the player before getting here
  Future<void> executeAttendable({
    required Event event,
    required Person eventMainPerson,
    required EventText eventText,
    required bool isParty,
    required EventType eventType,
    required AttendEventDetail attendEventDetail,
  }) async {
    final eventTypeEnum = convertEventTypeStringToEnum(event.eventType);

    switch (eventTypeEnum) {
      //
      //Attendable events
      case EventType.birthdayParty:
      case EventType.funeral:
        return _scheduledEvents.attendEvent.perform(
          event: event,
          eventMainPerson: eventMainPerson,
          eventText: eventText,
          isParty: isParty,
          eventType: eventType,
          attendEventDetail: attendEventDetail,
        );
      case EventType.wedding:
        break;
      case EventType.graduation:
        break;

      default:
        break;
    }
  }

  //events that are not attendable only the event object
  Future<void> executeNonAttendable({
    required Event event,
  }) async {
    final eventTypeEnum = convertEventTypeStringToEnum(event.eventType);
    if (eventTypeEnum != null) {
      switch (eventTypeEnum) {
        //NON-attendable events
        case EventType.birthday:
          return _scheduledEvents.birthdayEvent.perform(
            event: event,
          );
        case EventType.death:
          return _scheduledEvents.deathEvent.perform(
            event: event,
          );
        case EventType.schoolAdmission:
          break;
        case EventType.engagement:
          break;
        case EventType.employment:
          break;
        case EventType.askForSchoolTuition:
          break;

        default:
          break;
      }
    }
  }
}
