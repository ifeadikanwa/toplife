import 'package:drift/drift.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/model/person.dart';

@DataClassName("Grave")
class GraveTable extends Table {
  @override
  String? get tableName => "grave";

  IntColumn get mainPersonId => integer().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();
  IntColumn get deadPersonId => integer().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();
  TextColumn get relationshipLabel => text()();
  IntColumn get relationshipLevel => integer()();

  @override
  Set<Column<Object>>? get primaryKey => {
        mainPersonId,
        deadPersonId,
      };
}
