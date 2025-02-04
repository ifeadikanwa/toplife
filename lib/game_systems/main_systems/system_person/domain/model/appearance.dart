import 'package:drift/drift.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/model/person.dart';

@DataClassName("Appearance")
class AppearanceTable extends Table {
  @override
  String? get tableName => "appearance";

  IntColumn get personId => integer().unique().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();
  TextColumn get skinColor => text()();
  TextColumn get eyeColor => text()();
  TextColumn get hairstyle => text()();
  TextColumn get naturalHairColor => text()();
  TextColumn get dyeHairColor => text()();
  IntColumn get currentHeightInInches => integer()();
  IntColumn get maxHeightInInches => integer()();
  BoolColumn get hasBeards => boolean()();
}
