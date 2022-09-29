import 'package:toplife/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/main_systems/system_event/constants/event_type.dart';
import 'package:toplife/main_systems/system_event/domain/model/event.dart';
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
      gameID: gameID,
      eventType: birthdayPartyEvent.name,
      eventDay: eventDay,
      startTime: startTime,
      endTime: startTime + birthdayPartyEvent.eventDuration,
      mainPersonID: mainPersonID,
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
        gameID: gameID,
        eventType: EventType.birthday.name,
        eventDay: dayOfNextBirthday,
        mainPersonID: mainPersonID,
        relationshipToMainPlayer: relationshipToMainPlayer,
        journalEntryOnly: true,
        performed: false,
      );

      _eventRepository.createEvent(nextBirthday);
    }
  }
}
