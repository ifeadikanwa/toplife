import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/helper_widgets/items_list_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/children/tab_screens/chidren_items_screen/children_items_screen_view_model.dart';

class ChildrenItemsScreen extends ConsumerWidget {
  const ChildrenItemsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final childrenItemsList = ref.watch(childrenItemsScreenViewModelProvider);
    return ItemsListScreen(itemsList: childrenItemsList);
  }
}
