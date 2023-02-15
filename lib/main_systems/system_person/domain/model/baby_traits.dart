import 'package:drift/drift.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';

@DataClassName("BabyTraits")
class BabyTraitsTable extends Table {
  @override
  String? get tableName => "baby_traits";

  IntColumn get id => integer().autoIncrement()();
  IntColumn get personId => integer().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();
  IntColumn get fussiness => integer()();
  IntColumn get appetite => integer()();
  BoolColumn get needsChanging => boolean()();
}
