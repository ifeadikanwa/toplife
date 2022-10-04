// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i9;
import 'package:auto_route/empty_router_widgets.dart' as _i3;
import 'package:flutter/material.dart' as _i10;

import '../../game_manager/presentation/game_manager_screen.dart' as _i2;
import '../../main_game/presentation/main_game_screen.dart' as _i1;
import '../../main_game/presentation/top_level_screens/activities/widgets/activities_screen.dart'
    as _i8;
import '../../main_game/presentation/top_level_screens/player/widgets/player_screen.dart'
    as _i4;
import '../../main_game/presentation/top_level_screens/relationship/widgets/relationship_screen.dart'
    as _i7;
import '../../main_game/presentation/top_level_screens/shop/widgets/shop_screen.dart'
    as _i6;
import '../../main_game/presentation/top_level_screens/work/widgets/work_screen.dart'
    as _i5;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    MainGameRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.MainGameScreen());
    },
    GameManagerRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.GameManagerScreen());
    },
    PlayerRouter.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    WorkRouter.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    ShopRouter.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    RelationshipRouter.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    ActivitiesRouter.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    PlayerRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.PlayerScreen());
    },
    WorkRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.WorkScreen());
    },
    ShopRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.ShopScreen());
    },
    RelationshipRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.RelationshipScreen());
    },
    ActivitiesRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.ActivitiesScreen());
    }
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig('/#redirect',
            path: '/', redirectTo: '/maingame', fullMatch: true),
        _i9.RouteConfig(MainGameRoute.name, path: '/maingame', children: [
          _i9.RouteConfig(PlayerRouter.name,
              path: 'player',
              parent: MainGameRoute.name,
              children: [
                _i9.RouteConfig(PlayerRoute.name,
                    path: '', parent: PlayerRouter.name)
              ]),
          _i9.RouteConfig(WorkRouter.name,
              path: 'work',
              parent: MainGameRoute.name,
              children: [
                _i9.RouteConfig(WorkRoute.name,
                    path: '', parent: WorkRouter.name)
              ]),
          _i9.RouteConfig(ShopRouter.name,
              path: 'shop',
              parent: MainGameRoute.name,
              children: [
                _i9.RouteConfig(ShopRoute.name,
                    path: '', parent: ShopRouter.name)
              ]),
          _i9.RouteConfig(RelationshipRouter.name,
              path: 'relationship',
              parent: MainGameRoute.name,
              children: [
                _i9.RouteConfig(RelationshipRoute.name,
                    path: '', parent: RelationshipRouter.name)
              ]),
          _i9.RouteConfig(ActivitiesRouter.name,
              path: 'activities',
              parent: MainGameRoute.name,
              children: [
                _i9.RouteConfig(ActivitiesRoute.name,
                    path: '', parent: ActivitiesRouter.name)
              ])
        ]),
        _i9.RouteConfig(GameManagerRoute.name, path: '/manager')
      ];
}

/// generated route for
/// [_i1.MainGameScreen]
class MainGameRoute extends _i9.PageRouteInfo<void> {
  const MainGameRoute({List<_i9.PageRouteInfo>? children})
      : super(MainGameRoute.name, path: '/maingame', initialChildren: children);

  static const String name = 'MainGameRoute';
}

/// generated route for
/// [_i2.GameManagerScreen]
class GameManagerRoute extends _i9.PageRouteInfo<void> {
  const GameManagerRoute() : super(GameManagerRoute.name, path: '/manager');

  static const String name = 'GameManagerRoute';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class PlayerRouter extends _i9.PageRouteInfo<void> {
  const PlayerRouter({List<_i9.PageRouteInfo>? children})
      : super(PlayerRouter.name, path: 'player', initialChildren: children);

  static const String name = 'PlayerRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class WorkRouter extends _i9.PageRouteInfo<void> {
  const WorkRouter({List<_i9.PageRouteInfo>? children})
      : super(WorkRouter.name, path: 'work', initialChildren: children);

  static const String name = 'WorkRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class ShopRouter extends _i9.PageRouteInfo<void> {
  const ShopRouter({List<_i9.PageRouteInfo>? children})
      : super(ShopRouter.name, path: 'shop', initialChildren: children);

  static const String name = 'ShopRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class RelationshipRouter extends _i9.PageRouteInfo<void> {
  const RelationshipRouter({List<_i9.PageRouteInfo>? children})
      : super(RelationshipRouter.name,
            path: 'relationship', initialChildren: children);

  static const String name = 'RelationshipRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class ActivitiesRouter extends _i9.PageRouteInfo<void> {
  const ActivitiesRouter({List<_i9.PageRouteInfo>? children})
      : super(ActivitiesRouter.name,
            path: 'activities', initialChildren: children);

  static const String name = 'ActivitiesRouter';
}

/// generated route for
/// [_i4.PlayerScreen]
class PlayerRoute extends _i9.PageRouteInfo<void> {
  const PlayerRoute() : super(PlayerRoute.name, path: '');

  static const String name = 'PlayerRoute';
}

/// generated route for
/// [_i5.WorkScreen]
class WorkRoute extends _i9.PageRouteInfo<void> {
  const WorkRoute() : super(WorkRoute.name, path: '');

  static const String name = 'WorkRoute';
}

/// generated route for
/// [_i6.ShopScreen]
class ShopRoute extends _i9.PageRouteInfo<void> {
  const ShopRoute() : super(ShopRoute.name, path: '');

  static const String name = 'ShopRoute';
}

/// generated route for
/// [_i7.RelationshipScreen]
class RelationshipRoute extends _i9.PageRouteInfo<void> {
  const RelationshipRoute() : super(RelationshipRoute.name, path: '');

  static const String name = 'RelationshipRoute';
}

/// generated route for
/// [_i8.ActivitiesScreen]
class ActivitiesRoute extends _i9.PageRouteInfo<void> {
  const ActivitiesRoute() : super(ActivitiesRoute.name, path: '');

  static const String name = 'ActivitiesRoute';
}
