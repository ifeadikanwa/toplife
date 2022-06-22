import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/database_constants.dart';

class Game extends Equatable {
  final int? id;
  final int currentPlayerID;
  final bool isActive;
  final int lastPlayedTime;
  final int currentDay;
  final int currentTimeInMinutes;
  final int generation;

  const Game({
    this.id,
    required this.currentPlayerID,
    required this.isActive,
    required this.lastPlayedTime,
    required this.currentDay,
    required this.currentTimeInMinutes,
    required this.generation,
  });

  @override
  List<Object?> get props => [
        id,
        currentPlayerID,
        isActive,
        lastPlayedTime,
        currentDay,
        currentTimeInMinutes,
        generation,
      ];

  @override
  bool get stringify => true;

  //Helper Constants
  static const idColumn = "_id";
  static const currentPlayerIDColumn = "currentPlayerID";
  static const isActiveColumn = "isActive";
  static const lastPlayedTimeColumn = "lastPlayedTime";
  static const currentDayColumn = "currentDay";
  static const currentTimeInMinutesColumn = "currentTimeInMinutes";
  static const generationColumn = "generation";

  static const allColumns = [
    idColumn,
    currentPlayerIDColumn,
    isActiveColumn,
    lastPlayedTimeColumn,
    currentDayColumn,
    currentTimeInMinutesColumn,
    generationColumn,
  ];

  Map<String, Object?> toMap() {
    return {
      idColumn: id,
      currentPlayerIDColumn: currentPlayerID,
      isActiveColumn: isActive ? databaseTrueValue : databaseFalseValue,
      lastPlayedTimeColumn: lastPlayedTime,
      currentDayColumn: currentDay,
      currentTimeInMinutesColumn: currentTimeInMinutes,
      generationColumn: generation,
    };
  }

  static Game fromMap({required Map<String, Object?> gameMap}) {
    return Game(
      id: gameMap[idColumn] as int?,
      currentPlayerID: gameMap[currentPlayerIDColumn] as int,
      isActive: gameMap[isActiveColumn] == databaseTrueValue,
      lastPlayedTime: gameMap[lastPlayedTimeColumn] as int,
      currentDay: gameMap[currentDayColumn] as int,
      currentTimeInMinutes: gameMap[currentTimeInMinutesColumn] as int,
      generation: gameMap[generationColumn] as int,
    );
  }

  Game copyWith({
    int? id,
    int? currentPlayerID,
    final bool? isActive,
    final int? lastPlayedTime,
    final int? currentDay,
    final int? currentTimeInMinutes,
    final int? generation,
  }) {
    return Game(
      id: id ?? this.id,
      currentPlayerID: currentPlayerID ?? this.currentPlayerID,
      isActive: isActive ?? this.isActive,
      lastPlayedTime: lastPlayedTime ?? this.lastPlayedTime,
      currentDay: currentDay ?? this.currentDay,
      currentTimeInMinutes: currentTimeInMinutes ?? this.currentTimeInMinutes,
      generation: generation ?? this.generation,
    );
  }
}
