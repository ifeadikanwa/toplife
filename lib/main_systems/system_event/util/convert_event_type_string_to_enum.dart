import 'package:toplife/main_systems/system_event/constants/event_type.dart';

EventType? convertEventTypeStringToEnum(String eventType) {
  final eventTypeMap = EventType.values.asNameMap();
  return eventTypeMap[eventType];
}
