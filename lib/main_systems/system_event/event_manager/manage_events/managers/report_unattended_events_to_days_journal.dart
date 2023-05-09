import 'dart:math';

import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_event/domain/repository/event_repository.dart';
import 'package:toplife/main_systems/system_event/util/get_attendable_event_title.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';

class ReportUnattendedEventsToDaysJournal {
  final EventRepository _eventRepository;
  final JournalUsecases _journalUsecases;
  final PersonUsecases _personUsecases;
  final RelationshipUsecases _relationshipUsecases;

  const ReportUnattendedEventsToDaysJournal(
    this._eventRepository,
    this._journalUsecases,
    this._personUsecases,
    this._relationshipUsecases,
  );

  Future<void> execute({
    required int day,
    required int gameID,
    required int mainPlayerID,
  }) async {
    //get all attendable events for the day
    final List<Event> attendableEventsForTheDay =
        await _eventRepository.getAttendableEventsForDay(
      day: day,
      gameID: gameID,
    );

    //filter list for unattended events
    final List<Event> unattendedEventsForTheDay = attendableEventsForTheDay
        .where((event) => event.performed == false)
        .toList();

    //for each unattended event, log in journal that they weren't attended
    for (var event in unattendedEventsForTheDay) {
      //get event main person
      final Person? eventMainPerson =
          await _personUsecases.getPersonUsecase.execute(
        personID: event.mainPersonId,
      );

      //if it is a valid person
      if (eventMainPerson != null) {
        // log report to journal
        await _journalUsecases.addToJournalUsecase.execute(
          gameID: gameID,
          day: day,
          mainPlayerID: mainPlayerID,
          entry: "I did not attend ${getAttendableEventTitle(
            eventMainPerson: eventMainPerson,
            event: event,
          )}",
        );

        //reduce relationship as a consequence
        await _relationshipUsecases.updateAnyRelationshipAmountUsecase.execute(
          personUsecases: _personUsecases,
          mainPersonID: mainPlayerID,
          relationshipPersonID: event.mainPersonId,
          relationshipToMainPerson: event.relationshipToMainPlayer,
          change: -(Random().nextInt(50)),
        );

        //this would be a good place to create an issue too.
      }
    }
  }
}
