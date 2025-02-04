import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class FoodDao {
  Future<Food> createFood(Food food);
  Future<void> updateFood(Food food);
  Future<Food?> getFood(int foodID);
  Future<Food?> findFoodWithName(String foodName);
}
