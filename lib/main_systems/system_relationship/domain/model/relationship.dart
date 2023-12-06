import 'package:drift/drift.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/romantic_relationship_info.dart';

@DataClassName("Relationship")
class RelationshipTable extends Table {
  @override
  String? get tableName => "relationship";

  IntColumn get firstPersonId => integer().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();
  IntColumn get secondPersonId => integer().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();

  //can hold multiple types
  TextColumn get platonicRelationshipType => text()();

  //holds ONE type
  TextColumn get romanticRelationshipType => text()();

  //holds ONE type
  TextColumn get previousFamilialRelationship => text()();

  //whether or not the other person is interested in building a relationship
  BoolColumn get interestedInRelationship => boolean()();

  IntColumn get level => integer()();

  IntColumn get romanticRelationshipInfoId => integer().nullable().references(
        RomanticRelationshipInfoTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.setNull,
      )();

  //is romantic relationship active
  BoolColumn get activeRomance => boolean()();
  
  //do they have at least one child together
  BoolColumn get isCoParent => boolean()();

  @override
  Set<Column<Object>>? get primaryKey => {
        firstPersonId,
        secondPersonId,
      };
}
