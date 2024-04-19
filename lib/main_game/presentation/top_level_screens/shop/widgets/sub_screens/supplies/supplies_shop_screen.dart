import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/app_screen_content_templates/screen_content.dart';
import 'package:toplife/core/common_widgets/app_screens/inner_level_screen.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/helper_widgets/empty_shop_list_screen.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/helper_widgets/items_list_screen.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/shop.dart';

@RoutePage()
class SuppliesShopScreen extends StatelessWidget {
  const SuppliesShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //
    final List<Item> suppliesList = Shop.suppliesList;

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
