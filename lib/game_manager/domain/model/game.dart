import 'package:drift/drift.dart';

@DataClassName("Game")
class GameTable extends Table {
  @override
  String? get tableName => "game";

  IntColumn get id => integer().autoIncrement()();
  IntColumn get currentPlayerID => integer()();
  BoolColumn get isActive => boolean()();
  IntColumn get lastPlayedTime => integer()();
  IntColumn get currentDay => integer()();
  IntColumn get currentTimeInMinutes => integer()();
  IntColumn get generation => integer()();
}
