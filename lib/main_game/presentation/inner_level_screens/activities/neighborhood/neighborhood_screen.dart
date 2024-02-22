import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/app_screen_content_templates/scrollable_screen_content.dart';
import 'package:toplife/core/common_widgets/app_screens/inner_level_screen.dart';
import 'package:toplife/core/common_widgets/list_templates/action_list_item.dart';
import 'package:toplife/core/dialogs/show_dialog/show_dismissable_dialog.dart';
import 'package:toplife/main_game/presentation/inner_level_screens/activities/neighborhood/constants/neighborhood_screen_text_constants.dart';
import 'package:toplife/main_game/presentation/inner_level_screens/activities/neighborhood/piercing_shop/widgets/piercing_shop_dialog_widget.dart';
import 'package:toplife/main_game/presentation/inner_level_screens/activities/neighborhood/tattoo_shop/widgets/tattoo_shop_dialog_widget.dart';

@RoutePage()
class NeighborhoodScreen extends StatelessWidget {
  const NeighborhoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return InnerLevelScreen(
      title: NeighborhoodScreenTextConstants.neighborhood,
      child: ScrollableScreenContent(
        content: Column(
          children: [
            ActionListItem(
              icon: Icons.store_outlined,
              actionTitle: NeighborhoodScreenTextConstants.tattooShop,
              actionDescription: NeighborhoodScreenTextConstants.tattooShopDesc,
              onTap: () => showDismissableDialog(
                context: context,
                child: const TattooShopDialogWidget(),
              ),
            ),
            ActionListItem(
              icon: Icons.store_outlined,
              actionTitle: NeighborhoodScreenTextConstants.piercingsShop,
              actionDescription:
                  NeighborhoodScreenTextConstants.piercingsShopDesc,
              onTap: () => showDismissableDialog(
                context: context,
                child: const PiercingShopDialogWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
