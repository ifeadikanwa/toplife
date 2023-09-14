import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/age/age_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/event/event_dependencies_providers.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_scheduler/events/schedule_birthday_party.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_scheduler/events/schedule_funeral.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_scheduler/events/schedule_next_birthday.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_scheduler/schedule_event.dart';

class EventSchedulers {
  final Ref _ref;

  const EventSchedulers({required Ref ref}) : _ref = ref;

  //Main scheduler handler every scheduler must call
  ScheduleEvent get _scheduleEvent =>
      ScheduleEvent(_ref.read(eventRepositoryProvider));

  //Event Schedulers
  ScheduleFuneral get scheduleFuneral => ScheduleFuneral(_scheduleEvent);

  ScheduleBirthdayParty get scheduleBirthdayParty =>
      ScheduleBirthdayParty(_scheduleEvent);

  ScheduleNextBirthday get scheduleNextBirthday => ScheduleNextBirthday(
        _scheduleEvent,
        _ref.read(ageUsecasesProvider),
      );
}
