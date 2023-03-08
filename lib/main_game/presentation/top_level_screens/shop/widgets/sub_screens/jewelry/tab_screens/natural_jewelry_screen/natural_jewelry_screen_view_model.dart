import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/jewelry/get_jewelries.dart';

final naturalJewelryScreenViewModelProvider =
    StateNotifierProvider<NaturalJewelryScreenViewModel, List<Jewelry>>((ref) {
  return NaturalJewelryScreenViewModel();
});

class NaturalJewelryScreenViewModel extends StateNotifier<List<Jewelry>> {
  NaturalJewelryScreenViewModel() : super([]) {
    _fetch();
  }

  void _fetch() {
    state = GetJewelries.naturalJewelries();
  }

  void regenerateJewelries() {
    _fetch();
  }
}
