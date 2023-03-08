import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/car/car_generator.dart';

final newCarsScreenViewModelProvider =
    StateNotifierProvider<NewCarsScreenViewModel, List<Car>>((ref) {
  return NewCarsScreenViewModel();
});

class NewCarsScreenViewModel extends StateNotifier<List<Car>> {
  NewCarsScreenViewModel() : super([]) {
    _fetch();
  }

  void _fetch() {
    state = CarGenerator.generateNewCars();
  }

  void regenerateCars() {
    _fetch();
  }
}
