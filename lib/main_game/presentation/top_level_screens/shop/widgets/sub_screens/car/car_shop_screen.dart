import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:toplife/config/routing/app_router.gr.dart';
import 'package:toplife/core/common_widgets/app_screen_content_templates/tab_screen_content.dart';
import 'package:toplife/core/common_widgets/app_screens/inner_level_screen.dart';
import 'package:toplife/core/common_widgets/tab/app_tab.dart';
import 'package:toplife/core/text_constants.dart';

@RoutePage()
class CarShopScreen extends StatelessWidget {
  const CarShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: const [
        NewCarsRoute(),
        UsedCarsRoute(),
      ],
      builder: (context, child, tabController) {
        return InnerLevelScreen(
          title: TextConstants.carDealer,
          child: TabScreenContent(
            tabController: tabController,
            tabs: const [
              AppTab(
                text: TextConstants.new_,
              ),
              AppTab(
                text: TextConstants.used,
              ),
            ],
            child: child,
          ),
        );
      },
    );
  }
}
