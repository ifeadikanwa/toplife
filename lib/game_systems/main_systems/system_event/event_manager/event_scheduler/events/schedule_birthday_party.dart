import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_event/constants/event_type.dart';
import 'package:toplife/game_systems/main_systems/system_event/event_manager/event_scheduler/schedule_event.dart';
import 'package:toplife/game_systems/main_systems/system_event/event_manager/scheduled_events/util/event_util.dart';

class ScheduleBirthdayParty {
  final ScheduleEvent _scheduleEvent;

  const ScheduleBirthdayParty(
    this._scheduleEvent,
  );

  Future<Event> execute({
    required int gameID,
    required int mainPersonID,
    required int eventDay,
  }) {
    EventType birthdayPartyEvent = EventType.birthdayParty;

    final int startTime = EventUtil.getRandomEventStartTime(
      canBeMorning: false,
      canBeAfternoon: false,
      canBeNight: true,
    );

    final Event birthdayParty = Event(
      id: DatabaseConstants.dummyId,
      gameId: gameID,
      eventType: birthdayPartyEvent.name,
      eventDay: eventDay,
      startTime: startTime,
      endTime: startTime + birthdayPartyEvent.eventDuration,
      mainPersonId: mainPersonID,
      performed: false,
    );

    return _scheduleEvent.execute(event: birthdayParty);
  }
}
