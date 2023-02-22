import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_event/domain/dao/event_dao.dart';
import 'package:toplife/main_systems/system_event/domain/model/event.dart';

part 'event_dao_impl.g.dart';

@DriftAccessor(tables: [EventTable])
class EventDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$EventDaoImplMixin
    implements EventDao {
  EventDaoImpl(DatabaseProvider database) : super(database);

  @override
  Future<Event> createEvent(Event event) async {
    final EventTableCompanion eventWithoutID =
        event.toCompanion(false).copyWith(id: const Value.absent());

    final eventID =
        await into(eventTable).insertOnConflictUpdate(eventWithoutID);
    return event.copyWith(id: eventID);
  }

  @override
  Future<void> deleteAllEventsInvolvingAPerson(int personID, int gameID) {
    return (delete(eventTable)
          ..where(
            (event) =>
                event.gameId.equals(gameID) &
                (event.mainPersonId.equals(personID) |
                    event.otherPersonId.equals(personID)),
          ))
        .go();
  }

  @override
  Future<void> deleteEvent(int eventID) {
    return (delete(eventTable)..where((event) => event.id.equals(eventID)))
        .go();
  }

  @override
  Future<List<Event>> getAllEventsInvolvingAPerson(int personID, int gameID) {
    return (select(eventTable)
          ..where(
            (event) =>
                event.gameId.equals(gameID) &
                (event.mainPersonId.equals(personID) |
                    event.otherPersonId.equals(personID)),
          ))
        .get();
  }

  @override
  Future<List<Event>> getAttendableEventsForDay(int day, int gameID) {
    return (select(eventTable)
          ..where(
            (event) =>
                event.gameId.equals(gameID) &
                event.eventDay.equals(day) &
                event.startTime.isNotNull() &
                event.endTime.isNotNull(),
          ))
        .get();
  }

  @override
  Future<Event?> getEvent(int eventID) {
    return (select(eventTable)
          ..where((event) => event.id.equals(eventID))
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<List<Event>> getEventsForDay(int day, int gameID) {
    return (select(eventTable)
          ..where(
            (event) => event.gameId.equals(gameID) & event.eventDay.equals(day),
          ))
        .get();
  }

  @override
  Future<List<Event>> getUnperformedEventsForDay(int day, int gameID) {
    return (select(eventTable)
          ..where(
            (event) =>
                event.gameId.equals(gameID) &
                event.eventDay.equals(day) &
                event.performed.equals(false),
          ))
        .get();
  }

  @override
  Future<void> updateEvent(Event event) {
    return update(eventTable).replace(event);
  }

  @override
  Stream<List<Event>> watchAttendableEventsForDay(int day, int gameID) {
    return (select(eventTable)
          ..where(
            (event) =>
                event.gameId.equals(gameID) &
                event.eventDay.equals(day) &
                event.startTime.isNotNull() &
                event.endTime.isNotNull(),
          ))
        .watch();
  }
}
