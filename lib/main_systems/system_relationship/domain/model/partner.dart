import 'package:drift/drift.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';

@DataClassName("Partner")
class PartnerTable extends Table {
  @override
  String? get tableName => "partner";

  IntColumn get mainPersonId => integer().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();
  IntColumn get partnerId => integer().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();
  TextColumn get partnerRelationshipType => text()();
  BoolColumn get isActive => boolean()();
  IntColumn get jointMoney => integer()();
  IntColumn get startDay => integer()();
  IntColumn get endDay => integer()();
  BoolColumn get isCoParent => boolean()();
  TextColumn get metAt => text()();
  IntColumn get relationship => integer()();
  BoolColumn get interestedInRelationship => boolean()();

  @override
  Set<Column<Object>>? get primaryKey => {
        mainPersonId,
        partnerId,
      };
}
