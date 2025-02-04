import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/shop_info/car/car_generator.dart';

part 'new_cars_screen_view_model.g.dart';

@riverpod
class NewCarsScreenViewModel extends _$NewCarsScreenViewModel {
  @override
  List<Car> build() {
    return CarGenerator.generateNewCars();
  }

  void regenerateCars() {
    ref.invalidateSelf();
  }

  void removePurchasedCarFromShop(Car car) {
    //we don't have any/enough cars in the list
    if (state.isEmpty || state.length == 1) {
      regenerateCars();
    }

    //remove the purchased car
    else {
      //remove the purchased car this way so the ui reacts immediately
      state = state
          .where(
            (carElement) => carElement != car,
          )
          .toList();
    }
  }
}
