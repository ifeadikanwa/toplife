import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_event/domain/model/info_models/event_person_pair.dart';
import 'package:toplife/game_systems/main_systems/system_event/domain/repository/event_repository.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/person_usecases.dart';

class GetTodaysAttendableEvents {
  final EventRepository _eventRepository;
  final PersonUsecases _personUsecases;

  const GetTodaysAttendableEvents(
    this._eventRepository,
    this._personUsecases,
  );

  Future<List<EventPersonPair>> execute({
    required int currentDay,
    required int gameID,
  }) async {
    List<EventPersonPair> todaysAttendableEvents = [];

    final List<Event> events = await _eventRepository.getAttendableEventsForDay(
      day: currentDay,
      gameID: gameID,
    );

    for (var event in events) {
      final Person? mainPerson = await _personUsecases.getPersonUsecase.execute(
        personID: event.mainPersonId,
      );

      if (mainPerson != null) {
        todaysAttendableEvents.add(
          EventPersonPair(
            event: event,
            person: mainPerson,
          ),
        );
      }
    }

    return todaysAttendableEvents;
  }
}
