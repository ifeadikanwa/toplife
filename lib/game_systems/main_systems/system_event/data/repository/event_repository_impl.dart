import 'package:toplife/game_systems/main_systems/system_event/domain/dao/event_dao.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_event/domain/repository/event_repository.dart';

class EventRepositoryImpl implements EventRepository {
  final EventDao _eventDao;

  const EventRepositoryImpl({
    required EventDao eventDao,
  }) : _eventDao = eventDao;

  @override
  Future<Event> createEvent(Event event) async {
    return _eventDao.createEvent(event);
  }

  @override
  Future<void> deleteAllEventsInvolvingAPerson({
    required int personID,
    required int gameID,
  }) async {
    return _eventDao.deleteAllEventsInvolvingAPerson(personID, gameID);
  }

  @override
  Future<void> deleteEvent(int eventID) {
    return _eventDao.deleteEvent(eventID);
  }

  @override
  Future<List<Event>> getAllEventsInvolvingAPerson({
    required int personID,
    required int gameID,
  }) async {
    return _eventDao.getAllEventsInvolvingAPerson(personID, gameID);
  }

  @override
  Future<Event?> getEvent(int eventID) async {
    return _eventDao.getEvent(eventID);
  }

  @override
  Future<List<Event>> getEventsForDay({
    required int day,
    required int gameID,
  }) async {
    return _eventDao.getEventsForDay(day, gameID);
  }

  @override
  Future<List<Event>> getUnperformedEventsForDay({
    required int day,
    required int gameID,
  }) async {
    return _eventDao.getUnperformedEventsForDay(day, gameID);
  }

  @override
  Future<List<Event>> getAttendableEventsForDay({
    required int day,
    required int gameID,
  }) async {
    return _eventDao.getAttendableEventsForDay(day, gameID);
  }

  @override
  Future<void> updateEvent(Event event) async {
    return _eventDao.updateEvent(event);
  }

  @override
  Stream<List<Event>> watchAttendableEventsForDay({
    required int day,
    required int gameID,
  }) {
    return _eventDao.watchAttendableEventsForDay(day, gameID);
  }
}
