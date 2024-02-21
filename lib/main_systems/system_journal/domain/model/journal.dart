import 'package:drift/drift.dart';
import 'package:toplife/game_manager/domain/model/game.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';

@DataClassName("Journal")
class JournalTable extends Table {
  @override
  String? get tableName => "journal";

  IntColumn get gameId => integer().references(GameTable, #id)();
  IntColumn get day => integer()();
  IntColumn get mainPlayerId => integer().references(PersonTable, #id)();
  TextColumn get entry => text()();

  @override
  Set<Column<Object>>? get primaryKey => {
        gameId,
        day,
      };
}
