import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/app_screen_content_templates/screen_content.dart';
import 'package:toplife/core/common_widgets/app_screens/inner_level_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/helper_widgets/empty_shop_list_screen.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/helper_widgets/items_list_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/supplies/supplies_shop_screen_view_model.dart';

class SuppliesShopScreen extends ConsumerWidget {
  const SuppliesShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suppliesList = ref.watch(suppliesShopScreenViewModelProvider);

    return InnerLevelScreen(
      title: TextConstants.supplies,
      child: Expanded(
        child: ScreenContent(
          content: (suppliesList.isEmpty)
              ? const EmptyShopListScreen()
              : ItemsListScreen(itemsList: suppliesList),
        ),
      ),
    );
  }
}
