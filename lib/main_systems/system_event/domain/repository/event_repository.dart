import 'package:toplife/main_systems/system_event/domain/model/event.dart';

abstract class EventRepository {
  Future<Event> createEvent(Event event);
  Future<Event?> getEvent(int eventID);
  Future<void> updateEvent(Event event);
  Future<void> deleteEvent(int eventID);
  Future<List<Event>> getEventsForDay({
    required int day,
    required int gameID,
  });
  Future<List<Event>> getUnperformedEventsForDay({
    required int day,
    required int gameID,
  });
  Future<List<Event>> getAllEventsInvolvingAPerson({
    required int personID,
    required int gameID,
  });
  Future<void> deleteAllEventsInvolvingAPerson({
    required int personID,
    required int gameID,
  });
}
