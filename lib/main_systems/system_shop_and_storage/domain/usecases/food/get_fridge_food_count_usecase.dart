import 'package:toplife/main_systems/system_shop_and_storage/domain/repository/fridge_food_repository.dart';

class GetFridgeFoodCountUsecase {
  final FridgeFoodRepository _fridgeFoodRepository;
  const GetFridgeFoodCountUsecase(this._fridgeFoodRepository);

  Future<int> execute({
    required int personID,
  }) async {
    //get all person fridge food
    final allFridgeFood =
        await _fridgeFoodRepository.getAllFridgeFood(personID);

    //return sum of all the servings left
    int sum = 0;

    for (var fridgeFood in allFridgeFood) {
      sum += fridgeFood.servingsLeft;
    }

    return sum;
  }
}
