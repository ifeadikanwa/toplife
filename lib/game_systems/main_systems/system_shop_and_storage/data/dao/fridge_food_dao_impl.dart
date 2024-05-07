import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/dao/fridge_food_dao.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/model/fridge_food.dart';

part 'fridge_food_dao_impl.g.dart';

@DriftAccessor(tables: [FridgeFoodTable])
class FridgeFoodDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$FridgeFoodDaoImplMixin
    implements FridgeFoodDao {
  FridgeFoodDaoImpl(super.database);

  @override
  Future<FridgeFood> createFridgeFood(FridgeFood fridgeFood) async {
    final FridgeFoodTableCompanion fridgeFoodWithoutID =
        fridgeFood.toCompanion(false).copyWith(id: const Value.absent());

    final fridgeFoodID =
        await into(fridgeFoodTable).insertOnConflictUpdate(fridgeFoodWithoutID);
    return fridgeFood.copyWith(id: fridgeFoodID);
  }

  @override
  Future<void> deleteFridgeFood(int fridgeFoodID) {
    return (delete(fridgeFoodTable)
          ..where((fridgeFood) => fridgeFood.id.equals(fridgeFoodID)))
        .go();
  }

  @override
  Future<FridgeFood?> findParticularFridgeFood(
      {required int personID, required int foodID, required int expiryDay}) {
    return (select(fridgeFoodTable)
          ..where(
            (fridgeFood) =>
                fridgeFood.personId.equals(personID) &
                fridgeFood.foodId.equals(foodID) &
                fridgeFood.expiryDay.equals(expiryDay),
          )
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<List<FridgeFood>> getAllFridgeFood(int personID) {
    return (select(fridgeFoodTable)
          ..where(
            (fridgeFood) => fridgeFood.personId.equals(personID),
          ))
        .get();
  }

  @override
  Future<FridgeFood?> getFridgeFood(int fridgeFoodID) {
    return (select(fridgeFoodTable)
          ..where((fridgeFood) => fridgeFood.id.equals(fridgeFoodID))
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<void> updateFridgeFood(FridgeFood fridgeFood) {
    return update(fridgeFoodTable).replace(fridgeFood);
  }

  @override
  Stream<List<FridgeFood>> watchAllFridgeFood(int personID) {
    return (select(fridgeFoodTable)
          ..where(
            (fridgeFood) => fridgeFood.personId.equals(personID),
          ))
        .watch();
  }
}
