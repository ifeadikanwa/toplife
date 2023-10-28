import 'package:drift/drift.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';

@DataClassName("ParentChildLink")
class ParentChildLinkTable extends Table {
  @override
  String? get tableName => "parent_child_link";

  IntColumn get parentId => integer().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();
  IntColumn get childId => integer().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();

  //either birth parent/child or adopted parent/child
  BoolColumn get isBirthRelationshipType => boolean()();

  //marker to keep track of people that are children of someone in the player family lineage
  BoolColumn get relatedToPlayerFamily => boolean()();

  //whether parent shows up in character info
  BoolColumn get isHidden => boolean()();

  //whether this is a false parent-child relationship
  BoolColumn get isPaternityFraud => boolean()();

  @override
  Set<Column<Object>>? get primaryKey => {
        parentId,
        childId,
      };
}
