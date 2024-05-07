import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/dao/fridge_food_dao.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/repository/fridge_food_repository.dart';

class FridgeFoodRepositoryImpl implements FridgeFoodRepository {
  final FridgeFoodDao _fridgeFoodDao;

  const FridgeFoodRepositoryImpl({required FridgeFoodDao fridgeFoodDao})
      : _fridgeFoodDao = fridgeFoodDao;

  @override
  Future<FridgeFood> createFridgeFood(FridgeFood fridgeFood) async {
    return _fridgeFoodDao.createFridgeFood(fridgeFood);
  }

  @override
  Future<void> deleteFridgeFood(int fridgeFoodID) async {
    return _fridgeFoodDao.deleteFridgeFood(fridgeFoodID);
  }

  @override
  Future<List<FridgeFood>> getAllFridgeFood(int personID) async {
    return _fridgeFoodDao.getAllFridgeFood(personID);
  }

  @override
  Future<FridgeFood?> getFridgeFood(int fridgeFoodID) async {
    return _fridgeFoodDao.getFridgeFood(fridgeFoodID);
  }

  @override
  Future<void> updateFridgeFood(FridgeFood fridgeFood) async {
    return _fridgeFoodDao.updateFridgeFood(fridgeFood);
  }

  @override
  Future<FridgeFood?> findParticularFridgeFood({
    required int personID,
    required int foodID,
    required int expiryDay,
  }) async {
    return _fridgeFoodDao.findParticularFridgeFood(
      personID: personID,
      foodID: foodID,
      expiryDay: expiryDay,
    );
  }

  @override
  Stream<List<FridgeFood>> watchAllFridgeFood(int personID) {
    return _fridgeFoodDao.watchAllFridgeFood(personID);
  }
}
