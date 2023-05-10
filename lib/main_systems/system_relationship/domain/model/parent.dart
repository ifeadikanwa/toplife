import 'package:drift/drift.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';

@DataClassName("Parent")
class ParentTable extends Table {
  @override
  String? get tableName => "parent";

  IntColumn get mainPersonId => integer().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();
  IntColumn get parentId => integer().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();
  TextColumn get parentRelationshipType => text()();
  BoolColumn get hidden => boolean()();
  BoolColumn get paternityFraud => boolean()();
  TextColumn get assumedRelationshipType => text()();
  IntColumn get relationship => integer()();
  BoolColumn get isActive => boolean()();
  BoolColumn get interestedInRelationship => boolean()();

  @override
  Set<Column<Object>>? get primaryKey => {
        mainPersonId,
        parentId,
      };
}
