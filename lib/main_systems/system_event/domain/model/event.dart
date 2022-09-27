import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/database_constants.dart';

class Event extends Equatable {
  final int? id;
  final int gameID;
  final String eventType;
  final int eventDay;
  final int mainPersonID;
  final int? otherPersonID;
  final String relationshipToMainPlayer;
  final int? startTime;
  final int? endTime;
  final bool journalEntryOnly;
  final bool performed;

  const Event({
    this.id,
    required this.gameID,
    required this.eventType,
    required this.eventDay,
    required this.mainPersonID,
    this.otherPersonID,
    required this.relationshipToMainPlayer,
    this.startTime,
    this.endTime,
    required this.journalEntryOnly,
    required this.performed,
  });

  @override
  List<Object?> get props => [
        id,
        gameID,
        eventType,
        eventDay,
        mainPersonID,
        otherPersonID,
        relationshipToMainPlayer,
        startTime,
        endTime,
        journalEntryOnly,
        performed,
      ];

  //helper constants
  static const idColumn = "_id";
  static const gameIDColumn = "gameID";
  static const eventTypeColumn = "eventType";
  static const eventDayColumn = "eventDay";
  static const mainPersonIDColumn = "mainPersonID";
  static const otherPersonIDColumn = "otherPersonID";
  static const relationshipToMainPlayerColumn = "relationshipToMainPlayer";
  static const startTimeColumn = "startTime";
  static const endTimeColumn = "endTime";
  static const journalEntryOnlyColumn = "journalEntryOnly";
  static const performedColumn = "performed";

  static const allColumns = [
    idColumn,
    gameIDColumn,
    eventTypeColumn,
    eventDayColumn,
    mainPersonIDColumn,
    otherPersonIDColumn,
    relationshipToMainPlayerColumn,
    startTimeColumn,
    endTimeColumn,
    journalEntryOnlyColumn,
    performedColumn,
  ];

  static Event fromMap({required Map<String, Object?> eventMap}) {
    return Event(
      id: eventMap[idColumn] as int?,
      gameID: eventMap[gameIDColumn] as int,
      eventType: eventMap[eventTypeColumn] as String,
      eventDay: eventMap[eventDayColumn] as int,
      mainPersonID: eventMap[mainPersonIDColumn] as int,
      otherPersonID: eventMap[otherPersonIDColumn] as int?,
      relationshipToMainPlayer:
          eventMap[relationshipToMainPlayerColumn] as String,
      startTime: eventMap[startTimeColumn] as int?,
      endTime: eventMap[endTimeColumn] as int?,
      journalEntryOnly: eventMap[journalEntryOnlyColumn] == databaseTrueValue,
      performed: eventMap[performedColumn] == databaseTrueValue,
    );
  }

  Map<String, Object?> toMap() {
    return {
      idColumn: id,
      gameIDColumn: gameID,
      eventTypeColumn: eventType,
      eventDayColumn: eventDay,
      mainPersonIDColumn: mainPersonID,
      otherPersonIDColumn: otherPersonID,
      relationshipToMainPlayerColumn: relationshipToMainPlayer,
      startTimeColumn: startTime,
      endTimeColumn: endTime,
      journalEntryOnlyColumn:
          journalEntryOnly ? databaseTrueValue : databaseFalseValue,
      performedColumn: performed ? databaseTrueValue : databaseFalseValue,
    };
  }

  Event copyWith({
    int? id,
    int? gameID,
    String? eventType,
    int? eventDay,
    int? mainPersonID,
    int? otherPersonID,
    String? relationshipToMainPlayer,
    int? startTime,
    int? endTime,
    bool? journalEntryOnly,
    bool? performed,
  }) {
    return Event(
      id: id ?? this.id,
      gameID: gameID ?? this.gameID,
      eventType: eventType ?? this.eventType,
      eventDay: eventDay ?? this.eventDay,
      mainPersonID: mainPersonID ?? this.mainPersonID,
      otherPersonID: otherPersonID ?? this.otherPersonID,
      relationshipToMainPlayer:
          relationshipToMainPlayer ?? this.relationshipToMainPlayer,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      journalEntryOnly: journalEntryOnly ?? this.journalEntryOnly,
      performed: performed ?? this.performed,
    );
  }
}
