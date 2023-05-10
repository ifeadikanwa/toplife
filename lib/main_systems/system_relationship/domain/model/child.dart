import 'package:drift/drift.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';

@DataClassName("Child")
class ChildTable extends Table {
  @override
  String? get tableName => "child";

  IntColumn get mainPersonId => integer().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();
  IntColumn get childId=> integer().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();
  BoolColumn get inYourCustody => boolean()();
  TextColumn get childRelationshipType => text()();
  BoolColumn get hidden => boolean()();
  BoolColumn get paternityFraud => boolean()();
  TextColumn get assumedRelationshipType => text()();
  IntColumn get relationship => integer()();
  BoolColumn get interestedInRelationship => boolean()();

  @override
  Set<Column<Object>>? get primaryKey => {
        mainPersonId,
        childId,
      };
}
