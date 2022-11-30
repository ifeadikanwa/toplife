import 'package:toplife/main_systems/system_shop_and_storage/domain/model/fridge_food.dart';

int getSumCountOfFood(List<FridgeFood> food) {
  int sum = 0;

  for (var foodItem in food) {
    //if servings left is a negative number add 0
    sum += (foodItem.servingsLeft > 0) ? foodItem.servingsLeft : 0;
  }

  return sum;
}
