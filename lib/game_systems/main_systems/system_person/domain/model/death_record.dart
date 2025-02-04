import 'package:drift/drift.dart';
import 'package:toplife/game_systems/game_manager/domain/model/game.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/model/person.dart';

@DataClassName("DeathRecord")
class DeathRecordTable extends Table {
  @override
  String? get tableName => "death_record";

  IntColumn get gameId => integer().references(
        GameTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();

  IntColumn get personId => integer().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();

  IntColumn get dayOfDeath => integer()();

  TextColumn get state => text()();

  TextColumn get country => text()();

  TextColumn get causeOfDeath => text()();

  @override
  Set<Column<Object>>? get primaryKey => {
        gameId,
        personId,
      };
}
