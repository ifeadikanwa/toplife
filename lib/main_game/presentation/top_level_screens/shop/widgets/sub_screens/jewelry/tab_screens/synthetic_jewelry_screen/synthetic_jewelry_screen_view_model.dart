import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/jewelry/get_jewelries.dart';

final syntheticJewelryScreenViewModelProvider =
    StateNotifierProvider<SyntheticJewelryScreenViewModel, List<Jewelry>>(
        (ref) {
  return SyntheticJewelryScreenViewModel();
});

class SyntheticJewelryScreenViewModel extends StateNotifier<List<Jewelry>> {
  SyntheticJewelryScreenViewModel() : super([]) {
    _fetch();
  }

  void _fetch() {
    state = GetJewelries.syntheticJewelries();
  }

  void regenerateJewelries() {
    _fetch();
  }

  void removePurchasedJewelryFromShop(Jewelry jewelry) {
    if (state.isNotEmpty) {
      //remove the purchased jewelry this way so the ui reacts immediately
      state = state
          .where(
            (jewelryElement) => jewelryElement != jewelry,
          )
          .toList();
    }
  }
}
