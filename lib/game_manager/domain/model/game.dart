import 'package:drift/drift.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';

@DataClassName("Game")
class GameTable extends Table {
  @override
  String? get tableName => "game";

  IntColumn get id => integer().autoIncrement()();
  IntColumn get currentPlayerID => integer().nullable().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.setNull,
      )();
  BoolColumn get isActive => boolean()();
  IntColumn get lastPlayedTime => integer()();
  IntColumn get currentDay => integer()();
  IntColumn get currentTimeInMinutes => integer()();
  IntColumn get generation => integer()();
}
