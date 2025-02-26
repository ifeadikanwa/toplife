import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class EventDao {
  Future<Event> createEvent(Event event);
  Future<Event?> getEvent(int eventID);
  Future<void> updateEvent(Event event);
  Future<void> deleteEvent(int eventID);
  Future<List<Event>> getEventsForDay(int day, int gameID);
  Future<List<Event>> getUnperformedEventsForDay(int day, int gameID);
  Future<List<Event>> getAttendableEventsForDay(int day, int gameID);
  Future<List<Event>> getAllEventsInvolvingAPerson(
    int personID,
    int gameID,
  );
  Future<void> deleteAllEventsInvolvingAPerson(
    int personID,
    int gameID,
  );
  Stream<List<Event>> watchAttendableEventsForDay(int day, int gameID);
}
