import 'package:drift/drift.dart';
import 'package:toplife/game_manager/domain/model/game.dart';

@DataClassName("Person")
class PersonTable extends Table {
  @override
  String? get tableName => "person";

  IntColumn get id => integer().autoIncrement()();
  IntColumn get gameId => integer().references(
        GameTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();
  TextColumn get firstName => text()();
  TextColumn get lastName => text()();
  IntColumn get dayOfBirth => integer()();
  TextColumn get gender => text()();
  TextColumn get subjectPronoun => text()();
  TextColumn get objectPronoun => text()();
  TextColumn get possessivePronoun => text()();
  TextColumn get sexuality => text()();
  TextColumn get currentState => text()();
  TextColumn get currentCountry => text()();
  TextColumn get birthState => text()();
  TextColumn get birthCountry => text()();
  IntColumn get money => integer()();
  TextColumn get emotionalState => text()();
  TextColumn get zodiacSign => text()();
  BoolColumn get hasDriversLicense => boolean()();
  TextColumn get transportMode => text()();
  BoolColumn get hasFertilityIssues => boolean()();
  BoolColumn get onBirthControl => boolean()();
  BoolColumn get isSterile => boolean()();
  BoolColumn get sickly => boolean()();
  BoolColumn get dead => boolean()();
}
