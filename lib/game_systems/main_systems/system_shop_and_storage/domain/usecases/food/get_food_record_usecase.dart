import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/repository/food_repository.dart';

class GetFoodRecordUsecase {
  final FoodRepository _foodRepository;

  const GetFoodRecordUsecase(this._foodRepository);

  Future<Food> execute({
    required Food food,
  }) async {
    //find the food with name
    final Food? foodRecord = await _foodRepository.findFoodWithName(food.name);

    //if found- update record with object recieved then return update
    if (foodRecord != null) {
      final Food updatedFoodRecord = foodRecord.copyWith(
        type: food.type,
        basePrice: food.basePrice,
        lifespanInDays: food.lifespanInDays,
        nutrition: food.nutrition,
        servings: food.servings,
        isOrganic: food.isOrganic,
      );

      await _foodRepository.updateFood(updatedFoodRecord);

      return updatedFoodRecord;
    }
    //if not found- create new food record and return created object
    else {
      final Food createdFoodRecord = await _foodRepository.createFood(food);

      return createdFoodRecord;
    }
  }
}
