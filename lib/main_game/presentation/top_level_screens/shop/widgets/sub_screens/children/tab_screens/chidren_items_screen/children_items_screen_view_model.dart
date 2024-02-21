import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/shop.dart';

final childrenItemsScreenViewModelProvider =
    StateNotifierProvider<ChildrenItemsScreenViewModel, List<Item>>((ref) {
  return ChildrenItemsScreenViewModel();
});

class ChildrenItemsScreenViewModel extends StateNotifier<List<Item>> {
  ChildrenItemsScreenViewModel() : super([]) {
    _fetch();
  }

  void _fetch() {
    state = Shop.babyItemsList;
  }
}
