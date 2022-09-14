import 'package:toplife/main_systems/system_shop_and_storage/domain/model/food.dart';

abstract class FoodRepository {
  Future<Food> createFood(Food food);
  Future<void> updateFood(Food food);
  Future<Food?> getFood(int foodID);
  Future<Food?> findFoodWithName(String foodName);
}
