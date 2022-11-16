import 'package:toplife/main_systems/system_shop_and_storage/domain/model/fridge_food.dart';

abstract class FridgeFoodRepository {
  Future<FridgeFood> createFridgeFood(FridgeFood fridgeFood);
  Future<FridgeFood?> getFridgeFood(int fridgeFoodID);
  Future<void> updateFridgeFood(FridgeFood fridgeFood);
  Future<void> deleteFridgeFood(int fridgeFoodID);
  Future<List<FridgeFood>> getAllFridgeFood(int personID);
  Future<FridgeFood?> findParticularFridgeFood({
    required int personID,
    required int foodID,
    required int expiryDay,
  });
}
