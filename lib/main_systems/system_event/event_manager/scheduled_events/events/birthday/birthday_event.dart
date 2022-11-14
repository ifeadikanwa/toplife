import 'package:toplife/main_systems/system_age/age.dart';
import 'package:toplife/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/main_systems/system_event/domain/model/event.dart';
import 'package:toplife/main_systems/system_event/domain/repository/event_repository.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_scheduler.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/birthday/npc_birthday.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/birthday/player_birthday.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';

class BirthdayEvent {
  final RelationshipUsecases _relationshipUsecases;
  final PersonUsecases _personUsecases;
  final AgeUsecases _ageUsecases;
  final JournalUsecases _journalUsecases;
  final EventScheduler _eventScheduler;
  final EventRepository _eventRepository;

  const BirthdayEvent(
    this._relationshipUsecases,
    this._personUsecases,
    this._ageUsecases,
    this._journalUsecases,
    this._eventScheduler,
    this._eventRepository,
  );

  //the birthday event is a journal only event.
  //It is meant to notify you about peoples birthdays including yours
  Future<void> execute(int mainPlayerID, Event event) async {
    //get the birthday person
    final Person? birthdayPerson = await _personUsecases.getPersonUsecase
        .execute(personID: event.mainPersonID);

    if (birthdayPerson != null) {
      //get journal entry
      String journalEntry =
          await getJournalEntry(mainPlayerID, birthdayPerson, event);

      //add to journal
      _journalUsecases.addToJournalUsecase.execute(
        gameID: event.gameID,
        day: event.eventDay,
        mainPlayerID: mainPlayerID,
        entry: journalEntry,
      );

      //schedule next birthday
      _eventScheduler.scheduleNextBirthday(
        gameID: event.gameID,
        mainPersonID: event.mainPersonID,
        relationshipToMainPlayer: event.relationshipToMainPlayer,
        dayOfBirth: birthdayPerson.dayOfBirth,
        currentDay: event.eventDay,
      );

      //mark event as performed
      _eventRepository.updateEvent(
        event.copyWith(performed: true),
      );
    }
  }

  Future<String> getJournalEntry(
    int mainPlayerID,
    Person birthdayPerson,
    Event event,
  ) async {
    //get birthday person age
    final Age age = _ageUsecases.getPersonAgeUsecase.execute(
      dayOfBirth: birthdayPerson.dayOfBirth,
      currentDay: event.eventDay,
    );

    //if it is player
    if (event.mainPersonID == mainPlayerID) {
      return await PlayerBirthday(
        _relationshipUsecases,
        _personUsecases,
      ).run(event, birthdayPerson, age);
    }
    //else it's an npc
    else {
      return NpcBirthday(
        _relationshipUsecases,
        _personUsecases,
        _ageUsecases,
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
