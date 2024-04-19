import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/jewelry/get_jewelries.dart';

part 'natural_jewelry_screen_view_model.g.dart';

@riverpod
class NaturalJewelryScreenViewModel extends _$NaturalJewelryScreenViewModel {
  @override
  List<Jewelry> build() {
    return GetJewelries.naturalJewelries();
  }

  void regenerateJewelries() {
    //re fetch data
    ref.invalidateSelf();
  }

  void removePurchasedJewelryFromShop(Jewelry jewelry) {
    //we don't have any/enough jewelry in the list
    if (state.isEmpty || state.length == 1) {
      regenerateJewelries();
    }

    //remove the purchased jewelry
    else {
      //remove the purchased jewelry this way so the ui reacts immediately
      state = state
          .where(
            (jewelryElement) => jewelryElement != jewelry,
          )
          .toList();
    }
  }
}
