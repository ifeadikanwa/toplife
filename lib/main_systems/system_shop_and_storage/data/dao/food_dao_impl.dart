import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/dao/food_dao.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/food.dart';

part 'food_dao_impl.g.dart';

@DriftAccessor(tables: [FoodTable])
class FoodDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$FoodDaoImplMixin
    implements FoodDao {
  FoodDaoImpl(DatabaseProvider database) : super(database);

  @override
  Future<Food> createFood(Food food) async {
    final FoodTableCompanion foodWithoutID =
        food.toCompanion(false).copyWith(id: const Value.absent());

    final foodID = await into(foodTable).insertOnConflictUpdate(foodWithoutID);
    return food.copyWith(id: foodID);
  }

  @override
  Future<Food?> findFoodWithName(String foodName) {
    return (select(foodTable)
          ..where((food) => food.name.equals(foodName))
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<Food?> getFood(int foodID) {
    return (select(foodTable)
          ..where((food) => food.id.equals(foodID))
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<void> updateFood(Food food) {
    return update(foodTable).replace(food);
  }
}
