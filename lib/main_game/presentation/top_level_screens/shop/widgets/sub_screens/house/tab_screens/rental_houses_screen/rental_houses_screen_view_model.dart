import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/house/rent_buildings_generator.dart';

final rentalHousesScreenViewModelProvider =
    StateNotifierProvider<RentalHousesScreenViewModel, List<House>>((ref) {
  return RentalHousesScreenViewModel();
});

class RentalHousesScreenViewModel extends StateNotifier<List<House>> {
  RentalHousesScreenViewModel() : super([]) {
    _fetch();
  }

  void _fetch() {
    state = RentBuildingsGenerator.generate();
  }

  void regenerateHouses() {
    _fetch();
  }

  void removeRentedHouseFromShop(House house) {
    if (state.isNotEmpty) {
      //remove the rented house this way so the ui reacts immediately
      state = state
          .where(
            (houseElement) => houseElement != house,
          )
          .toList();
    }
  }
}
