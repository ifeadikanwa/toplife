import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/app_screen_content_templates/screen_content.dart';
import 'package:toplife/core/common_widgets/app_screens/inner_level_screen.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/helper_widgets/items_list_screen.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/shop.dart';

class SuppliesShopScreen extends StatelessWidget {
  const SuppliesShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InnerLevelScreen(
      title: TextConstants.supplies,
      child: Expanded(
        child: ScreenContent(
          content: ItemsListScreen(
            itemsList: Shop.suppliesList,
          ),
        ),
      ),
    );
  }
}
