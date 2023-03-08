import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/shop.dart';

final sweetsScreenViewModelProvider =
    StateNotifierProvider<SweetsScreenViewModel, List<Food>>((ref) {
  return SweetsScreenViewModel();
});

class SweetsScreenViewModel extends StateNotifier<List<Food>> {
  SweetsScreenViewModel() : super([]) {
    _fetch();
  }

  void _fetch() {
    state = Shop.sweetsList;
  }
}
