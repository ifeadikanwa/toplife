// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i37;
import 'package:auto_route/empty_router_widgets.dart' as _i3;
import 'package:drift/drift.dart' as _i39;
import 'package:drift_db_viewer/drift_db_viewer.dart' as _i7;
import 'package:flutter/material.dart' as _i38;

import '../../core/data_source/drift_database/database_provider.dart' as _i47;
import '../../game_manager/presentation/game_manager_screen.dart' as _i2;
import '../../main_game/presentation/main_game_screen.dart' as _i1;
import '../../main_game/presentation/top_level_screens/activities/widgets/activities_screen.dart'
    as _i36;
import '../../main_game/presentation/top_level_screens/player/widgets/player_screen.dart'
    as _i4;
import '../../main_game/presentation/top_level_screens/relationship/widgets/relationship_screen.dart'
    as _i26;
import '../../main_game/presentation/top_level_screens/relationship/widgets/sub_screens/children_screen.dart'
    as _i30;
import '../../main_game/presentation/top_level_screens/relationship/widgets/sub_screens/exes_screen.dart'
    as _i34;
import '../../main_game/presentation/top_level_screens/relationship/widgets/sub_screens/friends_screen.dart'
    as _i33;
import '../../main_game/presentation/top_level_screens/relationship/widgets/sub_screens/graveyard_screen.dart'
    as _i35;
import '../../main_game/presentation/top_level_screens/relationship/widgets/sub_screens/inlaws_screen.dart'
    as _i32;
import '../../main_game/presentation/top_level_screens/relationship/widgets/sub_screens/parents_screen.dart'
    as _i27;
import '../../main_game/presentation/top_level_screens/relationship/widgets/sub_screens/partners_screen.dart'
    as _i29;
import '../../main_game/presentation/top_level_screens/relationship/widgets/sub_screens/relatives_screen.dart'
    as _i31;
import '../../main_game/presentation/top_level_screens/relationship/widgets/sub_screens/siblings_screen.dart'
    as _i28;
import '../../main_game/presentation/top_level_screens/shop/widgets/shop_screen.dart'
    as _i6;
import '../../main_game/presentation/top_level_screens/shop/widgets/sub_screens/car/car_shop_screen.dart'
    as _i9;
import '../../main_game/presentation/top_level_screens/shop/widgets/sub_screens/car/tab_screens/new_cars_screen.dart'
    as _i18;
import '../../main_game/presentation/top_level_screens/shop/widgets/sub_screens/car/tab_screens/used_cars_screen.dart'
    as _i19;
import '../../main_game/presentation/top_level_screens/shop/widgets/sub_screens/children/children_shop_screen.dart'
    as _i10;
import '../../main_game/presentation/top_level_screens/shop/widgets/sub_screens/children/tab_screens/children_food_screen.dart'
    as _i20;
import '../../main_game/presentation/top_level_screens/shop/widgets/sub_screens/children/tab_screens/children_items_screen.dart'
    as _i21;
import '../../main_game/presentation/top_level_screens/shop/widgets/sub_screens/food/food_shop_screen.dart'
    as _i8;
import '../../main_game/presentation/top_level_screens/shop/widgets/sub_screens/food/tab_screens/drinks_screen.dart'
    as _i16;
import '../../main_game/presentation/top_level_screens/shop/widgets/sub_screens/food/tab_screens/ingredients_screen.dart'
    as _i15;
import '../../main_game/presentation/top_level_screens/shop/widgets/sub_screens/food/tab_screens/ready_meals_screen.dart'
    as _i14;
import '../../main_game/presentation/top_level_screens/shop/widgets/sub_screens/food/tab_screens/sweets_screen.dart'
    as _i17;
import '../../main_game/presentation/top_level_screens/shop/widgets/sub_screens/house/house_shop_screen.dart'
    as _i11;
import '../../main_game/presentation/top_level_screens/shop/widgets/sub_screens/house/tab_screens/purchase_houses_screen.dart'
    as _i23;
import '../../main_game/presentation/top_level_screens/shop/widgets/sub_screens/house/tab_screens/rental_houses_screen.dart'
    as _i22;
import '../../main_game/presentation/top_level_screens/shop/widgets/sub_screens/jewelry/jewelry_shop_screen.dart'
    as _i12;
import '../../main_game/presentation/top_level_screens/shop/widgets/sub_screens/jewelry/tab_screens/natural_jewelry_screen.dart'
    as _i24;
import '../../main_game/presentation/top_level_screens/shop/widgets/sub_screens/jewelry/tab_screens/synthetic_jewelry_screen.dart'
    as _i25;
import '../../main_game/presentation/top_level_screens/shop/widgets/sub_screens/supplies/supplies_shop_screen.dart'
    as _i13;
import '../../main_game/presentation/top_level_screens/work/widgets/work_screen.dart'
    as _i5;
import '../../main_systems/system_relationship/domain/model/child.dart' as _i50;
import '../../main_systems/system_relationship/domain/model/friend.dart'
    as _i53;
import '../../main_systems/system_relationship/domain/model/graveyard.dart'
    as _i54;
import '../../main_systems/system_relationship/domain/model/info_models/relationship_pair.dart'
    as _i45;
import '../../main_systems/system_relationship/domain/model/inlaw.dart' as _i52;
import '../../main_systems/system_relationship/domain/model/parent.dart'
    as _i46;
import '../../main_systems/system_relationship/domain/model/partner.dart'
    as _i49;
import '../../main_systems/system_relationship/domain/model/relative.dart'
    as _i51;
import '../../main_systems/system_relationship/domain/model/sibling.dart'
    as _i48;
import '../../main_systems/system_shop_and_storage/domain/model/car.dart'
    as _i41;
import '../../main_systems/system_shop_and_storage/domain/model/food.dart'
    as _i40;
import '../../main_systems/system_shop_and_storage/domain/model/house.dart'
    as _i43;
import '../../main_systems/system_shop_and_storage/domain/model/item.dart'
    as _i42;
import '../../main_systems/system_shop_and_storage/domain/model/jewelry.dart'
    as _i44;

class AppRouter extends _i37.RootStackRouter {
  AppRouter([_i38.GlobalKey<_i38.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i37.PageFactory> pagesMap = {
    MainGameRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MainGameScreen(),
      );
    },
    GameManagerRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.GameManagerScreen(),
      );
    },
    PlayerRouter.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
      );
    },
    WorkRouter.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
      );
    },
    ShopRouter.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
      );
    },
    RelationshipRouter.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
      );
    },
    ActivitiesRouter.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
      );
    },
    PlayerRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.PlayerScreen(),
      );
    },
    WorkRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.WorkScreen(),
      );
    },
    ShopRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.ShopScreen(),
      );
    },
    DriftDbViewer.name: (routeData) {
      final args = routeData.argsAs<DriftDbViewerArgs>();
      return _i37.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.DriftDbViewer(args.db),
      );
    },
    FoodShopRoute.name: (routeData) {
      return _i37.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i8.FoodShopScreen(),
        transitionsBuilder: _i37.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CarShopRoute.name: (routeData) {
      return _i37.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i9.CarShopScreen(),
        transitionsBuilder: _i37.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ChildrenShopRoute.name: (routeData) {
      return _i37.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i10.ChildrenShopScreen(),
        transitionsBuilder: _i37.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HouseShopRoute.name: (routeData) {
      return _i37.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i11.HouseShopScreen(),
        transitionsBuilder: _i37.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false,
      );
    },
    JewelryShopRoute.name: (routeData) {
      return _i37.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i12.JewelryShopScreen(),
        transitionsBuilder: _i37.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SuppliesShopRoute.name: (routeData) {
      return _i37.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i13.SuppliesShopScreen(),
        transitionsBuilder: _i37.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ReadyMealRoute.name: (routeData) {
      final args = routeData.argsAs<ReadyMealRouteArgs>();
      return _i37.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i14.ReadyMealScreen(
          key: args.key,
          readyMeals: args.readyMeals,
        ),
      );
    },
    IngredientsRoute.name: (routeData) {
      final args = routeData.argsAs<IngredientsRouteArgs>();
      return _i37.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i15.IngredientsScreen(
          key: args.key,
          ingredients: args.ingredients,
        ),
      );
    },
    DrinksRoute.name: (routeData) {
      final args = routeData.argsAs<DrinksRouteArgs>();
      return _i37.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i16.DrinksScreen(
          key: args.key,
          drinks: args.drinks,
        ),
      );
    },
    SweetsRoute.name: (routeData) {
      final args = routeData.argsAs<SweetsRouteArgs>();
      return _i37.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i17.SweetsScreen(
          key: args.key,
          sweets: args.sweets,
        ),
      );
    },
    NewCarsRoute.name: (routeData) {
      final args = routeData.argsAs<NewCarsRouteArgs>();
      return _i37.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i18.NewCarsScreen(
          key: args.key,
          newCars: args.newCars,
        ),
      );
    },
    UsedCarsRoute.name: (routeData) {
      final args = routeData.argsAs<UsedCarsRouteArgs>();
      return _i37.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i19.UsedCarsScreen(
          key: args.key,
          usedCars: args.usedCars,
        ),
      );
    },
    ChildrenFoodRoute.name: (routeData) {
      final args = routeData.argsAs<ChildrenFoodRouteArgs>();
      return _i37.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i20.ChildrenFoodScreen(
          key: args.key,
          childrenFood: args.childrenFood,
        ),
      );
    },
    ChildrenItemsRoute.name: (routeData) {
      final args = routeData.argsAs<ChildrenItemsRouteArgs>();
      return _i37.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i21.ChildrenItemsScreen(
          key: args.key,
          childrenItems: args.childrenItems,
        ),
      );
    },
    RentalHousesRoute.name: (routeData) {
      final args = routeData.argsAs<RentalHousesRouteArgs>();
      return _i37.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i22.RentalHousesScreen(
          key: args.key,
          rentalHouses: args.rentalHouses,
        ),
      );
    },
    PurchaseHousesRoute.name: (routeData) {
      final args = routeData.argsAs<PurchaseHousesRouteArgs>();
      return _i37.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i23.PurchaseHousesScreen(
          key: args.key,
          purchaseHouses: args.purchaseHouses,
        ),
      );
    },
    NaturalJewelryRoute.name: (routeData) {
      final args = routeData.argsAs<NaturalJewelryRouteArgs>();
      return _i37.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i24.NaturalJewelryScreen(
          key: args.key,
          naturalJewelries: args.naturalJewelries,
        ),
      );
    },
    SyntheticJewelryRoute.name: (routeData) {
      final args = routeData.argsAs<SyntheticJewelryRouteArgs>();
      return _i37.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i25.SyntheticJewelryScreen(
          key: args.key,
          syntheticJewelries: args.syntheticJewelries,
        ),
      );
    },
    RelationshipRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i26.RelationshipScreen(),
      );
    },
    ParentsRoute.name: (routeData) {
      final args = routeData.argsAs<ParentsRouteArgs>();
      return _i37.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i27.ParentsScreen(
          key: args.key,
          parents: args.parents,
        ),
      );
    },
    SiblingsRoute.name: (routeData) {
      final args = routeData.argsAs<SiblingsRouteArgs>();
      return _i37.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i28.SiblingsScreen(
          key: args.key,
          siblings: args.siblings,
        ),
      );
    },
    PartnersRoute.name: (routeData) {
      final args = routeData.argsAs<PartnersRouteArgs>();
      return _i37.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i29.PartnersScreen(
          key: args.key,
          partners: args.partners,
        ),
      );
    },
    ChildrenRoute.name: (routeData) {
      final args = routeData.argsAs<ChildrenRouteArgs>();
      return _i37.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i30.ChildrenScreen(
          key: args.key,
          childrenList: args.childrenList,
        ),
      );
    },
    RelativesRoute.name: (routeData) {
      final args = routeData.argsAs<RelativesRouteArgs>();
      return _i37.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i31.RelativesScreen(
          key: args.key,
          relatives: args.relatives,
        ),
      );
    },
    InLawsRoute.name: (routeData) {
      final args = routeData.argsAs<InLawsRouteArgs>();
      return _i37.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i32.InLawsScreen(
          key: args.key,
          inLaws: args.inLaws,
        ),
      );
    },
    FriendsRoute.name: (routeData) {
      final args = routeData.argsAs<FriendsRouteArgs>();
      return _i37.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i33.FriendsScreen(
          key: args.key,
          friends: args.friends,
        ),
      );
    },
    ExesRoute.name: (routeData) {
      final args = routeData.argsAs<ExesRouteArgs>();
      return _i37.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i34.ExesScreen(
          key: args.key,
          exes: args.exes,
        ),
      );
    },
    GraveyardRoute.name: (routeData) {
      final args = routeData.argsAs<GraveyardRouteArgs>();
      return _i37.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i35.GraveyardScreen(
          key: args.key,
          graveyards: args.graveyards,
        ),
      );
    },
    ActivitiesRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i36.ActivitiesScreen(),
      );
    },
  };

  @override
  List<_i37.RouteConfig> get routes => [
        _i37.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/maingame',
          fullMatch: true,
        ),
        _i37.RouteConfig(
          MainGameRoute.name,
          path: '/maingame',
          children: [
            _i37.RouteConfig(
              PlayerRouter.name,
              path: 'player',
              parent: MainGameRoute.name,
              children: [
                _i37.RouteConfig(
                  PlayerRoute.name,
                  path: '',
                  parent: PlayerRouter.name,
                )
              ],
            ),
            _i37.RouteConfig(
              WorkRouter.name,
              path: 'work',
              parent: MainGameRoute.name,
              children: [
                _i37.RouteConfig(
                  WorkRoute.name,
                  path: '',
                  parent: WorkRouter.name,
                )
              ],
            ),
            _i37.RouteConfig(
              ShopRouter.name,
              path: 'shop',
              parent: MainGameRoute.name,
              children: [
                _i37.RouteConfig(
                  ShopRoute.name,
                  path: '',
                  parent: ShopRouter.name,
                ),
                _i37.RouteConfig(
                  DriftDbViewer.name,
                  path: 'database_viewer',
                  parent: ShopRouter.name,
                ),
                _i37.RouteConfig(
                  FoodShopRoute.name,
                  path: 'food_shop',
                  parent: ShopRouter.name,
                  children: [
                    _i37.RouteConfig(
                      ReadyMealRoute.name,
                      path: 'ready_meals',
                      parent: FoodShopRoute.name,
                    ),
                    _i37.RouteConfig(
                      IngredientsRoute.name,
                      path: 'ingredients',
                      parent: FoodShopRoute.name,
                    ),
                    _i37.RouteConfig(
                      DrinksRoute.name,
                      path: 'drinks',
                      parent: FoodShopRoute.name,
                    ),
                    _i37.RouteConfig(
                      SweetsRoute.name,
                      path: 'sweets',
                      parent: FoodShopRoute.name,
                    ),
                  ],
                ),
                _i37.RouteConfig(
                  CarShopRoute.name,
                  path: 'car_shop',
                  parent: ShopRouter.name,
                  children: [
                    _i37.RouteConfig(
                      NewCarsRoute.name,
                      path: 'new_cars',
                      parent: CarShopRoute.name,
                    ),
                    _i37.RouteConfig(
                      UsedCarsRoute.name,
                      path: 'used_cars',
                      parent: CarShopRoute.name,
                    ),
                  ],
                ),
                _i37.RouteConfig(
                  ChildrenShopRoute.name,
                  path: 'children_shop',
                  parent: ShopRouter.name,
                  children: [
                    _i37.RouteConfig(
                      ChildrenFoodRoute.name,
                      path: 'children_food',
                      parent: ChildrenShopRoute.name,
                    ),
                    _i37.RouteConfig(
                      ChildrenItemsRoute.name,
                      path: 'children_items',
                      parent: ChildrenShopRoute.name,
                    ),
                  ],
                ),
                _i37.RouteConfig(
                  HouseShopRoute.name,
                  path: 'house_shop',
                  parent: ShopRouter.name,
                  children: [
                    _i37.RouteConfig(
                      RentalHousesRoute.name,
                      path: 'rental_houses',
                      parent: HouseShopRoute.name,
                    ),
                    _i37.RouteConfig(
                      PurchaseHousesRoute.name,
                      path: 'purchase_houses',
                      parent: HouseShopRoute.name,
                    ),
                  ],
                ),
                _i37.RouteConfig(
                  JewelryShopRoute.name,
                  path: 'jewelry_shop',
                  parent: ShopRouter.name,
                  children: [
                    _i37.RouteConfig(
                      NaturalJewelryRoute.name,
                      path: 'natural_jewelry',
                      parent: JewelryShopRoute.name,
                    ),
                    _i37.RouteConfig(
                      SyntheticJewelryRoute.name,
                      path: 'synthetic_jewelry',
                      parent: JewelryShopRoute.name,
                    ),
                  ],
                ),
                _i37.RouteConfig(
                  SuppliesShopRoute.name,
                  path: 'supplies',
                  parent: ShopRouter.name,
                ),
              ],
            ),
            _i37.RouteConfig(
              RelationshipRouter.name,
              path: 'relationship',
              parent: MainGameRoute.name,
              children: [
                _i37.RouteConfig(
                  RelationshipRoute.name,
                  path: '',
                  parent: RelationshipRouter.name,
                  children: [
                    _i37.RouteConfig(
                      ParentsRoute.name,
                      path: 'parents',
                      parent: RelationshipRoute.name,
                    ),
                    _i37.RouteConfig(
                      SiblingsRoute.name,
                      path: 'siblings',
                      parent: RelationshipRoute.name,
                    ),
                    _i37.RouteConfig(
                      PartnersRoute.name,
                      path: 'partners',
                      parent: RelationshipRoute.name,
                    ),
                    _i37.RouteConfig(
                      ChildrenRoute.name,
                      path: 'children',
                      parent: RelationshipRoute.name,
                    ),
                    _i37.RouteConfig(
                      RelativesRoute.name,
                      path: 'relatives',
                      parent: RelationshipRoute.name,
                    ),
                    _i37.RouteConfig(
                      InLawsRoute.name,
                      path: 'inlaws',
                      parent: RelationshipRoute.name,
                    ),
                    _i37.RouteConfig(
                      FriendsRoute.name,
                      path: 'friends',
                      parent: RelationshipRoute.name,
                    ),
                    _i37.RouteConfig(
                      ExesRoute.name,
                      path: 'exes',
                      parent: RelationshipRoute.name,
                    ),
                    _i37.RouteConfig(
                      GraveyardRoute.name,
                      path: 'graveyard',
                      parent: RelationshipRoute.name,
                    ),
                  ],
                )
              ],
            ),
            _i37.RouteConfig(
              ActivitiesRouter.name,
              path: 'activities',
              parent: MainGameRoute.name,
              children: [
                _i37.RouteConfig(
                  ActivitiesRoute.name,
                  path: '',
                  parent: ActivitiesRouter.name,
                )
              ],
            ),
          ],
        ),
        _i37.RouteConfig(
          GameManagerRoute.name,
          path: '/manager',
        ),
      ];
}

/// generated route for
/// [_i1.MainGameScreen]
class MainGameRoute extends _i37.PageRouteInfo<void> {
  const MainGameRoute({List<_i37.PageRouteInfo>? children})
      : super(
          MainGameRoute.name,
          path: '/maingame',
          initialChildren: children,
        );

  static const String name = 'MainGameRoute';
}

/// generated route for
/// [_i2.GameManagerScreen]
class GameManagerRoute extends _i37.PageRouteInfo<void> {
  const GameManagerRoute()
      : super(
          GameManagerRoute.name,
          path: '/manager',
        );

  static const String name = 'GameManagerRoute';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class PlayerRouter extends _i37.PageRouteInfo<void> {
  const PlayerRouter({List<_i37.PageRouteInfo>? children})
      : super(
          PlayerRouter.name,
          path: 'player',
          initialChildren: children,
        );

  static const String name = 'PlayerRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class WorkRouter extends _i37.PageRouteInfo<void> {
  const WorkRouter({List<_i37.PageRouteInfo>? children})
      : super(
          WorkRouter.name,
          path: 'work',
          initialChildren: children,
        );

  static const String name = 'WorkRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class ShopRouter extends _i37.PageRouteInfo<void> {
  const ShopRouter({List<_i37.PageRouteInfo>? children})
      : super(
          ShopRouter.name,
          path: 'shop',
          initialChildren: children,
        );

  static const String name = 'ShopRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class RelationshipRouter extends _i37.PageRouteInfo<void> {
  const RelationshipRouter({List<_i37.PageRouteInfo>? children})
      : super(
          RelationshipRouter.name,
          path: 'relationship',
          initialChildren: children,
        );

  static const String name = 'RelationshipRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class ActivitiesRouter extends _i37.PageRouteInfo<void> {
  const ActivitiesRouter({List<_i37.PageRouteInfo>? children})
      : super(
          ActivitiesRouter.name,
          path: 'activities',
          initialChildren: children,
        );

  static const String name = 'ActivitiesRouter';
}

/// generated route for
/// [_i4.PlayerScreen]
class PlayerRoute extends _i37.PageRouteInfo<void> {
  const PlayerRoute()
      : super(
          PlayerRoute.name,
          path: '',
        );

  static const String name = 'PlayerRoute';
}

/// generated route for
/// [_i5.WorkScreen]
class WorkRoute extends _i37.PageRouteInfo<void> {
  const WorkRoute()
      : super(
          WorkRoute.name,
          path: '',
        );

  static const String name = 'WorkRoute';
}

/// generated route for
/// [_i6.ShopScreen]
class ShopRoute extends _i37.PageRouteInfo<void> {
  const ShopRoute()
      : super(
          ShopRoute.name,
          path: '',
        );

  static const String name = 'ShopRoute';
}

/// generated route for
/// [_i7.DriftDbViewer]
class DriftDbViewer extends _i37.PageRouteInfo<DriftDbViewerArgs> {
  DriftDbViewer({required _i39.GeneratedDatabase db})
      : super(
          DriftDbViewer.name,
          path: 'database_viewer',
          args: DriftDbViewerArgs(db: db),
        );

  static const String name = 'DriftDbViewer';
}

class DriftDbViewerArgs {
  const DriftDbViewerArgs({required this.db});

  final _i39.GeneratedDatabase db;

  @override
  String toString() {
    return 'DriftDbViewerArgs{db: $db}';
  }
}

/// generated route for
/// [_i8.FoodShopScreen]
class FoodShopRoute extends _i37.PageRouteInfo<void> {
  const FoodShopRoute({List<_i37.PageRouteInfo>? children})
      : super(
          FoodShopRoute.name,
          path: 'food_shop',
          initialChildren: children,
        );

  static const String name = 'FoodShopRoute';
}

/// generated route for
/// [_i9.CarShopScreen]
class CarShopRoute extends _i37.PageRouteInfo<void> {
  const CarShopRoute({List<_i37.PageRouteInfo>? children})
      : super(
          CarShopRoute.name,
          path: 'car_shop',
          initialChildren: children,
        );

  static const String name = 'CarShopRoute';
}

/// generated route for
/// [_i10.ChildrenShopScreen]
class ChildrenShopRoute extends _i37.PageRouteInfo<void> {
  const ChildrenShopRoute({List<_i37.PageRouteInfo>? children})
      : super(
          ChildrenShopRoute.name,
          path: 'children_shop',
          initialChildren: children,
        );

  static const String name = 'ChildrenShopRoute';
}

/// generated route for
/// [_i11.HouseShopScreen]
class HouseShopRoute extends _i37.PageRouteInfo<void> {
  const HouseShopRoute({List<_i37.PageRouteInfo>? children})
      : super(
          HouseShopRoute.name,
          path: 'house_shop',
          initialChildren: children,
        );

  static const String name = 'HouseShopRoute';
}

/// generated route for
/// [_i12.JewelryShopScreen]
class JewelryShopRoute extends _i37.PageRouteInfo<void> {
  const JewelryShopRoute({List<_i37.PageRouteInfo>? children})
      : super(
          JewelryShopRoute.name,
          path: 'jewelry_shop',
          initialChildren: children,
        );

  static const String name = 'JewelryShopRoute';
}

/// generated route for
/// [_i13.SuppliesShopScreen]
class SuppliesShopRoute extends _i37.PageRouteInfo<void> {
  const SuppliesShopRoute()
      : super(
          SuppliesShopRoute.name,
          path: 'supplies',
        );

  static const String name = 'SuppliesShopRoute';
}

/// generated route for
/// [_i14.ReadyMealScreen]
class ReadyMealRoute extends _i37.PageRouteInfo<ReadyMealRouteArgs> {
  ReadyMealRoute({
    _i38.Key? key,
    required List<_i40.Food> readyMeals,
  }) : super(
          ReadyMealRoute.name,
          path: 'ready_meals',
          args: ReadyMealRouteArgs(
            key: key,
            readyMeals: readyMeals,
          ),
        );

  static const String name = 'ReadyMealRoute';
}

class ReadyMealRouteArgs {
  const ReadyMealRouteArgs({
    this.key,
    required this.readyMeals,
  });

  final _i38.Key? key;

  final List<_i40.Food> readyMeals;

  @override
  String toString() {
    return 'ReadyMealRouteArgs{key: $key, readyMeals: $readyMeals}';
  }
}

/// generated route for
/// [_i15.IngredientsScreen]
class IngredientsRoute extends _i37.PageRouteInfo<IngredientsRouteArgs> {
  IngredientsRoute({
    _i38.Key? key,
    required List<_i40.Food> ingredients,
  }) : super(
          IngredientsRoute.name,
          path: 'ingredients',
          args: IngredientsRouteArgs(
            key: key,
            ingredients: ingredients,
          ),
        );

  static const String name = 'IngredientsRoute';
}

class IngredientsRouteArgs {
  const IngredientsRouteArgs({
    this.key,
    required this.ingredients,
  });

  final _i38.Key? key;

  final List<_i40.Food> ingredients;

  @override
  String toString() {
    return 'IngredientsRouteArgs{key: $key, ingredients: $ingredients}';
  }
}

/// generated route for
/// [_i16.DrinksScreen]
class DrinksRoute extends _i37.PageRouteInfo<DrinksRouteArgs> {
  DrinksRoute({
    _i38.Key? key,
    required List<_i40.Food> drinks,
  }) : super(
          DrinksRoute.name,
          path: 'drinks',
          args: DrinksRouteArgs(
            key: key,
            drinks: drinks,
          ),
        );

  static const String name = 'DrinksRoute';
}

class DrinksRouteArgs {
  const DrinksRouteArgs({
    this.key,
    required this.drinks,
  });

  final _i38.Key? key;

  final List<_i40.Food> drinks;

  @override
  String toString() {
    return 'DrinksRouteArgs{key: $key, drinks: $drinks}';
  }
}

/// generated route for
/// [_i17.SweetsScreen]
class SweetsRoute extends _i37.PageRouteInfo<SweetsRouteArgs> {
  SweetsRoute({
    _i38.Key? key,
    required List<_i40.Food> sweets,
  }) : super(
          SweetsRoute.name,
          path: 'sweets',
          args: SweetsRouteArgs(
            key: key,
            sweets: sweets,
          ),
        );

  static const String name = 'SweetsRoute';
}

class SweetsRouteArgs {
  const SweetsRouteArgs({
    this.key,
    required this.sweets,
  });

  final _i38.Key? key;

  final List<_i40.Food> sweets;

  @override
  String toString() {
    return 'SweetsRouteArgs{key: $key, sweets: $sweets}';
  }
}

/// generated route for
/// [_i18.NewCarsScreen]
class NewCarsRoute extends _i37.PageRouteInfo<NewCarsRouteArgs> {
  NewCarsRoute({
    _i38.Key? key,
    required List<_i41.Car> newCars,
  }) : super(
          NewCarsRoute.name,
          path: 'new_cars',
          args: NewCarsRouteArgs(
            key: key,
            newCars: newCars,
          ),
        );

  static const String name = 'NewCarsRoute';
}

class NewCarsRouteArgs {
  const NewCarsRouteArgs({
    this.key,
    required this.newCars,
  });

  final _i38.Key? key;

  final List<_i41.Car> newCars;

  @override
  String toString() {
    return 'NewCarsRouteArgs{key: $key, newCars: $newCars}';
  }
}

/// generated route for
/// [_i19.UsedCarsScreen]
class UsedCarsRoute extends _i37.PageRouteInfo<UsedCarsRouteArgs> {
  UsedCarsRoute({
    _i38.Key? key,
    required List<_i41.Car> usedCars,
  }) : super(
          UsedCarsRoute.name,
          path: 'used_cars',
          args: UsedCarsRouteArgs(
            key: key,
            usedCars: usedCars,
          ),
        );

  static const String name = 'UsedCarsRoute';
}

class UsedCarsRouteArgs {
  const UsedCarsRouteArgs({
    this.key,
    required this.usedCars,
  });

  final _i38.Key? key;

  final List<_i41.Car> usedCars;

  @override
  String toString() {
    return 'UsedCarsRouteArgs{key: $key, usedCars: $usedCars}';
  }
}

/// generated route for
/// [_i20.ChildrenFoodScreen]
class ChildrenFoodRoute extends _i37.PageRouteInfo<ChildrenFoodRouteArgs> {
  ChildrenFoodRoute({
    _i38.Key? key,
    required List<_i40.Food> childrenFood,
  }) : super(
          ChildrenFoodRoute.name,
          path: 'children_food',
          args: ChildrenFoodRouteArgs(
            key: key,
            childrenFood: childrenFood,
          ),
        );

  static const String name = 'ChildrenFoodRoute';
}

class ChildrenFoodRouteArgs {
  const ChildrenFoodRouteArgs({
    this.key,
    required this.childrenFood,
  });

  final _i38.Key? key;

  final List<_i40.Food> childrenFood;

  @override
  String toString() {
    return 'ChildrenFoodRouteArgs{key: $key, childrenFood: $childrenFood}';
  }
}

/// generated route for
/// [_i21.ChildrenItemsScreen]
class ChildrenItemsRoute extends _i37.PageRouteInfo<ChildrenItemsRouteArgs> {
  ChildrenItemsRoute({
    _i38.Key? key,
    required List<_i42.Item> childrenItems,
  }) : super(
          ChildrenItemsRoute.name,
          path: 'children_items',
          args: ChildrenItemsRouteArgs(
            key: key,
            childrenItems: childrenItems,
          ),
        );

  static const String name = 'ChildrenItemsRoute';
}

class ChildrenItemsRouteArgs {
  const ChildrenItemsRouteArgs({
    this.key,
    required this.childrenItems,
  });

  final _i38.Key? key;

  final List<_i42.Item> childrenItems;

  @override
  String toString() {
    return 'ChildrenItemsRouteArgs{key: $key, childrenItems: $childrenItems}';
  }
}

/// generated route for
/// [_i22.RentalHousesScreen]
class RentalHousesRoute extends _i37.PageRouteInfo<RentalHousesRouteArgs> {
  RentalHousesRoute({
    _i38.Key? key,
    required List<_i43.House> rentalHouses,
  }) : super(
          RentalHousesRoute.name,
          path: 'rental_houses',
          args: RentalHousesRouteArgs(
            key: key,
            rentalHouses: rentalHouses,
          ),
        );

  static const String name = 'RentalHousesRoute';
}

class RentalHousesRouteArgs {
  const RentalHousesRouteArgs({
    this.key,
    required this.rentalHouses,
  });

  final _i38.Key? key;

  final List<_i43.House> rentalHouses;

  @override
  String toString() {
    return 'RentalHousesRouteArgs{key: $key, rentalHouses: $rentalHouses}';
  }
}

/// generated route for
/// [_i23.PurchaseHousesScreen]
class PurchaseHousesRoute extends _i37.PageRouteInfo<PurchaseHousesRouteArgs> {
  PurchaseHousesRoute({
    _i38.Key? key,
    required List<_i43.House> purchaseHouses,
  }) : super(
          PurchaseHousesRoute.name,
          path: 'purchase_houses',
          args: PurchaseHousesRouteArgs(
            key: key,
            purchaseHouses: purchaseHouses,
          ),
        );

  static const String name = 'PurchaseHousesRoute';
}

class PurchaseHousesRouteArgs {
  const PurchaseHousesRouteArgs({
    this.key,
    required this.purchaseHouses,
  });

  final _i38.Key? key;

  final List<_i43.House> purchaseHouses;

  @override
  String toString() {
    return 'PurchaseHousesRouteArgs{key: $key, purchaseHouses: $purchaseHouses}';
  }
}

/// generated route for
/// [_i24.NaturalJewelryScreen]
class NaturalJewelryRoute extends _i37.PageRouteInfo<NaturalJewelryRouteArgs> {
  NaturalJewelryRoute({
    _i38.Key? key,
    required List<_i44.Jewelry> naturalJewelries,
  }) : super(
          NaturalJewelryRoute.name,
          path: 'natural_jewelry',
          args: NaturalJewelryRouteArgs(
            key: key,
            naturalJewelries: naturalJewelries,
          ),
        );

  static const String name = 'NaturalJewelryRoute';
}

class NaturalJewelryRouteArgs {
  const NaturalJewelryRouteArgs({
    this.key,
    required this.naturalJewelries,
  });

  final _i38.Key? key;

  final List<_i44.Jewelry> naturalJewelries;

  @override
  String toString() {
    return 'NaturalJewelryRouteArgs{key: $key, naturalJewelries: $naturalJewelries}';
  }
}

/// generated route for
/// [_i25.SyntheticJewelryScreen]
class SyntheticJewelryRoute
    extends _i37.PageRouteInfo<SyntheticJewelryRouteArgs> {
  SyntheticJewelryRoute({
    _i38.Key? key,
    required List<_i44.Jewelry> syntheticJewelries,
  }) : super(
          SyntheticJewelryRoute.name,
          path: 'synthetic_jewelry',
          args: SyntheticJewelryRouteArgs(
            key: key,
            syntheticJewelries: syntheticJewelries,
          ),
        );

  static const String name = 'SyntheticJewelryRoute';
}

class SyntheticJewelryRouteArgs {
  const SyntheticJewelryRouteArgs({
    this.key,
    required this.syntheticJewelries,
  });

  final _i38.Key? key;

  final List<_i44.Jewelry> syntheticJewelries;

  @override
  String toString() {
    return 'SyntheticJewelryRouteArgs{key: $key, syntheticJewelries: $syntheticJewelries}';
  }
}

/// generated route for
/// [_i26.RelationshipScreen]
class RelationshipRoute extends _i37.PageRouteInfo<void> {
  const RelationshipRoute({List<_i37.PageRouteInfo>? children})
      : super(
          RelationshipRoute.name,
          path: '',
          initialChildren: children,
        );

  static const String name = 'RelationshipRoute';
}

/// generated route for
/// [_i27.ParentsScreen]
class ParentsRoute extends _i37.PageRouteInfo<ParentsRouteArgs> {
  ParentsRoute({
    _i38.Key? key,
    required List<_i45.RelationshipPair<_i46.Parent, _i47.Person>> parents,
  }) : super(
          ParentsRoute.name,
          path: 'parents',
          args: ParentsRouteArgs(
            key: key,
            parents: parents,
          ),
        );

  static const String name = 'ParentsRoute';
}

class ParentsRouteArgs {
  const ParentsRouteArgs({
    this.key,
    required this.parents,
  });

  final _i38.Key? key;

  final List<_i45.RelationshipPair<_i46.Parent, _i47.Person>> parents;

  @override
  String toString() {
    return 'ParentsRouteArgs{key: $key, parents: $parents}';
  }
}

/// generated route for
/// [_i28.SiblingsScreen]
class SiblingsRoute extends _i37.PageRouteInfo<SiblingsRouteArgs> {
  SiblingsRoute({
    _i38.Key? key,
    required List<_i45.RelationshipPair<_i48.Sibling, _i47.Person>> siblings,
  }) : super(
          SiblingsRoute.name,
          path: 'siblings',
          args: SiblingsRouteArgs(
            key: key,
            siblings: siblings,
          ),
        );

  static const String name = 'SiblingsRoute';
}

class SiblingsRouteArgs {
  const SiblingsRouteArgs({
    this.key,
    required this.siblings,
  });

  final _i38.Key? key;

  final List<_i45.RelationshipPair<_i48.Sibling, _i47.Person>> siblings;

  @override
  String toString() {
    return 'SiblingsRouteArgs{key: $key, siblings: $siblings}';
  }
}

/// generated route for
/// [_i29.PartnersScreen]
class PartnersRoute extends _i37.PageRouteInfo<PartnersRouteArgs> {
  PartnersRoute({
    _i38.Key? key,
    required List<_i45.RelationshipPair<_i49.Partner, _i47.Person>> partners,
  }) : super(
          PartnersRoute.name,
          path: 'partners',
          args: PartnersRouteArgs(
            key: key,
            partners: partners,
          ),
        );

  static const String name = 'PartnersRoute';
}

class PartnersRouteArgs {
  const PartnersRouteArgs({
    this.key,
    required this.partners,
  });

  final _i38.Key? key;

  final List<_i45.RelationshipPair<_i49.Partner, _i47.Person>> partners;

  @override
  String toString() {
    return 'PartnersRouteArgs{key: $key, partners: $partners}';
  }
}

/// generated route for
/// [_i30.ChildrenScreen]
class ChildrenRoute extends _i37.PageRouteInfo<ChildrenRouteArgs> {
  ChildrenRoute({
    _i38.Key? key,
    required List<_i45.RelationshipPair<_i50.Child, _i47.Person>> childrenList,
  }) : super(
          ChildrenRoute.name,
          path: 'children',
          args: ChildrenRouteArgs(
            key: key,
            childrenList: childrenList,
          ),
        );

  static const String name = 'ChildrenRoute';
}

class ChildrenRouteArgs {
  const ChildrenRouteArgs({
    this.key,
    required this.childrenList,
  });

  final _i38.Key? key;

  final List<_i45.RelationshipPair<_i50.Child, _i47.Person>> childrenList;

  @override
  String toString() {
    return 'ChildrenRouteArgs{key: $key, childrenList: $childrenList}';
  }
}

/// generated route for
/// [_i31.RelativesScreen]
class RelativesRoute extends _i37.PageRouteInfo<RelativesRouteArgs> {
  RelativesRoute({
    _i38.Key? key,
    required List<_i45.RelationshipPair<_i51.Relative, _i47.Person>> relatives,
  }) : super(
          RelativesRoute.name,
          path: 'relatives',
          args: RelativesRouteArgs(
            key: key,
            relatives: relatives,
          ),
        );

  static const String name = 'RelativesRoute';
}

class RelativesRouteArgs {
  const RelativesRouteArgs({
    this.key,
    required this.relatives,
  });

  final _i38.Key? key;

  final List<_i45.RelationshipPair<_i51.Relative, _i47.Person>> relatives;

  @override
  String toString() {
    return 'RelativesRouteArgs{key: $key, relatives: $relatives}';
  }
}

/// generated route for
/// [_i32.InLawsScreen]
class InLawsRoute extends _i37.PageRouteInfo<InLawsRouteArgs> {
  InLawsRoute({
    _i38.Key? key,
    required List<_i45.RelationshipPair<_i52.InLaw, _i47.Person>> inLaws,
  }) : super(
          InLawsRoute.name,
          path: 'inlaws',
          args: InLawsRouteArgs(
            key: key,
            inLaws: inLaws,
          ),
        );

  static const String name = 'InLawsRoute';
}

class InLawsRouteArgs {
  const InLawsRouteArgs({
    this.key,
    required this.inLaws,
  });

  final _i38.Key? key;

  final List<_i45.RelationshipPair<_i52.InLaw, _i47.Person>> inLaws;

  @override
  String toString() {
    return 'InLawsRouteArgs{key: $key, inLaws: $inLaws}';
  }
}

/// generated route for
/// [_i33.FriendsScreen]
class FriendsRoute extends _i37.PageRouteInfo<FriendsRouteArgs> {
  FriendsRoute({
    _i38.Key? key,
    required List<_i45.RelationshipPair<_i53.Friend, _i47.Person>> friends,
  }) : super(
          FriendsRoute.name,
          path: 'friends',
          args: FriendsRouteArgs(
            key: key,
            friends: friends,
          ),
        );

  static const String name = 'FriendsRoute';
}

class FriendsRouteArgs {
  const FriendsRouteArgs({
    this.key,
    required this.friends,
  });

  final _i38.Key? key;

  final List<_i45.RelationshipPair<_i53.Friend, _i47.Person>> friends;

  @override
  String toString() {
    return 'FriendsRouteArgs{key: $key, friends: $friends}';
  }
}

/// generated route for
/// [_i34.ExesScreen]
class ExesRoute extends _i37.PageRouteInfo<ExesRouteArgs> {
  ExesRoute({
    _i38.Key? key,
    required List<_i45.RelationshipPair<_i49.Partner, _i47.Person>> exes,
  }) : super(
          ExesRoute.name,
          path: 'exes',
          args: ExesRouteArgs(
            key: key,
            exes: exes,
          ),
        );

  static const String name = 'ExesRoute';
}

class ExesRouteArgs {
  const ExesRouteArgs({
    this.key,
    required this.exes,
  });

  final _i38.Key? key;

  final List<_i45.RelationshipPair<_i49.Partner, _i47.Person>> exes;

  @override
  String toString() {
    return 'ExesRouteArgs{key: $key, exes: $exes}';
  }
}

/// generated route for
/// [_i35.GraveyardScreen]
class GraveyardRoute extends _i37.PageRouteInfo<GraveyardRouteArgs> {
  GraveyardRoute({
    _i38.Key? key,
    required List<_i54.Graveyard> graveyards,
  }) : super(
          GraveyardRoute.name,
          path: 'graveyard',
          args: GraveyardRouteArgs(
            key: key,
            graveyards: graveyards,
          ),
        );

  static const String name = 'GraveyardRoute';
}

class GraveyardRouteArgs {
  const GraveyardRouteArgs({
    this.key,
    required this.graveyards,
  });

  final _i38.Key? key;

  final List<_i54.Graveyard> graveyards;

  @override
  String toString() {
    return 'GraveyardRouteArgs{key: $key, graveyards: $graveyards}';
  }
}

/// generated route for
/// [_i36.ActivitiesScreen]
class ActivitiesRoute extends _i37.PageRouteInfo<void> {
  const ActivitiesRoute()
      : super(
          ActivitiesRoute.name,
          path: '',
        );

  static const String name = 'ActivitiesRoute';
}
