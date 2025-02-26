import 'package:drift/drift.dart';
import 'package:toplife/game_systems/game_manager/domain/model/game.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/model/person.dart';

@DataClassName("Event")
class EventTable extends Table {
  @override
  String? get tableName => "event";

  IntColumn get id => integer().autoIncrement()();

  IntColumn get gameId => integer().references(
        GameTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();

  TextColumn get eventType => text()();

  IntColumn get eventDay => integer()();

  IntColumn get mainPersonId => integer().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();

  IntColumn get otherPersonId => integer().nullable().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();

  IntColumn get startTime => integer().nullable()();

  IntColumn get endTime => integer().nullable()();

  BoolColumn get performed => boolean()();
}
