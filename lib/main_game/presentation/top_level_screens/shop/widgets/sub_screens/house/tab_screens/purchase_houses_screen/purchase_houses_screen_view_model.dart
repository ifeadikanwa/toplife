import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/house/purchase_buildings_generator.dart';

final purchaseHousesScreenViewModelProvider =
    StateNotifierProvider<PurchaseHousesScreenViewModel, List<House>>((ref) {
  return PurchaseHousesScreenViewModel();
});

class PurchaseHousesScreenViewModel extends StateNotifier<List<House>> {
  PurchaseHousesScreenViewModel() : super([]) {
    _fetch();
  }

  void _fetch() {
    state = PurchaseBuildingsGenerator.generate();
  }

  void regenerateHouses() {
    _fetch();
  }

  void removePurchasedHouseFromShop(House house) {
    if (state.isNotEmpty) {
      //remove the purchased house this way so the ui reacts immediately
      state = state
          .where(
            (houseElement) => houseElement != house,
          )
          .toList();
    }
  }
}
