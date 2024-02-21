import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/car/car_generator.dart';

final usedCarsScreenViewModelProvider =
    StateNotifierProvider<UsedCarsScreenViewModel, List<Car>>((ref) {
  return UsedCarsScreenViewModel();
});

class UsedCarsScreenViewModel extends StateNotifier<List<Car>> {
  UsedCarsScreenViewModel() : super([]) {
    _fetch();
  }

  void _fetch() {
    state = CarGenerator.generateUsedCars();
  }

  void regenerateCars() {
    _fetch();
  }

  void removePurchasedCarFromShop(Car car) {
    if (state.isNotEmpty) {
      //remove the purchased car this way so the ui reacts immediately
      state = state
          .where(
            (carElement) => carElement != car,
          )
          .toList();
    }
  }
}
