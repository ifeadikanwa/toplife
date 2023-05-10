import 'package:drift/drift.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';

@DataClassName("Friend")
class FriendTable extends Table {
  @override
  String? get tableName => "friend";

  IntColumn get mainPersonId => integer().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();
  IntColumn get friendId => integer().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();
  TextColumn get metAt => text()();
  BoolColumn get haveRomanticRelationship => boolean()();
  IntColumn get relationship => integer()();
  BoolColumn get interestedInRelationship => boolean()();

  @override
  Set<Column<Object>>? get primaryKey => {
        mainPersonId,
        friendId,
      };
}
