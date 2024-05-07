import 'package:drift/drift.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/model/person.dart';

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

  //Romantic:
  //is romantic relationship active
  BoolColumn get activeRomance => boolean()();

  //do they have at least one child together
  BoolColumn get isCoParent => boolean()();

  IntColumn get romanceStartDay => integer()();

  IntColumn get romanceEndDay => integer()();

  //everytime a relationship ENDS, we have to add the duration to this cumulative duration.
  //so we have a source for the total length of all romantic relationships that might have happened at any time
  IntColumn get romanceCumulativeDuration => integer()();

  IntColumn get jointMoney => integer()();

  @override
  Set<Column<Object>>? get primaryKey => {
        firstPersonId,
        secondPersonId,
      };
}
