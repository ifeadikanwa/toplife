import 'package:toplife/main_systems/system_event/constants/event_type.dart';
import 'package:toplife/main_systems/system_event/domain/model/event.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_manager.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

String getAttendableEventTitle({
  required Person eventMainPerson,
  required Event event,
}) {
  final EventType? eventType =
      EventManager.convertEventTypeStringToEnum(event.eventType);
  final eventName = eventType?.presentationName ?? "-";

  return "${eventMainPerson.firstName}'s $eventName";
}
