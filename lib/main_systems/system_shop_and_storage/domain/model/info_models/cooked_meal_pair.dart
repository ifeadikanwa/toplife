import 'package:equatable/equatable.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/food.dart';

class CookedMealPair extends Equatable {
  final Food food;
  //Map<ingredientName, count>
  final Map<String, int> ingredients;

  const CookedMealPair({required this.food, required this.ingredients});

  @override
  List<Object?> get props => [
        food,
        ingredients,
      ];
}
