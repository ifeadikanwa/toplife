import 'package:auto_route/auto_route.dart';
import 'package:toplife/config/routing/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Screen,Route")
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        //* Game Manager
        AutoRoute(page: GameManagerRoute.page),

        //* Main Game
        AutoRoute(
          page: MainGameRoute.page,
          initial: true,
          children: [
            //* PLAYER
            AutoRoute(
              page: PlayerEmptyRouter.page,
              children: [
                //all screens under the player tab

                AutoRoute(
                  page: PlayerRoute.page,
                  initial: true,
                ),
              ],
            ),

            //* WORK
            AutoRoute(
              page: WorkEmptyRouter.page,
              children: [
                //all screens under the work tab

                AutoRoute(
                  page: WorkRoute.page,
                  initial: true,
                ),
              ],
            ),

            //* SHOP
            AutoRoute(
              page: ShopEmptyRouter.page,
              children: [
                //all screens under the shop tab

                AutoRoute(
                  page: ShopRoute.page,
                  initial: true,
                ),

                //- Food Shop
                CustomRoute(
                  page: FoodShopRoute.page,
                  transitionsBuilder: TransitionsBuilders.slideLeft,
                  children: [
                    AutoRoute(page: ReadyMealRoute.page),
                    AutoRoute(page: IngredientsRoute.page),
                    AutoRoute(page: DrinksRoute.page),
                    AutoRoute(page: SweetsRoute.page),
                  ],
                ),

                //- Car Shop
                CustomRoute(
                  page: CarShopRoute.page,
                  transitionsBuilder: TransitionsBuilders.slideLeft,
                  children: [
                    AutoRoute(page: NewCarsRoute.page),
                    AutoRoute(page: UsedCarsRoute.page),
                  ],
                ),

                //- Children Shop
                CustomRoute(
                  page: ChildrenShopRoute.page,
                  transitionsBuilder: TransitionsBuilders.slideLeft,
                  children: [
                    AutoRoute(page: ChildrenFoodRoute.page),
                    AutoRoute(page: ChildrenItemsRoute.page),
                  ],
                ),

                //- House Shop
                CustomRoute(
                  page: HouseShopRoute.page,
                  transitionsBuilder: TransitionsBuilders.slideLeft,
                  children: [
                    AutoRoute(page: RentalHousesRoute.page),
                    AutoRoute(page: PurchaseHousesRoute.page),
                  ],
                ),

                //- Jewelry Shop
                CustomRoute(
                  page: JewelryShopRoute.page,
                  transitionsBuilder: TransitionsBuilders.slideLeft,
                  children: [
                    AutoRoute(page: NaturalJewelryRoute.page),
                    AutoRoute(page: SyntheticJewelryRoute.page),
                  ],
                ),

                //- Supplies Shop
                CustomRoute(
                  page: SuppliesShopRoute.page,
                  transitionsBuilder: TransitionsBuilders.slideLeft,
                ),
              ],
            ),

            //* RELATIONSHIP
            AutoRoute(
              page: RelationshipEmptyRouter.page,
              children: [
                //all screens under the relationship tab

                AutoRoute(
                  page: RelationshipRoute.page,
                  initial: true,
                  children: [
                    //- TABS
                    AutoRoute(page: ParentsRoute.page),
                    AutoRoute(page: SiblingsRoute.page),
                    AutoRoute(page: PartnersRoute.page),
                    AutoRoute(page: ChildrenRoute.page),
                    AutoRoute(page: RelativesRoute.page),
                    AutoRoute(page: PastFamilyRoute.page),
                    AutoRoute(page: InLawsRoute.page),
                    AutoRoute(page: FriendsRoute.page),
                    AutoRoute(page: ExesRoute.page),
                    AutoRoute(page: GravesRoute.page),
                  ],
                ),

                AutoRoute(page: RelationshipActionsRoute.page)
              ],
            ),

            //* ACTIVITIES
            AutoRoute(
              page: ActivitiesEmptyRouter.page,
              children: [
                //all screens under the activities tab

                AutoRoute(
                  page: ActivitiesRoute.page,
                  initial: true,
                ),
                CustomRoute(
                  page: NeighborhoodRoute.page,
                  transitionsBuilder: TransitionsBuilders.slideLeft,
                ),
              ],
            ),
          ],
        ),
      ];
}
