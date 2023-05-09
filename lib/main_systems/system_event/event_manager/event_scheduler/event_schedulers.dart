import 'package:toplife/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/main_systems/system_event/domain/repository/event_repository.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_scheduler/events/schedule_birthday_party.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_scheduler/events/schedule_funeral.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_scheduler/events/schedule_next_birthday.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_scheduler/schedule_event.dart';

class EventSchedulers {
  final EventRepository _eventRepository;
  final AgeUsecases _ageUsecases;

  const EventSchedulers(this._eventRepository, this._ageUsecases);

 

  //Main scheduler handler every scheduler must call
  ScheduleEvent get _scheduleEvent => ScheduleEvent(_eventRepository);

  //Event Schedulers
  ScheduleFuneral get scheduleFuneral => ScheduleFuneral(_scheduleEvent);

  ScheduleBirthdayParty get scheduleBirthdayParty =>
      ScheduleBirthdayParty(_scheduleEvent);

  ScheduleNextBirthday get scheduleNextBirthday => ScheduleNextBirthday(
        _scheduleEvent,
        _ageUsecases,
      );
}
