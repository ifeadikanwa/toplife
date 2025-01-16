import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/model/info_models/fridge_food_pair.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/repository/food_repository.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/repository/fridge_food_repository.dart';

class GetAllPersonFridgeFoodPairsUsecase {
  final FridgeFoodRepository _fridgeFoodRepository;
  final FoodRepository _foodRepository;

  const GetAllPersonFridgeFoodPairsUsecase(
    this._fridgeFoodRepository,
    this._foodRepository,
  );

  Future<List<FridgeFoodPair>> execute({
    required int personID,
  }) async {
    List<FridgeFoodPair> allFridgeFoodPair = [];

    //get all fridge food
    final List<FridgeFood> allFridgeFood =
        await _fridgeFoodRepository.getAllFridgeFood(personID);

    //for each fridge food, get the food record, create pair and add to list
    for (var fridgeFood in allFridgeFood) {
      //get food
      final Food? food = await _foodRepository.getFood(fridgeFood.foodId);

      //if food is valid
      if (food != null) {
        //create pair and add to list
        allFridgeFoodPair.add(
          FridgeFoodPair(
            food: food,
            fridgeFood: fridgeFood,
          ),
        );
      }
    }

    return allFridgeFoodPair;
  }
}
