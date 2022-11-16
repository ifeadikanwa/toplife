import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/config/routing/app_router.gr.dart';
import 'package:toplife/core/common_widgets/app_screen_content_templates/scrollable_screen_content.dart';
import 'package:toplife/core/common_widgets/app_screens/top_level_screen.dart';
import 'package:toplife/core/common_widgets/spaces/add_horizontal_space.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/game_manager/presentation/game_states.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/food/buy_food_dialog.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/helper_widgets/shop_category_item.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/supplies/supplies.dart';

class ShopScreen extends ConsumerWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TopLevelScreen(
      title: TextConstants.shop,
      child: ScrollableScreenContent(
        content: Column(
          children: [
            const AddVerticalSpace(height: shopCategoryVerticalPadding),
            Row(
              children: [
                Expanded(
                  child: ShopCategoryItem(
                    icon: Icons.lunch_dining,
                    categoryTitle: TextConstants.food,
                    onTap: () => AutoRouter.of(context).push(
                      const FoodShopRoute(),
                    ),
                  ),
                ),
                const AddHorizontalSpace(width: shopCategoryHorizontalPadding),
                Expanded(
                  child: ShopCategoryItem(
                    icon: Icons.crib,
                    categoryTitle: TextConstants.children,
                    onTap: () => AutoRouter.of(context).push(
                      const ChildrenShopRoute(),
                    ),
                  ),
                ),
              ],
            ),
            const AddVerticalSpace(height: shopCategoryVerticalPadding),
            Row(
              children: [
                Expanded(
                  child: ShopCategoryItem(
                    icon: Icons.shopping_bag,
                    categoryTitle: TextConstants.supplies,
                    onTap: () => AutoRouter.of(context).push(
                      const SuppliesShopRoute(),
                    ),
                  ),
                ),
                const AddHorizontalSpace(width: shopCategoryHorizontalPadding),
                Expanded(
                  child: ShopCategoryItem(
                    icon: Icons.diamond,
                    categoryTitle: TextConstants.jeweler,
                    onTap: () => AutoRouter.of(context).push(
                      const JewelryShopRoute(),
                    ),
                  ),
                ),
              ],
            ),
            const AddVerticalSpace(height: shopCategoryVerticalPadding),
            Row(
              children: [
                Expanded(
                  child: ShopCategoryItem(
                    icon: Icons.directions_car,
                    categoryTitle: TextConstants.carDealer,
                    onTap: () => AutoRouter.of(context).push(
                      const CarShopRoute(),
                    ),
                  ),
                ),
                const AddHorizontalSpace(width: shopCategoryHorizontalPadding),
                Expanded(
                  child: ShopCategoryItem(
                    icon: Icons.house,
                    categoryTitle: TextConstants.realEstate,
                    onTap: () => AutoRouter.of(context).push(
                      const HouseShopRoute(),
                    ),
                  ),
                ),
              ],
            ),

            //test
            const AddVerticalSpace(height: 16.0),
            OutlinedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const BuyFoodDialog(),
                );
              },
              child: const Text("Dialog"),
            ),

            const AddVerticalSpace(height: 16.0),
            OutlinedButton(
              onPressed: () async {
                // ref.read(gameManagerViewModel.notifier).createGame(Person(
                //       firstName: "David",
                //       lastName: "Smith",
                //       dayOfBirth: 21,
                //       gender: Gender.Male.name,
                //       subjectPronoun: Gender.Male.subjectPronoun,
                //       objectPronoun: Gender.Male.objectPronoun,
                //       possessivePronoun: Gender.Male.possessivepronoun,
                //       sexuality: Sexuality.Straight.name,
                //       state: "Ontario",
                //       country: "Canada",
                //       money: 12000,
                //       zodiacSign: ZodiacSign.Libra.name,
                //       transportMode: "bus",
                //       hasFertilityIssues: false,
                //       onBirthControl: false,
                //       isSterile: false,
                //       sickly: false,
                //       rebellious: true,
                //       dead: false,
                //     ));

                // const house = House(
                //     isCurrentHome: true,
                //     bedrooms: 3,
                //     bathrooms: 2,
                //     storage: 8,
                //     address: "address",
                //     isForRent: true,
                //     buildingType: "buildingType",
                //     settlement: "City",
                //     country: "country",
                //     style: "style",
                //     lastMaintainedDay: 24,
                //     basePrice: 500,
                //     dayOfPurchase: 12,
                //     condition: 78,
                //     purchasePrice: 5900,
                //     fullyPaidFor: false);

                // const jewelry = Jewelry(
                //   jewel: "Gold",
                //   type: "ring",
                //   carat: 1.2,
                //   quality: "natural",
                //   basePrice: 500,
                //   dayOfPurchase: 34,
                //   maxConditionAtPurchase: 89,
                // );

                await ref
                    .watch(shopAndStorageUsecaseProvider)
                    .purchaseItemUsecase
                    .execute(
                      context: context,
                      personID: 1,
                      item: supplies.first,
                      quantity: 1,
                    );

                // print(result);
              },
              child: const Text("Purchase"),
            ),
          ],
        ),
      ),
    );
  }
}


//  [
//               const ShopListItem(
//                   itemName: BabyFoodNames.fuzziesMegaOrganicBabyFormula,
//                   itemDetails: "2 Servings",
//                   itemPrice: 30,
//                   itemImage: "itemImage"),
//               const ShopListItem(
//                   itemName: BabyFoodNames.mangoPuree,
//                   itemDetails: "2 Servings",
//                   itemPrice: 30,
//                   itemImage: "itemImage"),
//               const ShopListItem(
//                   itemName: BabyFoodNames.bananaAppleMangoPuree,
//                   itemDetails: "1 Servings",
//                   itemPrice: 55,
//                   itemImage: "itemImage"),
//               ShopListItem(
//                   itemName: BuildingType.mordernHome.fullName,
//                   itemDetails: "2 bedrooms & 1 bathroom",
//                   itemPrice: 250000,
//                   itemImage: "itemImage"),
//             ],