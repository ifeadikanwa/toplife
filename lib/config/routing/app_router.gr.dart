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
import 'package:auto_route/auto_route.dart' as _i38;
import 'package:auto_route/empty_router_widgets.dart' as _i3;
import 'package:drift/drift.dart' as _i40;
import 'package:drift_db_viewer/drift_db_viewer.dart' as _i7;
import 'package:flutter/material.dart' as _i39;

import '../../core/data_source/drift_database/database_provider.dart' as _i42;
import '../../game_manager/presentation/game_manager_screen.dart' as _i2;
import '../../main_game/presentation/main_game_screen.dart' as _i1;
import '../../main_game/presentation/top_level_screens/activities/widgets/activities_screen.dart'
    as _i37;
import '../../main_game/presentation/top_level_screens/player/widgets/player_screen.dart'
    as _i4;
import '../../main_game/presentation/top_level_screens/relationship/widgets/relationship_actions/relationship_actions_screen.dart'
    as _i27;
import '../../main_game/presentation/top_level_screens/relationship/widgets/relationship_screen.dart'
    as _i26;
import '../../main_game/presentation/top_level_screens/relationship/widgets/sub_screens/children_screen/children_screen.dart'
    as _i31;
import '../../main_game/presentation/top_level_screens/relationship/widgets/sub_screens/exes_screen/exes_screen.dart'
    as _i35;
import '../../main_game/presentation/top_level_screens/relationship/widgets/sub_screens/friends_screen/friends_screen.dart'
    as _i34;
import '../../main_game/presentation/top_level_screens/relationship/widgets/sub_screens/graves_screen/graves_screen.dart'
    as _i36;
import '../../main_game/presentation/top_level_screens/relationship/widgets/sub_screens/inlaws_screen/inlaws_screen.dart'
    as _i33;
import '../../main_game/presentation/top_level_screens/relationship/widgets/sub_screens/parents_screen/parents_screen.dart'
    as _i28;
import '../../main_game/presentation/top_level_screens/relationship/widgets/sub_screens/partners_screen/partners_screen.dart'
    as _i30;
import '../../main_game/presentation/top_level_screens/relationship/widgets/sub_screens/relatives_screen/relatives_screen.dart'
    as _i32;
import '../../main_game/presentation/top_level_screens/relationship/widgets/sub_screens/siblings_screen/siblings_screen.dart'
    as _i29;
import '../../main_game/presentation/top_level_screens/shop/widgets/shop_screen.dart'
    as _i6;
import '../../main_game/presentation/top_level_screens/shop/widgets/sub_screens/car/car_shop_screen.dart'
    as _i9;
import '../../main_game/presentation/top_level_screens/shop/widgets/sub_screens/car/tab_screens/new_cars_screen/new_cars_screen.dart'
    as _i18;
import '../../main_game/presentation/top_level_screens/shop/widgets/sub_screens/car/tab_screens/used_cars_screen/used_cars_screen.dart'
    as _i19;
import '../../main_game/presentation/top_level_screens/shop/widgets/sub_screens/children/children_shop_screen.dart'
    as _i10;
import '../../main_game/presentation/top_level_screens/shop/widgets/sub_screens/children/tab_screens/chidren_items_screen/children_items_screen.dart'
    as _i21;
import '../../main_game/presentation/top_level_screens/shop/widgets/sub_screens/children/tab_screens/children_food_screen/children_food_screen.dart'
    as _i20;
import '../../main_game/presentation/top_level_screens/shop/widgets/sub_screens/food/food_shop_screen.dart'
    as _i8;
import '../../main_game/presentation/top_level_screens/shop/widgets/sub_screens/food/tab_screens/drinks_screen/drinks_screen.dart'
    as _i16;
import '../../main_game/presentation/top_level_screens/shop/widgets/sub_screens/food/tab_screens/ingredients_screen/ingredients_screen.dart'
    as _i15;
import '../../main_game/presentation/top_level_screens/shop/widgets/sub_screens/food/tab_screens/ready_meals_screen/ready_meals_screen.dart'
    as _i14;
import '../../main_game/presentation/top_level_screens/shop/widgets/sub_screens/food/tab_screens/sweets_screen/sweets_screen.dart'
    as _i17;
import '../../main_game/presentation/top_level_screens/shop/widgets/sub_screens/house/house_shop_screen.dart'
    as _i11;
import '../../main_game/presentation/top_level_screens/shop/widgets/sub_screens/house/tab_screens/purchase_houses_screen/purchase_houses_screen.dart'
    as _i23;
import '../../main_game/presentation/top_level_screens/shop/widgets/sub_screens/house/tab_screens/rental_houses_screen/rental_houses_screen.dart'
    as _i22;
import '../../main_game/presentation/top_level_screens/shop/widgets/sub_screens/jewelry/jewelry_shop_screen.dart'
    as _i12;
import '../../main_game/presentation/top_level_screens/shop/widgets/sub_screens/jewelry/tab_screens/natural_jewelry_screen/natural_jewelry_screen.dart'
    as _i24;
import '../../main_game/presentation/top_level_screens/shop/widgets/sub_screens/jewelry/tab_screens/synthetic_jewelry_screen/synthetic_jewelry_screen.dart'
    as _i25;
import '../../main_game/presentation/top_level_screens/shop/widgets/sub_screens/supplies/supplies_shop_screen.dart'
    as _i13;
import '../../main_game/presentation/top_level_screens/work/widgets/work_screen.dart'
    as _i5;
import '../../main_systems/system_relationship/domain/model/info_models/relationship_pair.dart'
    as _i41;

class AppRouter extends _i38.RootStackRouter {
  AppRouter([_i39.GlobalKey<_i39.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i38.PageFactory> pagesMap = {
    MainGameRoute.name: (routeData) {
      return _i38.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MainGameScreen(),
      );
    },
    GameManagerRoute.name: (routeData) {
      return _i38.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.GameManagerScreen(),
      );
    },
    PlayerRouter.name: (routeData) {
      return _i38.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
      );
    },
    WorkRouter.name: (routeData) {
      return _i38.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
      );
    },
    ShopRouter.name: (routeData) {
      return _i38.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
      );
    },
    RelationshipRouter.name: (routeData) {
      return _i38.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
      );
    },
    ActivitiesRouter.name: (routeData) {
      return _i38.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
      );
    },
    PlayerRoute.name: (routeData) {
      return _i38.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.PlayerScreen(),
      );
    },
    WorkRoute.name: (routeData) {
      return _i38.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.WorkScreen(),
      );
    },
    ShopRoute.name: (routeData) {
      return _i38.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.ShopScreen(),
      );
    },
    DriftDbViewer.name: (routeData) {
      final args = routeData.argsAs<DriftDbViewerArgs>();
      return _i38.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.DriftDbViewer(args.db),
      );
    },
    FoodShopRoute.name: (routeData) {
      return _i38.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i8.FoodShopScreen(),
        transitionsBuilder: _i38.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CarShopRoute.name: (routeData) {
      return _i38.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i9.CarShopScreen(),
        transitionsBuilder: _i38.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ChildrenShopRoute.name: (routeData) {
      return _i38.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i10.ChildrenShopScreen(),
        transitionsBuilder: _i38.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HouseShopRoute.name: (routeData) {
      return _i38.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i11.HouseShopScreen(),
        transitionsBuilder: _i38.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false,
      );
    },
    JewelryShopRoute.name: (routeData) {
      return _i38.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i12.JewelryShopScreen(),
        transitionsBuilder: _i38.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SuppliesShopRoute.name: (routeData) {
      return _i38.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i13.SuppliesShopScreen(),
        transitionsBuilder: _i38.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ReadyMealRoute.name: (routeData) {
      return _i38.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.ReadyMealScreen(),
      );
    },
    IngredientsRoute.name: (routeData) {
      return _i38.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i15.IngredientsScreen(),
      );
    },
    DrinksRoute.name: (routeData) {
      return _i38.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i16.DrinksScreen(),
      );
    },
    SweetsRoute.name: (routeData) {
      return _i38.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i17.SweetsScreen(),
      );
    },
    NewCarsRoute.name: (routeData) {
      return _i38.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i18.NewCarsScreen(),
      );
    },
    UsedCarsRoute.name: (routeData) {
      return _i38.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i19.UsedCarsScreen(),
      );
    },
    ChildrenFoodRoute.name: (routeData) {
      return _i38.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i20.ChildrenFoodScreen(),
      );
    },
    ChildrenItemsRoute.name: (routeData) {
      return _i38.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i21.ChildrenItemsScreen(),
      );
    },
    RentalHousesRoute.name: (routeData) {
      return _i38.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i22.RentalHousesScreen(),
      );
    },
    PurchaseHousesRoute.name: (routeData) {
      return _i38.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i23.PurchaseHousesScreen(),
      );
    },
    NaturalJewelryRoute.name: (routeData) {
      return _i38.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i24.NaturalJewelryScreen(),
      );
    },
    SyntheticJewelryRoute.name: (routeData) {
      return _i38.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i25.SyntheticJewelryScreen(),
      );
    },
    RelationshipRoute.name: (routeData) {
      return _i38.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i26.RelationshipScreen(),
      );
    },
    RelationshipActionsRoute.name: (routeData) {
      final args = routeData.argsAs<RelationshipActionsRouteArgs>();
      return _i38.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i27.RelationshipActionsScreen(
          key: args.key,
          relationshipLabel: args.relationshipLabel,
          relationshipPair: args.relationshipPair,
          player: args.player,
          relationship: args.relationship,
          livingTogether: args.livingTogether,
        ),
      );
    },
    ParentsRoute.name: (routeData) {
      return _i38.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i28.ParentsScreen(),
      );
    },
    SiblingsRoute.name: (routeData) {
      return _i38.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i29.SiblingsScreen(),
      );
    },
    PartnersRoute.name: (routeData) {
      return _i38.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i30.PartnersScreen(),
      );
    },
    ChildrenRoute.name: (routeData) {
      return _i38.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i31.ChildrenScreen(),
      );
    },
    RelativesRoute.name: (routeData) {
      return _i38.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i32.RelativesScreen(),
      );
    },
    InLawsRoute.name: (routeData) {
      return _i38.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i33.InLawsScreen(),
      );
    },
    FriendsRoute.name: (routeData) {
      return _i38.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i34.FriendsScreen(),
      );
    },
    ExesRoute.name: (routeData) {
      return _i38.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i35.ExesScreen(),
      );
    },
    GravesRoute.name: (routeData) {
      return _i38.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i36.GravesScreen(),
      );
    },
    ActivitiesRoute.name: (routeData) {
      return _i38.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i37.ActivitiesScreen(),
      );
    },
  };

  @override
  List<_i38.RouteConfig> get routes => [
        _i38.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/maingame',
          fullMatch: true,
        ),
        _i38.RouteConfig(
          MainGameRoute.name,
          path: '/maingame',
          children: [
            _i38.RouteConfig(
              PlayerRouter.name,
              path: 'player',
              parent: MainGameRoute.name,
              children: [
                _i38.RouteConfig(
                  PlayerRoute.name,
                  path: '',
                  parent: PlayerRouter.name,
                )
              ],
            ),
            _i38.RouteConfig(
              WorkRouter.name,
              path: 'work',
              parent: MainGameRoute.name,
              children: [
                _i38.RouteConfig(
                  WorkRoute.name,
                  path: '',
                  parent: WorkRouter.name,
                )
              ],
            ),
            _i38.RouteConfig(
              ShopRouter.name,
              path: 'shop',
              parent: MainGameRoute.name,
              children: [
                _i38.RouteConfig(
                  ShopRoute.name,
                  path: '',
                  parent: ShopRouter.name,
                ),
                _i38.RouteConfig(
                  DriftDbViewer.name,
                  path: 'database_viewer',
                  parent: ShopRouter.name,
                ),
                _i38.RouteConfig(
                  FoodShopRoute.name,
                  path: 'food_shop',
                  parent: ShopRouter.name,
                  children: [
                    _i38.RouteConfig(
                      ReadyMealRoute.name,
                      path: 'ready_meals',
                      parent: FoodShopRoute.name,
                    ),
                    _i38.RouteConfig(
                      IngredientsRoute.name,
                      path: 'ingredients',
                      parent: FoodShopRoute.name,
                    ),
                    _i38.RouteConfig(
                      DrinksRoute.name,
                      path: 'drinks',
                      parent: FoodShopRoute.name,
                    ),
                    _i38.RouteConfig(
                      SweetsRoute.name,
                      path: 'sweets',
                      parent: FoodShopRoute.name,
                    ),
                  ],
                ),
                _i38.RouteConfig(
                  CarShopRoute.name,
                  path: 'car_shop',
                  parent: ShopRouter.name,
                  children: [
                    _i38.RouteConfig(
                      NewCarsRoute.name,
                      path: 'new_cars',
                      parent: CarShopRoute.name,
                    ),
                    _i38.RouteConfig(
                      UsedCarsRoute.name,
                      path: 'used_cars',
                      parent: CarShopRoute.name,
                    ),
                  ],
                ),
                _i38.RouteConfig(
                  ChildrenShopRoute.name,
                  path: 'children_shop',
                  parent: ShopRouter.name,
                  children: [
                    _i38.RouteConfig(
                      ChildrenFoodRoute.name,
                      path: 'children_food',
                      parent: ChildrenShopRoute.name,
                    ),
                    _i38.RouteConfig(
                      ChildrenItemsRoute.name,
                      path: 'children_items',
                      parent: ChildrenShopRoute.name,
                    ),
                  ],
                ),
                _i38.RouteConfig(
                  HouseShopRoute.name,
                  path: 'house_shop',
                  parent: ShopRouter.name,
                  children: [
                    _i38.RouteConfig(
                      RentalHousesRoute.name,
                      path: 'rental_houses',
                      parent: HouseShopRoute.name,
                    ),
                    _i38.RouteConfig(
                      PurchaseHousesRoute.name,
                      path: 'purchase_houses',
                      parent: HouseShopRoute.name,
                    ),
                  ],
                ),
                _i38.RouteConfig(
                  JewelryShopRoute.name,
                  path: 'jewelry_shop',
                  parent: ShopRouter.name,
                  children: [
                    _i38.RouteConfig(
                      NaturalJewelryRoute.name,
                      path: 'natural_jewelry',
                      parent: JewelryShopRoute.name,
                    ),
                    _i38.RouteConfig(
                      SyntheticJewelryRoute.name,
                      path: 'synthetic_jewelry',
                      parent: JewelryShopRoute.name,
                    ),
                  ],
                ),
                _i38.RouteConfig(
                  SuppliesShopRoute.name,
                  path: 'supplies',
                  parent: ShopRouter.name,
                ),
              ],
            ),
            _i38.RouteConfig(
              RelationshipRouter.name,
              path: 'relationship',
              parent: MainGameRoute.name,
              children: [
                _i38.RouteConfig(
                  RelationshipRoute.name,
                  path: '',
                  parent: RelationshipRouter.name,
                  children: [
                    _i38.RouteConfig(
                      ParentsRoute.name,
                      path: 'parents',
                      parent: RelationshipRoute.name,
                    ),
                    _i38.RouteConfig(
                      SiblingsRoute.name,
                      path: 'siblings',
                      parent: RelationshipRoute.name,
                    ),
                    _i38.RouteConfig(
                      PartnersRoute.name,
                      path: 'partners',
                      parent: RelationshipRoute.name,
                    ),
                    _i38.RouteConfig(
                      ChildrenRoute.name,
                      path: 'children',
                      parent: RelationshipRoute.name,
                    ),
                    _i38.RouteConfig(
                      RelativesRoute.name,
                      path: 'relatives',
                      parent: RelationshipRoute.name,
                    ),
                    _i38.RouteConfig(
                      InLawsRoute.name,
                      path: 'inlaws',
                      parent: RelationshipRoute.name,
                    ),
                    _i38.RouteConfig(
                      FriendsRoute.name,
                      path: 'friends',
                      parent: RelationshipRoute.name,
                    ),
                    _i38.RouteConfig(
                      ExesRoute.name,
                      path: 'exes',
                      parent: RelationshipRoute.name,
                    ),
                    _i38.RouteConfig(
                      GravesRoute.name,
                      path: 'grave',
                      parent: RelationshipRoute.name,
                    ),
                  ],
                ),
                _i38.RouteConfig(
                  RelationshipActionsRoute.name,
                  path: 'relationship_actions',
                  parent: RelationshipRouter.name,
                ),
              ],
            ),
            _i38.RouteConfig(
              ActivitiesRouter.name,
              path: 'activities',
              parent: MainGameRoute.name,
              children: [
                _i38.RouteConfig(
                  ActivitiesRoute.name,
                  path: '',
                  parent: ActivitiesRouter.name,
                )
              ],
            ),
          ],
        ),
        _i38.RouteConfig(
          GameManagerRoute.name,
          path: '/manager',
        ),
      ];
}

/// generated route for
/// [_i1.MainGameScreen]
class MainGameRoute extends _i38.PageRouteInfo<void> {
  const MainGameRoute({List<_i38.PageRouteInfo>? children})
      : super(
          MainGameRoute.name,
          path: '/maingame',
          initialChildren: children,
        );

  static const String name = 'MainGameRoute';
}

/// generated route for
/// [_i2.GameManagerScreen]
class GameManagerRoute extends _i38.PageRouteInfo<void> {
  const GameManagerRoute()
      : super(
          GameManagerRoute.name,
          path: '/manager',
        );

  static const String name = 'GameManagerRoute';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class PlayerRouter extends _i38.PageRouteInfo<void> {
  const PlayerRouter({List<_i38.PageRouteInfo>? children})
      : super(
          PlayerRouter.name,
          path: 'player',
          initialChildren: children,
        );

  static const String name = 'PlayerRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class WorkRouter extends _i38.PageRouteInfo<void> {
  const WorkRouter({List<_i38.PageRouteInfo>? children})
      : super(
          WorkRouter.name,
          path: 'work',
          initialChildren: children,
        );

  static const String name = 'WorkRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class ShopRouter extends _i38.PageRouteInfo<void> {
  const ShopRouter({List<_i38.PageRouteInfo>? children})
      : super(
          ShopRouter.name,
          path: 'shop',
          initialChildren: children,
        );

  static const String name = 'ShopRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class RelationshipRouter extends _i38.PageRouteInfo<void> {
  const RelationshipRouter({List<_i38.PageRouteInfo>? children})
      : super(
          RelationshipRouter.name,
          path: 'relationship',
          initialChildren: children,
        );

  static const String name = 'RelationshipRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class ActivitiesRouter extends _i38.PageRouteInfo<void> {
  const ActivitiesRouter({List<_i38.PageRouteInfo>? children})
      : super(
          ActivitiesRouter.name,
          path: 'activities',
          initialChildren: children,
        );

  static const String name = 'ActivitiesRouter';
}

/// generated route for
/// [_i4.PlayerScreen]
class PlayerRoute extends _i38.PageRouteInfo<void> {
  const PlayerRoute()
      : super(
          PlayerRoute.name,
          path: '',
        );

  static const String name = 'PlayerRoute';
}

/// generated route for
/// [_i5.WorkScreen]
class WorkRoute extends _i38.PageRouteInfo<void> {
  const WorkRoute()
      : super(
          WorkRoute.name,
          path: '',
        );

  static const String name = 'WorkRoute';
}

/// generated route for
/// [_i6.ShopScreen]
class ShopRoute extends _i38.PageRouteInfo<void> {
  const ShopRoute()
      : super(
          ShopRoute.name,
          path: '',
        );

  static const String name = 'ShopRoute';
}

/// generated route for
/// [_i7.DriftDbViewer]
class DriftDbViewer extends _i38.PageRouteInfo<DriftDbViewerArgs> {
  DriftDbViewer({required _i40.GeneratedDatabase db})
      : super(
          DriftDbViewer.name,
          path: 'database_viewer',
          args: DriftDbViewerArgs(db: db),
        );

  static const String name = 'DriftDbViewer';
}

class DriftDbViewerArgs {
  const DriftDbViewerArgs({required this.db});

  final _i40.GeneratedDatabase db;

  @override
  String toString() {
    return 'DriftDbViewerArgs{db: $db}';
  }
}

/// generated route for
/// [_i8.FoodShopScreen]
class FoodShopRoute extends _i38.PageRouteInfo<void> {
  const FoodShopRoute({List<_i38.PageRouteInfo>? children})
      : super(
          FoodShopRoute.name,
          path: 'food_shop',
          initialChildren: children,
        );

  static const String name = 'FoodShopRoute';
}

/// generated route for
/// [_i9.CarShopScreen]
class CarShopRoute extends _i38.PageRouteInfo<void> {
  const CarShopRoute({List<_i38.PageRouteInfo>? children})
      : super(
          CarShopRoute.name,
          path: 'car_shop',
          initialChildren: children,
        );

  static const String name = 'CarShopRoute';
}

/// generated route for
/// [_i10.ChildrenShopScreen]
class ChildrenShopRoute extends _i38.PageRouteInfo<void> {
  const ChildrenShopRoute({List<_i38.PageRouteInfo>? children})
      : super(
          ChildrenShopRoute.name,
          path: 'children_shop',
          initialChildren: children,
        );

  static const String name = 'ChildrenShopRoute';
}

/// generated route for
/// [_i11.HouseShopScreen]
class HouseShopRoute extends _i38.PageRouteInfo<void> {
  const HouseShopRoute({List<_i38.PageRouteInfo>? children})
      : super(
          HouseShopRoute.name,
          path: 'house_shop',
          initialChildren: children,
        );

  static const String name = 'HouseShopRoute';
}

/// generated route for
/// [_i12.JewelryShopScreen]
class JewelryShopRoute extends _i38.PageRouteInfo<void> {
  const JewelryShopRoute({List<_i38.PageRouteInfo>? children})
      : super(
          JewelryShopRoute.name,
          path: 'jewelry_shop',
          initialChildren: children,
        );

  static const String name = 'JewelryShopRoute';
}

/// generated route for
/// [_i13.SuppliesShopScreen]
class SuppliesShopRoute extends _i38.PageRouteInfo<void> {
  const SuppliesShopRoute()
      : super(
          SuppliesShopRoute.name,
          path: 'supplies',
        );

  static const String name = 'SuppliesShopRoute';
}

/// generated route for
/// [_i14.ReadyMealScreen]
class ReadyMealRoute extends _i38.PageRouteInfo<void> {
  const ReadyMealRoute()
      : super(
          ReadyMealRoute.name,
          path: 'ready_meals',
        );

  static const String name = 'ReadyMealRoute';
}

/// generated route for
/// [_i15.IngredientsScreen]
class IngredientsRoute extends _i38.PageRouteInfo<void> {
  const IngredientsRoute()
      : super(
          IngredientsRoute.name,
          path: 'ingredients',
        );

  static const String name = 'IngredientsRoute';
}

/// generated route for
/// [_i16.DrinksScreen]
class DrinksRoute extends _i38.PageRouteInfo<void> {
  const DrinksRoute()
      : super(
          DrinksRoute.name,
          path: 'drinks',
        );

  static const String name = 'DrinksRoute';
}

/// generated route for
/// [_i17.SweetsScreen]
class SweetsRoute extends _i38.PageRouteInfo<void> {
  const SweetsRoute()
      : super(
          SweetsRoute.name,
          path: 'sweets',
        );

  static const String name = 'SweetsRoute';
}

/// generated route for
/// [_i18.NewCarsScreen]
class NewCarsRoute extends _i38.PageRouteInfo<void> {
  const NewCarsRoute()
      : super(
          NewCarsRoute.name,
          path: 'new_cars',
        );

  static const String name = 'NewCarsRoute';
}

/// generated route for
/// [_i19.UsedCarsScreen]
class UsedCarsRoute extends _i38.PageRouteInfo<void> {
  const UsedCarsRoute()
      : super(
          UsedCarsRoute.name,
          path: 'used_cars',
        );

  static const String name = 'UsedCarsRoute';
}

/// generated route for
/// [_i20.ChildrenFoodScreen]
class ChildrenFoodRoute extends _i38.PageRouteInfo<void> {
  const ChildrenFoodRoute()
      : super(
          ChildrenFoodRoute.name,
          path: 'children_food',
        );

  static const String name = 'ChildrenFoodRoute';
}

/// generated route for
/// [_i21.ChildrenItemsScreen]
class ChildrenItemsRoute extends _i38.PageRouteInfo<void> {
  const ChildrenItemsRoute()
      : super(
          ChildrenItemsRoute.name,
          path: 'children_items',
        );

  static const String name = 'ChildrenItemsRoute';
}

/// generated route for
/// [_i22.RentalHousesScreen]
class RentalHousesRoute extends _i38.PageRouteInfo<void> {
  const RentalHousesRoute()
      : super(
          RentalHousesRoute.name,
          path: 'rental_houses',
        );

  static const String name = 'RentalHousesRoute';
}

/// generated route for
/// [_i23.PurchaseHousesScreen]
class PurchaseHousesRoute extends _i38.PageRouteInfo<void> {
  const PurchaseHousesRoute()
      : super(
          PurchaseHousesRoute.name,
          path: 'purchase_houses',
        );

  static const String name = 'PurchaseHousesRoute';
}

/// generated route for
/// [_i24.NaturalJewelryScreen]
class NaturalJewelryRoute extends _i38.PageRouteInfo<void> {
  const NaturalJewelryRoute()
      : super(
          NaturalJewelryRoute.name,
          path: 'natural_jewelry',
        );

  static const String name = 'NaturalJewelryRoute';
}

/// generated route for
/// [_i25.SyntheticJewelryScreen]
class SyntheticJewelryRoute extends _i38.PageRouteInfo<void> {
  const SyntheticJewelryRoute()
      : super(
          SyntheticJewelryRoute.name,
          path: 'synthetic_jewelry',
        );

  static const String name = 'SyntheticJewelryRoute';
}

/// generated route for
/// [_i26.RelationshipScreen]
class RelationshipRoute extends _i38.PageRouteInfo<void> {
  const RelationshipRoute({List<_i38.PageRouteInfo>? children})
      : super(
          RelationshipRoute.name,
          path: '',
          initialChildren: children,
        );

  static const String name = 'RelationshipRoute';
}

/// generated route for
/// [_i27.RelationshipActionsScreen]
class RelationshipActionsRoute
    extends _i38.PageRouteInfo<RelationshipActionsRouteArgs> {
  RelationshipActionsRoute({
    _i39.Key? key,
    required String relationshipLabel,
    required _i41.RelationshipPair<dynamic> relationshipPair,
    required _i42.Person player,
    required int relationship,
    required bool livingTogether,
  }) : super(
          RelationshipActionsRoute.name,
          path: 'relationship_actions',
          args: RelationshipActionsRouteArgs(
            key: key,
            relationshipLabel: relationshipLabel,
            relationshipPair: relationshipPair,
            player: player,
            relationship: relationship,
            livingTogether: livingTogether,
          ),
        );

  static const String name = 'RelationshipActionsRoute';
}

class RelationshipActionsRouteArgs {
  const RelationshipActionsRouteArgs({
    this.key,
    required this.relationshipLabel,
    required this.relationshipPair,
    required this.player,
    required this.relationship,
    required this.livingTogether,
  });

  final _i39.Key? key;

  final String relationshipLabel;

  final _i41.RelationshipPair<dynamic> relationshipPair;

  final _i42.Person player;

  final int relationship;

  final bool livingTogether;

  @override
  String toString() {
    return 'RelationshipActionsRouteArgs{key: $key, relationshipLabel: $relationshipLabel, relationshipPair: $relationshipPair, player: $player, relationship: $relationship, livingTogether: $livingTogether}';
  }
}

/// generated route for
/// [_i28.ParentsScreen]
class ParentsRoute extends _i38.PageRouteInfo<void> {
  const ParentsRoute()
      : super(
          ParentsRoute.name,
          path: 'parents',
        );

  static const String name = 'ParentsRoute';
}

/// generated route for
/// [_i29.SiblingsScreen]
class SiblingsRoute extends _i38.PageRouteInfo<void> {
  const SiblingsRoute()
      : super(
          SiblingsRoute.name,
          path: 'siblings',
        );

  static const String name = 'SiblingsRoute';
}

/// generated route for
/// [_i30.PartnersScreen]
class PartnersRoute extends _i38.PageRouteInfo<void> {
  const PartnersRoute()
      : super(
          PartnersRoute.name,
          path: 'partners',
        );

  static const String name = 'PartnersRoute';
}

/// generated route for
/// [_i31.ChildrenScreen]
class ChildrenRoute extends _i38.PageRouteInfo<void> {
  const ChildrenRoute()
      : super(
          ChildrenRoute.name,
          path: 'children',
        );

  static const String name = 'ChildrenRoute';
}

/// generated route for
/// [_i32.RelativesScreen]
class RelativesRoute extends _i38.PageRouteInfo<void> {
  const RelativesRoute()
      : super(
          RelativesRoute.name,
          path: 'relatives',
        );

  static const String name = 'RelativesRoute';
}

/// generated route for
/// [_i33.InLawsScreen]
class InLawsRoute extends _i38.PageRouteInfo<void> {
  const InLawsRoute()
      : super(
          InLawsRoute.name,
          path: 'inlaws',
        );

  static const String name = 'InLawsRoute';
}

/// generated route for
/// [_i34.FriendsScreen]
class FriendsRoute extends _i38.PageRouteInfo<void> {
  const FriendsRoute()
      : super(
          FriendsRoute.name,
          path: 'friends',
        );

  static const String name = 'FriendsRoute';
}

/// generated route for
/// [_i35.ExesScreen]
class ExesRoute extends _i38.PageRouteInfo<void> {
  const ExesRoute()
      : super(
          ExesRoute.name,
          path: 'exes',
        );

  static const String name = 'ExesRoute';
}

/// generated route for
/// [_i36.GravesScreen]
class GravesRoute extends _i38.PageRouteInfo<void> {
  const GravesRoute()
      : super(
          GravesRoute.name,
          path: 'grave',
        );

  static const String name = 'GravesRoute';
}

/// generated route for
/// [_i37.ActivitiesScreen]
class ActivitiesRoute extends _i38.PageRouteInfo<void> {
  const ActivitiesRoute()
      : super(
          ActivitiesRoute.name,
          path: '',
        );

  static const String name = 'ActivitiesRoute';
}
