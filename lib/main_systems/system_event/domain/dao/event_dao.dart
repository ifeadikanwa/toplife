import 'package:toplife/main_systems/system_event/domain/model/event.dart';

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
}
