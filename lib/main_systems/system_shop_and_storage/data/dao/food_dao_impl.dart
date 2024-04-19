import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/core/utils/stats/stats_range/stats_range_constants.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/dao/food_dao.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/food.dart';

part 'food_dao_impl.g.dart';

@DriftAccessor(tables: [FoodTable])
class FoodDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$FoodDaoImplMixin
    implements FoodDao {
  FoodDaoImpl(super.database);

  @override
  Future<Food> createFood(Food food) async {
    final Food checkedFood = food.copyWith(
      nutrition: crossCheckStat(
        stat: food.nutrition,
        statsRange: StatsRangeConstants.defaultRange,
      ),
    );

    final FoodTableCompanion foodWithoutID =
        checkedFood.toCompanion(false).copyWith(id: const Value.absent());

    final foodID = await into(foodTable).insertOnConflictUpdate(foodWithoutID);

    return checkedFood.copyWith(id: foodID);
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
    final Food checkedFood = food.copyWith(
      nutrition: crossCheckStat(
        stat: food.nutrition,
        statsRange: StatsRangeConstants.defaultRange,
      ),
    );

    return update(foodTable).replace(checkedFood);
  }
}
