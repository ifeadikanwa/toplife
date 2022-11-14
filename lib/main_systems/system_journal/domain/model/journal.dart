import 'package:equatable/equatable.dart';

class Journal extends Equatable {
  final int gameID;
  final int day;
  final int mainPlayerID;
  final String entry;

  const Journal({
    required this.gameID,
    required this.day,
    required this.mainPlayerID,
    required this.entry,
  });

  @override
  List<Object?> get props => [
        gameID,
        day,
        mainPlayerID,
        entry,
      ];

  //helper constants
  static const gameIDColumn = "gameID";
  static const dayColumn = "day";
  static const mainPlayerIDColumn = "mainPlayerID";
  static const entryColumn = "entry";

  static const allColumns = [
    gameIDColumn,
    dayColumn,
    mainPlayerIDColumn,
    entryColumn,
  ];

  static Journal fromMap({required Map<String, Object?> journalMap}) {
    return Journal(
      gameID: journalMap[gameIDColumn] as int,
      day: journalMap[dayColumn] as int,
      mainPlayerID: journalMap[mainPlayerIDColumn] as int,
      entry: journalMap[entryColumn] as String,
    );
  }

  Map<String, Object?> toMap() {
    return {
      gameIDColumn: gameID,
      dayColumn: day,
      mainPlayerIDColumn: mainPlayerID,
      entryColumn: entry,
    };
  }

  Journal copyWith({
    int? gameID,
    int? day,
    int? mainPlayerID,
    String? entry,
  }) {
    return Journal(
      gameID: gameID ?? this.gameID,
      day: day ?? this.day,
      mainPlayerID: mainPlayerID ?? this.mainPlayerID,
      entry: entry ?? this.entry,
    );
  }
}
