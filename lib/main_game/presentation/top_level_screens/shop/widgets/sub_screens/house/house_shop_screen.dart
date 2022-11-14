import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:toplife/config/routing/app_router.gr.dart';
import 'package:toplife/core/common_widgets/app_screen_content_templates/tab_screen_content.dart';
import 'package:toplife/core/common_widgets/app_screens/inner_level_screen.dart';
import 'package:toplife/core/common_widgets/tab/app_tab.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/house/purchase_buildings_generator.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/house/rent_buildings_generator.dart';

class HouseShopScreen extends StatelessWidget {
  const HouseShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: [
        RentalHousesRoute(
          rentalHouses: RentBuildingsGenerator.generate(),
        ),
        PurchaseHousesRoute(
          purchaseHouses: PurchaseBuildingsGenerator.generate(),
        ),
      ],
      builder: (context, child, tabController) {
        return InnerLevelScreen(
          title: TextConstants.realEstate,
          child: TabScreenContent(
            tabController: tabController,
            tabs: const [
              AppTab(
                text: TextConstants.rent,
              ),
              AppTab(
                text: TextConstants.purchase,
              ),
            ],
            child: child,
          ),
        );
      },
    );
  }
}
