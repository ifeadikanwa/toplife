import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/main_systems/system_event/constants/event_type.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_scheduler/schedule_event.dart';

class ScheduleNextBirthday {
  final ScheduleEvent _scheduleEvent;

  final AgeUsecases _ageUsecases;

  const ScheduleNextBirthday(
    this._scheduleEvent,
    this._ageUsecases,
  );

  Future<void> execute({
    required int gameID,
    required int mainPersonID,
    required int dayOfBirth,
    required int currentDay,
  }) async {
    //returns null for elders
    final int? dayOfNextBirthday =
        _ageUsecases.getDayOfNextBirthdayUsecase.execute(
      currentDay: currentDay,
      dayOfBirth: dayOfBirth,
    );

    if (dayOfNextBirthday != null) {
      final Event nextBirthday = Event(
        id: DatabaseConstants.dummyId,
        gameId: gameID,
        eventType: EventType.birthday.name,
        eventDay: dayOfNextBirthday,
        mainPersonId: mainPersonID,
        journalEntryOnly: true,
        performed: false,
      );

      await _scheduleEvent.execute(event: nextBirthday);
    }
  }
}
