import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/repository/fridge_food_repository.dart';

class AddFoodToFridgeUsecase {
  final FridgeFoodRepository _fridgeFoodRepository;
  final GameUsecases _gameUsecases;

  const AddFoodToFridgeUsecase(
    this._fridgeFoodRepository,
    this._gameUsecases,
  );

  Future<void> execute({
    required int personID,
    required Food food,
    required int quantity,
  }) async {
    //get the current day
    final Game? currentGame =
        await _gameUsecases.getLastPlayedActiveGameUsecase.execute();

    if (currentGame != null) {
      final int totalServings = quantity * food.servings;

      final int expiryDay = currentGame.currentDay + food.lifespanInDays;

      final FridgeFood? existingFridgeFood =
          await _fridgeFoodRepository.findParticularFridgeFood(
        personID: personID,
        foodID: food.id,
        expiryDay: expiryDay,
      );

      //if fridge food already exists, update the record
      if (existingFridgeFood != null) {
        final updatedServingsLeft =
            existingFridgeFood.servingsLeft + totalServings;

        final updatedExistingFridgeFood = existingFridgeFood.copyWith(
          servingsLeft: updatedServingsLeft,
        );

        await _fridgeFoodRepository.updateFridgeFood(updatedExistingFridgeFood);
      }

      //else create a new record
      else {
        final createdFridgeFood = FridgeFood(
          id: DatabaseConstants.dummyId,
          personId: personID,
          foodId: food.id,
          servingsLeft: totalServings,
          expiryDay: expiryDay,
        );

        await _fridgeFoodRepository.createFridgeFood(createdFridgeFood);
      }
    }
  }
}
