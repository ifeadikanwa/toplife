import 'package:toplife/main_systems/system_shop_and_storage/domain/model/fridge_food.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/repository/fridge_food_repository.dart';

class UseFoodUsecase {
  final FridgeFoodRepository _fridgeFoodRepository;

  const UseFoodUsecase(this._fridgeFoodRepository);

  Future<void> execute({
    required int fridgeFoodID,
    int servingsToUse = 1,
  }) async {
    //this not the eat usecase,
    //this is basically for telling the db we're using a ertain amount of this fridge food so adjust the db record to reflect that

    //get the food
    final FridgeFood? fridgeFood = await _fridgeFoodRepository.getFridgeFood(
      fridgeFoodID,
    );

    if (fridgeFood != null) {
      //if servings to use is >= servings left, delete the record
      if (servingsToUse >= fridgeFood.servingsLeft) {
        await _fridgeFoodRepository.deleteFridgeFood(fridgeFoodID);
      }
      //else just deduct the servings to use
      else {
        final newServingsLeft = fridgeFood.servingsLeft - servingsToUse;

        await _fridgeFoodRepository.updateFridgeFood(
          fridgeFood.copyWith(
            servingsLeft: newServingsLeft,
          ),
        );
      }
    }
  }
}
