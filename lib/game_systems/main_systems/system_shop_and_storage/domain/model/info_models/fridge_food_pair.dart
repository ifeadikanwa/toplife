import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

class FridgeFoodPair extends Equatable {
  final Food food;
  final FridgeFood fridgeFood;

  const FridgeFoodPair({
    required this.food,
    required this.fridgeFood,
  });

  @override
  List<Object?> get props => [
        food,
        fridgeFood,
      ];
}
