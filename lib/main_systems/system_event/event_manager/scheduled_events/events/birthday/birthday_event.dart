import 'package:toplife/main_systems/system_age/age.dart';
import 'package:toplife/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/main_systems/system_event/domain/repository/event_repository.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_scheduler/event_schedulers.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/birthday/npc_birthday.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/birthday/player_birthday.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';

class BirthdayEvent {
  final RelationshipUsecases _relationshipUsecases;
  final PersonUsecases _personUsecases;
  final AgeUsecases _ageUsecases;
  final JournalUsecases _journalUsecases;
  final EventSchedulers _eventScheduler;
  final EventRepository _eventRepository;

  const BirthdayEvent(
    this._relationshipUsecases,
    this._personUsecases,
    this._ageUsecases,
    this._journalUsecases,
    this._eventScheduler,
    this._eventRepository,
  );

  //the birthday event is NOT a journal only event
  //because It runs age up actions and that could potentially trigger dialogs
  //It is meant to notify the player about peoples birthdays including theirs
  Future<void> execute(
    int mainPlayerID,
    Event event,
  ) async {
    //get the birthday person
    final Person? birthdayPerson = await _personUsecases.getPersonUsecase
        .execute(personID: event.mainPersonId);

    if (birthdayPerson != null) {
      //get journal entry
      String journalEntry =
          await getJournalEntry(mainPlayerID, birthdayPerson, event);

      //add to journal
      await _journalUsecases.addToJournalUsecase.execute(
        gameID: event.gameId,
        day: event.eventDay,
        mainPlayerID: mainPlayerID,
        entry: journalEntry,
      );

      //schedule next birthday
      await _eventScheduler.scheduleNextBirthday.execute(
        gameID: event.gameId,
        mainPersonID: event.mainPersonId,
        dayOfBirth: birthdayPerson.dayOfBirth,
        currentDay: event.eventDay,
      );

      //mark event as performed
      await _eventRepository.updateEvent(
        event.copyWith(performed: true),
      );

      //run the age up actions
      await _ageUsecases.ageUpCharacterActionsUsecase.execute(
        characterID: event.mainPersonId,
        currentPlayerID: mainPlayerID,
        currentDay: event.eventDay,
      );
    }
  }

  Future<String> getJournalEntry(
    int mainPlayerID,
    Person birthdayPerson,
    Event event,
  ) async {
    //get birthday person age
    final Age age = _ageUsecases.getPersonsAgeUsecase.execute(
      dayOfBirth: birthdayPerson.dayOfBirth,
      currentDay: event.eventDay,
    );

    //if it is player
    if (event.mainPersonId == mainPlayerID) {
      return await PlayerBirthday(
        _relationshipUsecases,
        _personUsecases,
      ).run(event, birthdayPerson, age);
    }
    //else it's an npc
    else {
      return await NpcBirthday(
        _relationshipUsecases,
        _eventScheduler,
      ).run(
        mainPlayerID,
        event,
        birthdayPerson,
        age,
      );
    }
  }
}
