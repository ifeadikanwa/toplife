import 'package:drift/drift.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';

@DataClassName("Acquaintance")
class AcquaintanceTable extends Table {
  @override
  String? get tableName => "acquaintance";

  IntColumn get mainPersonId => integer().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();
  IntColumn get acquaintanceId => integer().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();
  TextColumn get metAt => text()();
  IntColumn get relationship => integer()();
  BoolColumn get interestedInRelationship => boolean()();

  @override
  Set<Column<Object>>? get primaryKey => {
        mainPersonId,
        acquaintanceId,
      };
}
