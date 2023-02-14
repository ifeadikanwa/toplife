import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:toplife/config/routing/route_name.dart';
import 'package:toplife/game_manager/presentation/game_manager_screen.dart';
import 'package:toplife/main_game/presentation/main_game_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/activities/widgets/activities_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/player/widgets/player_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/relationship_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/sub_screens/children_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/sub_screens/exes_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/sub_screens/friends_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/sub_screens/graveyard_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/sub_screens/inlaws_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/sub_screens/parents_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/sub_screens/partners_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/sub_screens/relatives_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/sub_screens/siblings_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/shop_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/car/car_shop_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/car/tab_screens/new_cars_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/car/tab_screens/used_cars_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/children/children_shop_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/children/tab_screens/children_food_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/children/tab_screens/children_items_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/food/food_shop_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/food/tab_screens/drinks_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/food/tab_screens/ingredients_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/food/tab_screens/ready_meals_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/food/tab_screens/sweets_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/house/house_shop_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/house/tab_screens/purchase_houses_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/house/tab_screens/rental_houses_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/jewelry/jewelry_shop_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/jewelry/tab_screens/natural_jewelry_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/jewelry/tab_screens/synthetic_jewelry_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/supplies/supplies_shop_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/work/widgets/work_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: "Screen,Route",
  routes: [
    //Main Game
    AutoRoute(
      path: RouteName.mainGamePath,
      page: MainGameScreen,
      initial: true,
      children: [
        //* PLAYER
        AutoRoute(
          path: RouteName.playerPath,
          name: RouteName.playerRouter,
          page: EmptyRouterPage,
          children: [
            //all screens under player tab
            AutoRoute(
              path: RouteName.emptyPath,
              page: PlayerScreen,
            ),
          ],
        ),

        //* WORK
        AutoRoute(
          path: RouteName.workPath,
          name: RouteName.workRouter,
          page: EmptyRouterPage,
          children: [
            //all screens under work tab
            AutoRoute(
              path: RouteName.emptyPath,
              page: WorkScreen,
            ),
          ],
        ),

        //* SHOP
        AutoRoute(
          path: RouteName.shopPath,
          name: RouteName.shopRouter,
          page: EmptyRouterPage,
          children: [
            //all screens under shop tab

            AutoRoute(
              path: RouteName.emptyPath,
              page: ShopScreen,
            ),

            //!Database viewer for testing purposes
            AutoRoute(path: 'database_viewer', page: DriftDbViewer),

            CustomRoute(
              path: RouteName.foodShopPath,
              page: FoodShopScreen,
              transitionsBuilder: TransitionsBuilders.slideLeft,
              children: [
                AutoRoute(
                  path: RouteName.readyMealsPath,
                  page: ReadyMealScreen,
                ),
                AutoRoute(
                  path: RouteName.ingredientsPath,
                  page: IngredientsScreen,
                ),
                AutoRoute(
                  path: RouteName.drinksPath,
                  page: DrinksScreen,
                ),
                AutoRoute(
                  path: RouteName.sweetsPath,
                  page: SweetsScreen,
                ),
              ],
            ),

            CustomRoute(
              path: RouteName.carShopPath,
              page: CarShopScreen,
              transitionsBuilder: TransitionsBuilders.slideLeft,
              children: [
                AutoRoute(
                  path: RouteName.newCarsPath,
                  page: NewCarsScreen,
                ),
                AutoRoute(
                  path: RouteName.usedCarsPath,
                  page: UsedCarsScreen,
                ),
              ],
            ),

            CustomRoute(
              path: RouteName.childrenShopPath,
              page: ChildrenShopScreen,
              transitionsBuilder: TransitionsBuilders.slideLeft,
              children: [
                AutoRoute(
                  path: RouteName.childrenFoodPath,
                  page: ChildrenFoodScreen,
                ),
                AutoRoute(
                  path: RouteName.childrenItemsPath,
                  page: ChildrenItemsScreen,
                ),
              ],
            ),

            CustomRoute(
              path: RouteName.houseShopPath,
              page: HouseShopScreen,
              transitionsBuilder: TransitionsBuilders.slideLeft,
              children: [
                AutoRoute(
                  path: RouteName.rentalHousesPath,
                  page: RentalHousesScreen,
                ),
                AutoRoute(
                  path: RouteName.purchaseHousesPath,
                  page: PurchaseHousesScreen,
                ),
              ],
            ),

            CustomRoute(
              path: RouteName.jewelryShopPath,
              page: JewelryShopScreen,
              transitionsBuilder: TransitionsBuilders.slideLeft,
              children: [
                AutoRoute(
                  path: RouteName.naturalJewelryPath,
                  page: NaturalJewelryScreen,
                ),
                AutoRoute(
                  path: RouteName.syntheticJewelryPath,
                  page: SyntheticJewelryScreen,
                ),
              ],
            ),

            CustomRoute(
              path: RouteName.suppliesPath,
              page: SuppliesShopScreen,
              transitionsBuilder: TransitionsBuilders.slideLeft,
            ),
          ],
        ),

        //* RELATIONSHIPS
        AutoRoute(
          path: RouteName.relationshipPath,
          name: RouteName.relationshipRouter,
          page: EmptyRouterPage,
          children: [
            //all screens under relationship tab
            AutoRoute(
              path: RouteName.emptyPath,
              page: RelationshipScreen,
              //all tabs in relationship screen
              children: [
                AutoRoute(path: RouteName.parentsPath, page: ParentsScreen),
                AutoRoute(path: RouteName.siblingsPath, page: SiblingsScreen),
                AutoRoute(path: RouteName.partnersPath, page: PartnersScreen),
                AutoRoute(path: RouteName.childrenPath, page: ChildrenScreen),
                AutoRoute(path: RouteName.relativesPath, page: RelativesScreen),
                AutoRoute(path: RouteName.inLawsPath, page: InLawsScreen),
                AutoRoute(path: RouteName.friendsPath, page: FriendsScreen),
                AutoRoute(path: RouteName.exesPath, page: ExesScreen),
                AutoRoute(path: RouteName.graveyardPath, page: GraveyardScreen),
              ],
            ),
          ],
        ),
        AutoRoute(
          path: RouteName.activitiesPath,
          name: RouteName.activitiesRouter,
          page: EmptyRouterPage,
          children: [
            //all screens under activities tab
            AutoRoute(
              path: RouteName.emptyPath,
              page: ActivitiesScreen,
            ),
          ],
        ),
      ],
    ),
    //Game Manager
    AutoRoute(
      path: RouteName.gameManagerPath,
      page: GameManagerScreen,
      children: [],
    ),
  ],
)
class $AppRouter {}
