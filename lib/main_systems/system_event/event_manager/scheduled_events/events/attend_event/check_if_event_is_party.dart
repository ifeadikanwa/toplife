import 'package:toplife/main_systems/system_event/constants/event_type.dart';

bool checkIfEventIsParty(EventType eventType) {
  switch (eventType) {
    //Party
    case EventType.birthdayParty:
    case EventType.wedding:
    case EventType.engagement:
      return true;
    //NOT party
    case EventType.funeral:
    case EventType.graduation:
    case EventType.schoolAdmission:
    case EventType.birthday:
    case EventType.death:
    case EventType.askForSchoolTuition:
    case EventType.employment:
      return false;
  }
}
