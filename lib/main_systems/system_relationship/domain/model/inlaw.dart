import 'package:drift/drift.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';

@DataClassName("InLaw")
class InLawTable extends Table {
  @override
  String? get tableName => "inlaw";

  IntColumn get mainPersonId => integer().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();
  IntColumn get inLawId => integer().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();
  BoolColumn get likesMainPerson => boolean()();
  TextColumn get inLawRelationshipType => text()();
  BoolColumn get haveRomanticRelationship => boolean()();
  IntColumn get relationship => integer()();
  BoolColumn get currentlyLivingTogether => boolean()();
  BoolColumn get interestedInRelationship => boolean()();

  @override
  Set<Column<Object>>? get primaryKey => {
        mainPersonId,
        inLawId,
      };
}
