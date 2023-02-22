import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/main_systems/system_event/constants/event_type.dart';
import 'package:toplife/main_systems/system_event/domain/repository/event_repository.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/util/event_util.dart';

class EventScheduler {
  final EventRepository _eventRepository;
  final AgeUsecases _ageUsecases;

  EventScheduler(this._eventRepository, this._ageUsecases);

  Future<Event> scheduleBirthdayParty({
    required int gameID,
    required int mainPersonID,
    required String relationshipToMainPlayer,
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
      relationshipToMainPlayer: relationshipToMainPlayer,
      journalEntryOnly: false,
      performed: false,
    );

    return _eventRepository.createEvent(birthdayParty);
  }

  void scheduleNextBirthday({
    required int gameID,
    required int mainPersonID,
    required String relationshipToMainPlayer,
    required int dayOfBirth,
    required int currentDay,
  }) {
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
        relationshipToMainPlayer: relationshipToMainPlayer,
        journalEntryOnly: true,
        performed: false,
      );

      _eventRepository.createEvent(nextBirthday);
    }
  }

  Future<Event> scheduleFuneral({
    required int gameID,
    required int mainPlayerID,
    required int deadPersonID,
    required int currentDay,
    int? eventStartTime,
    required String relationshipToMainPlayer,
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
      eventDay: currentDay + 1,
      mainPersonId: deadPersonID,
      relationshipToMainPlayer: relationshipToMainPlayer,
      startTime: funeralEventStartTime,
      endTime: funeralEventStartTime + EventType.funeral.eventDuration,
      journalEntryOnly: false,
      performed: false,
    );

    return _eventRepository.createEvent(funeral);
  }
}
