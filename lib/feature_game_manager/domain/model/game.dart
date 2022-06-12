import 'package:equatable/equatable.dart';

class Game extends Equatable {
  final int? id;
  final int currentPlayerID;
  final bool isActive;
  final int lastPlayedTime;
  final int currentDay;
  final int currentTimeInMinutes;

  const Game({
    this.id,
    required this.currentPlayerID,
    required this.isActive,
    required this.lastPlayedTime,
    required this.currentDay,
    required this.currentTimeInMinutes,
  });

  @override
  List<Object?> get props => [
        id,
        currentPlayerID,
        isActive,
        lastPlayedTime,
        currentDay,
        currentTimeInMinutes,
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

  static const allColumns = [
    idColumn,
    currentPlayerIDColumn,
    isActiveColumn,
    lastPlayedTimeColumn,
    currentDayColumn,
    currentTimeInMinutesColumn,
  ];

  Map<String, Object?> toMap() {
    return {
      idColumn: id,
      currentPlayerIDColumn: currentPlayerID,
      isActiveColumn: isActive ? 1 : 0,
      lastPlayedTimeColumn: lastPlayedTime,
      currentDayColumn: currentDay,
      currentTimeInMinutesColumn: currentTimeInMinutes,
    };
  }

  static Game fromMap({required Map<String, Object?> gameMap}) {
    return Game(
      id: gameMap[idColumn] as int?,
      currentPlayerID: gameMap[currentPlayerIDColumn] as int,
      isActive: gameMap[isActiveColumn] == 1,
      lastPlayedTime: gameMap[lastPlayedTimeColumn] as int,
      currentDay: gameMap[currentDayColumn] as int,
      currentTimeInMinutes: gameMap[currentTimeInMinutesColumn] as int,
    );
  }

  Game copyWith({
    int? id,
    int? currentPlayerID,
    final bool? isActive,
    final int? lastPlayedTime,
    final int? currentDay,
    final int? currentTimeInMinutes,
  }) {
    return Game(
      id: id ?? this.id,
      currentPlayerID: currentPlayerID ?? this.currentPlayerID,
      isActive: isActive ?? this.isActive,
      lastPlayedTime: lastPlayedTime ?? this.lastPlayedTime,
      currentDay: currentDay ?? this.currentDay,
      currentTimeInMinutes: currentTimeInMinutes ?? this.currentTimeInMinutes,
    );
  }
}
