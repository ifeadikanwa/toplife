import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

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
