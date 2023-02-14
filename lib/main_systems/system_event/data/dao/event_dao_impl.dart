import 'package:sqflite/sqflite.dart';
import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/database_provider.dart';
import 'package:toplife/main_systems/system_event/domain/dao/event_dao.dart';
import 'package:toplife/main_systems/system_event/domain/model/event.dart';

class EventDaoImpl implements EventDao {
  final DatabaseProvider _databaseProvider = DatabaseProvider.instance;

  static const eventTable = "event";

  static const createTableQuery = "";
  
    // CREATE TABLE $eventTable(
    //   ${Event.idColumn} $idType,
    //   ${Event.gameIDColumn} $integerType,
    //   ${Event.eventTypeColumn} $textType,
    //   ${Event.eventDayColumn} $integerType,
    //   ${Event.mainPersonIDColumn} $integerType,
    //   ${Event.otherPersonIDColumn} $nullableIntegerType,
    //   ${Event.relationshipToMainPlayerColumn} $textType,
    //   ${Event.startTimeColumn} $nullableIntegerType,
    //   ${Event.endTimeColumn} $nullableIntegerType,
    //   ${Event.journalEntryOnlyColumn} $boolType,
    //   ${Event.performedColumn} $boolType,
    //   FOREIGN KEY (${Event.gameIDColumn})
    //    REFERENCES ${GameDaoImpl.gameTable} (${Game.idColumn}) 
    //    ON UPDATE CASCADE
    //    ON DELETE CASCADE,
    //   FOREIGN KEY (${Event.mainPersonIDColumn})
    //    REFERENCES ${PersonDaoImpl.personTable} (${Person.idColumn}) 
    //    ON UPDATE CASCADE
    //    ON DELETE NO ACTION,
    //   FOREIGN KEY (${Event.otherPersonIDColumn})
    //    REFERENCES ${PersonDaoImpl.personTable} (${Person.idColumn}) 
    //    ON UPDATE CASCADE
    //    ON DELETE NO ACTION
    // )


  @override
  Future<Event> createEvent(Event event) async {
    final db = await _databaseProvider.database;
    final id = await db.insert(
      eventTable,
      event.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return event.copyWith(id: id);
  }

  @override
  Future<void> deleteAllEventsInvolvingAPerson(int personID, int gameID) async {
    final db = await _databaseProvider.database;
    await db.delete(
      eventTable,
      where:
          "${Event.gameIDColumn} = ? and (${Event.mainPersonIDColumn} = ? or ${Event.otherPersonIDColumn} = ?)",
      whereArgs: [
        gameID,
        personID,
        personID,
      ],
    );
  }

  @override
  Future<void> deleteEvent(int eventID) async {
    final db = await _databaseProvider.database;
    await db.delete(
      eventTable,
      where: "${Event.idColumn} = ?",
      whereArgs: [eventID],
    );
  }

  @override
  Future<List<Event>> getAllEventsInvolvingAPerson(
    int personID,
    int gameID,
  ) async {
    final db = await _databaseProvider.database;
    final allPersonEventsMap = await db.query(
      eventTable,
      columns: Event.allColumns,
      where:
          "${Event.gameIDColumn} = ? and (${Event.mainPersonIDColumn} = ? or ${Event.otherPersonIDColumn} = ?)",
      whereArgs: [
        gameID,
        personID,
        personID,
      ],
    );

    return allPersonEventsMap
        .map((eventMap) => Event.fromMap(eventMap: eventMap))
        .toList();
  }

  @override
  Future<Event?> getEvent(int eventID) async {
    final db = await _databaseProvider.database;
    final eventsMap = await db.query(
      eventTable,
      columns: Event.allColumns,
      where: "${Event.idColumn} = ?",
      whereArgs: [eventID],
    );

    if (eventsMap.isNotEmpty) {
      return Event.fromMap(eventMap: eventsMap.first);
    } else {
      return null;
    }
  }

  @override
  Future<List<Event>> getEventsForDay(int day, int gameID) async {
    final db = await _databaseProvider.database;
    final allDayEventsMap = await db.query(
      eventTable,
      columns: Event.allColumns,
      where: "${Event.eventDayColumn} = ? and ${Event.gameIDColumn} = ?",
      whereArgs: [day, gameID],
    );

    return allDayEventsMap
        .map((eventMap) => Event.fromMap(eventMap: eventMap))
        .toList();
  }

  @override
  Future<List<Event>> getUnperformedEventsForDay(int day, int gameID) async {
    final db = await _databaseProvider.database;
    final allUnperformedDayEventsMap = await db.query(
      eventTable,
      columns: Event.allColumns,
      where:
          "${Event.eventDayColumn} = ? and ${Event.gameIDColumn} = ? and ${Event.performedColumn} = ?",
      whereArgs: [
        day,
        gameID,
        databaseFalseValue,
      ],
    );

    return allUnperformedDayEventsMap
        .map((eventMap) => Event.fromMap(eventMap: eventMap))
        .toList();
  }

  @override
  Future<List<Event>> getAttendableEventsForDay(int day, int gameID) async {
    final db = await _databaseProvider.database;
    final allDayAttendableEventsMap = await db.query(
      eventTable,
      columns: Event.allColumns,
      where:
          "${Event.eventDayColumn} = ? and ${Event.gameIDColumn} = ? and ${Event.startTimeColumn} $dbValueIsNotNull and ${Event.endTimeColumn} $dbValueIsNotNull",
      whereArgs: [
        day,
        gameID,
      ],
    );

    return allDayAttendableEventsMap
        .map((eventMap) => Event.fromMap(eventMap: eventMap))
        .toList();
  }

  @override
  Future<void> updateEvent(Event event) async {
    final db = await _databaseProvider.database;
    await db.update(
      eventTable,
      event.toMap(),
      where: "${Event.idColumn} = ?",
      whereArgs: [event.id],
    );
  }
}
