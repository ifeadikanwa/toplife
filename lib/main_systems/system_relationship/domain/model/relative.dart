import 'package:drift/drift.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';

@DataClassName("Relative")
class RelativeTable extends Table {
  @override
  String? get tableName => "relative";

  IntColumn get mainPersonId => integer().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();
  IntColumn get relativeId => integer().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();
  BoolColumn get inYourCustody => boolean()();
  TextColumn get relativeRelationshipType => text()();
  IntColumn get relationship => integer()();

  @override
  Set<Column<Object>>? get primaryKey => {
        mainPersonId,
        relativeId,
      };
}
