import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

//used to track fridgefood and servings to take out
class FridgeFoodServingPair extends Equatable {
  final FridgeFood fridgeFood;
  final Food food;
  final int servings;

  const FridgeFoodServingPair({
    required this.fridgeFood,
    required this.food,
    required this.servings,
  });

  @override
  List<Object?> get props => [
        fridgeFood,
        food,
        servings,
      ];
}
