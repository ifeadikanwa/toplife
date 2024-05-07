import 'package:drift/drift.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/model/car.dart';

@DataClassName("CarProblem")
class CarProblemTable extends Table {
  @override
  String? get tableName => "car_problem";

  IntColumn get carId => integer().references(
        CarTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();
  TextColumn get type => text()();
  IntColumn get basePrice => integer()();
  IntColumn get originDay => integer()();
  IntColumn get fixDay => integer()();
  BoolColumn get isRevealed => boolean()();
  BoolColumn get isResolved => boolean()();

  @override
  Set<Column<Object>>? get primaryKey => {
        carId,
        type,
      };
}
