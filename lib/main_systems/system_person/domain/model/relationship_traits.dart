import 'package:drift/drift.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';

@DataClassName("RelationshipTraits")
class RelationshipTraitsTable extends Table {
  @override
  String? get tableName => "relationship_traits";

  IntColumn get id => integer().autoIncrement()();
  IntColumn get personId => integer().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();
  IntColumn get helpfulness => integer()();
  IntColumn get daysToDateBeforeMarriage => integer()();
  BoolColumn get economical => boolean()();
  BoolColumn get materialistic => boolean()();
  BoolColumn get jealous => boolean()();
  BoolColumn get cheater => boolean()();
}
