import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/numbers/get_random_int_in_positive_range.dart';
import 'package:toplife/game_systems/main_systems/system_event/constants/event_type.dart';
import 'package:toplife/game_systems/main_systems/system_event/event_manager/event_scheduler/schedule_event.dart';
import 'package:toplife/game_systems/main_systems/system_event/event_manager/scheduled_events/util/event_util.dart';

class ScheduleFuneral {
  final ScheduleEvent _scheduleEvent;

  const ScheduleFuneral(this._scheduleEvent);

  Future<Event> execute({
    required int gameID,
    required int mainPlayerID,
    required int deadPersonID,
    required int currentDay,
    int? eventStartTime,
    int? chosenDaysFromCurrentDayForTheEvent,
  }) {
    late final int funeralEventStartTime;

    if (eventStartTime == null) {
      funeralEventStartTime = EventUtil.getRandomEventStartTime(
        canBeMorning: true,
        canBeAfternoon: true,
        canBeNight: false,
      );
    } else {
      funeralEventStartTime = eventStartTime;
    }

    final Event funeral = Event(
      id: DatabaseConstants.dummyId,
      gameId: gameID,
      eventType: EventType.funeral.name,
      eventDay: currentDay +
          (chosenDaysFromCurrentDayForTheEvent ??
              getRandomIntInPositiveRange(
                min: 1,
                max: 5,
              )),
      //Add the given days from current day or choose random 1 - 5 days after current day
      mainPersonId: deadPersonID,
      startTime: funeralEventStartTime,
      endTime: funeralEventStartTime + EventType.funeral.eventDuration,
      performed: false,
    );

    return _scheduleEvent.execute(event: funeral);
  }
}
