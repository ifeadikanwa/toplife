import 'package:drift/drift.dart';
import 'package:toplife/game_manager/domain/model/game.dart';

@DataClassName("PendingTimeUpdate")
class PendingTimeUpdateTable extends Table {
  @override
  String? get tableName => "pending_time_update";

  IntColumn get gameId => integer().unique().references(
        GameTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();

  IntColumn get timeInMinutes => integer()();
}
