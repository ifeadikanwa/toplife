import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:toplife/config/routing/app_router.gr.dart';
import 'package:toplife/core/common_widgets/app_bars/inner_level_app_bar.dart';
import 'package:toplife/core/common_widgets/app_screen_content_templates/tab_screen_content.dart';
import 'package:toplife/core/common_widgets/app_screens/inner_level_screen.dart';
import 'package:toplife/core/common_widgets/tab/app_tab.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/car/car_generator.dart';

class CarShopScreen extends StatelessWidget {
  const CarShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: [
        NewCarsRoute(
          newCars: CarGenerator.generateNewCars(),
        ),
        UsedCarsRoute(
          usedCars: CarGenerator.generateUsedCars(),
        ),
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
