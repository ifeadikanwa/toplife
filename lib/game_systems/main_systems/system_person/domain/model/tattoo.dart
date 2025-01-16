import 'package:drift/drift.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/model/person.dart';

@DataClassName("Tattoo")
class TattooTable extends Table {
  @override
  String? get tableName => "tattoo";

  IntColumn get id => integer().autoIncrement()();
  IntColumn get personId => integer().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();

  TextColumn get description => text()();
  TextColumn get location => text()();
  TextColumn get size => text()();
  IntColumn get dayObtained => integer()();
  TextColumn get quality => text()();
}
