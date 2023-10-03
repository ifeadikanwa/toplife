import 'package:drift/drift.dart';
import 'package:toplife/game_manager/domain/model/game.dart';

@DataClassName("RomanticRelationshipInfo")
class RomanticRelationshipInfoTable extends Table {
  @override
  String? get tableName => "romantic_relationship_info";

  IntColumn get id => integer().autoIncrement()();

  //here to trigger cleaning up table when game is deleted
  IntColumn get gameId => integer().references(
        GameTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();

  IntColumn get startDay => integer()();

  IntColumn get endDay => integer()();

  IntColumn get daysToDateBeforeMarriage => integer()();

  IntColumn get jointMoney => integer()();

  BoolColumn get isCoParent => boolean()();
}
