import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/dao/food_dao.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/repository/food_repository.dart';

class FoodRepositoryImpl implements FoodRepository {
  final FoodDao _foodDao;

  const FoodRepositoryImpl({
    required FoodDao foodDao,
  }) : _foodDao = foodDao;

  @override
  Future<Food> createFood(Food food) async {
    return _foodDao.createFood(food);
  }

  @override
  Future<Food?> findFoodWithName(String foodName) async {
    return _foodDao.findFoodWithName(foodName);
  }

  @override
  Future<Food?> getFood(int foodID) async {
    return _foodDao.getFood(foodID);
  }

  @override
  Future<void> updateFood(Food food) async {
    return _foodDao.updateFood(food);
  }
}
