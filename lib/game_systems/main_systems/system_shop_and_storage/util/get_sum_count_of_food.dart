import 'package:toplife/core/data_source/drift_database/database_provider.dart';

int getSumCountOfFood(List<FridgeFood> food) {
  int sum = 0;

  for (var foodItem in food) {
    //if servings left is a negative number add 0
    sum += (foodItem.servingsLeft > 0) ? foodItem.servingsLeft : 0;
  }

  return sum;
}
