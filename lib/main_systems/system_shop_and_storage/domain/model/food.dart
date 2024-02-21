import 'package:drift/drift.dart';

@DataClassName("Food")
class FoodTable extends Table {
  @override
  String? get tableName => "food";

  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get type => text()();
  IntColumn get basePrice => integer()();
  IntColumn get lifespanInDays => integer()();
  IntColumn get nutrition => integer()();
  IntColumn get servings => integer()();
  BoolColumn get isOrganic => boolean()();
}
