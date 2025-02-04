import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class FridgeFoodDao {
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
  Stream<List<FridgeFood>> watchAllFridgeFood(int personID);
}
