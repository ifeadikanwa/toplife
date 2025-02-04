import 'package:toplife/game_systems/main_systems/system_event/constants/event_type.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_event/util/convert_event_type_string_to_enum.dart';

String getAttendableEventTitle({
  required Person eventMainPerson,
  required Event event,
}) {
  final EventType? eventType = convertEventTypeStringToEnum(event.eventType);
  final eventName = eventType?.presentationName ?? "-";

  return "${eventMainPerson.firstName}'s $eventName";
}
