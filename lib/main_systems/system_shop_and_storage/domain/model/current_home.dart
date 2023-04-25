import 'package:drift/drift.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/house.dart';

@DataClassName("CurrentHome")
class CurrentHomeTable extends Table {
  @override
  String? get tableName => "current_home";

  IntColumn get personId => integer().unique().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();
  IntColumn get houseId => integer().references(
        HouseTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();

  BoolColumn get hasManagementRights => boolean()();
  TextColumn get stayType => text()();
  IntColumn get exitDay => integer()();
}
