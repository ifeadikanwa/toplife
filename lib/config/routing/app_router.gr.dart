// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i18;
import 'package:auto_route/empty_router_widgets.dart' as _i3;
import 'package:flutter/material.dart' as _i19;

import '../../game_manager/presentation/game_manager_screen.dart' as _i2;
import '../../main_game/presentation/main_game_screen.dart' as _i1;
import '../../main_game/presentation/top_level_screens/activities/widgets/activities_screen.dart'
    as _i17;
import '../../main_game/presentation/top_level_screens/player/widgets/player_screen.dart'
    as _i4;
import '../../main_game/presentation/top_level_screens/relationship/widgets/relationship_screen.dart'
    as _i7;
import '../../main_game/presentation/top_level_screens/relationship/widgets/sub_screens/children_screen.dart'
    as _i11;
import '../../main_game/presentation/top_level_screens/relationship/widgets/sub_screens/exes_screen.dart'
    as _i15;
import '../../main_game/presentation/top_level_screens/relationship/widgets/sub_screens/friends_screen.dart'
    as _i14;
import '../../main_game/presentation/top_level_screens/relationship/widgets/sub_screens/graveyard_screen.dart'
    as _i16;
import '../../main_game/presentation/top_level_screens/relationship/widgets/sub_screens/inlaws_screen.dart'
    as _i13;
import '../../main_game/presentation/top_level_screens/relationship/widgets/sub_screens/parents_screen.dart'
    as _i8;
import '../../main_game/presentation/top_level_screens/relationship/widgets/sub_screens/partners_screen.dart'
    as _i10;
import '../../main_game/presentation/top_level_screens/relationship/widgets/sub_screens/relatives_screen.dart'
    as _i12;
import '../../main_game/presentation/top_level_screens/relationship/widgets/sub_screens/siblings_screen.dart'
    as _i9;
import '../../main_game/presentation/top_level_screens/shop/widgets/shop_screen.dart'
    as _i6;
import '../../main_game/presentation/top_level_screens/work/widgets/work_screen.dart'
    as _i5;
import '../../main_systems/system_person/domain/model/person.dart' as _i22;
import '../../main_systems/system_relationship/domain/model/child.dart' as _i25;
import '../../main_systems/system_relationship/domain/model/friend.dart'
    as _i28;
import '../../main_systems/system_relationship/domain/model/graveyard.dart'
    as _i29;
import '../../main_systems/system_relationship/domain/model/info_models/relationship_pair.dart'
    as _i20;
import '../../main_systems/system_relationship/domain/model/inlaw.dart' as _i27;
import '../../main_systems/system_relationship/domain/model/parent.dart'
    as _i21;
import '../../main_systems/system_relationship/domain/model/partner.dart'
    as _i24;
import '../../main_systems/system_relationship/domain/model/relative.dart'
    as _i26;
import '../../main_systems/system_relationship/domain/model/sibling.dart'
    as _i23;

class AppRouter extends _i18.RootStackRouter {
  AppRouter([_i19.GlobalKey<_i19.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i18.PageFactory> pagesMap = {
    MainGameRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.MainGameScreen());
    },
    GameManagerRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.GameManagerScreen());
    },
    PlayerRouter.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    WorkRouter.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    ShopRouter.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    RelationshipRouter.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    ActivitiesRouter.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    PlayerRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.PlayerScreen());
    },
    WorkRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.WorkScreen());
    },
    ShopRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.ShopScreen());
    },
    RelationshipRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.RelationshipScreen());
    },
    ParentsRoute.name: (routeData) {
      final args = routeData.argsAs<ParentsRouteArgs>();
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.ParentsScreen(key: args.key, parents: args.parents));
    },
    SiblingsRoute.name: (routeData) {
      final args = routeData.argsAs<SiblingsRouteArgs>();
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.SiblingsScreen(key: args.key, siblings: args.siblings));
    },
    PartnersRoute.name: (routeData) {
      final args = routeData.argsAs<PartnersRouteArgs>();
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i10.PartnersScreen(key: args.key, partners: args.partners));
    },
    ChildrenRoute.name: (routeData) {
      final args = routeData.argsAs<ChildrenRouteArgs>();
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i11.ChildrenScreen(
              key: args.key, childrenList: args.childrenList));
    },
    RelativesRoute.name: (routeData) {
      final args = routeData.argsAs<RelativesRouteArgs>();
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i12.RelativesScreen(key: args.key, relatives: args.relatives));
    },
    InLawsRoute.name: (routeData) {
      final args = routeData.argsAs<InLawsRouteArgs>();
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i13.InLawsScreen(key: args.key, inLaws: args.inLaws));
    },
    FriendsRoute.name: (routeData) {
      final args = routeData.argsAs<FriendsRouteArgs>();
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i14.FriendsScreen(key: args.key, friends: args.friends));
    },
    ExesRoute.name: (routeData) {
      final args = routeData.argsAs<ExesRouteArgs>();
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i15.ExesScreen(key: args.key, exes: args.exes));
    },
    GraveyardRoute.name: (routeData) {
      final args = routeData.argsAs<GraveyardRouteArgs>();
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i16.GraveyardScreen(key: args.key, graveyards: args.graveyards));
    },
    ActivitiesRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i17.ActivitiesScreen());
    }
  };

  @override
  List<_i18.RouteConfig> get routes => [
        _i18.RouteConfig('/#redirect',
            path: '/', redirectTo: '/maingame', fullMatch: true),
        _i18.RouteConfig(MainGameRoute.name, path: '/maingame', children: [
          _i18.RouteConfig(PlayerRouter.name,
              path: 'player',
              parent: MainGameRoute.name,
              children: [
                _i18.RouteConfig(PlayerRoute.name,
                    path: '', parent: PlayerRouter.name)
              ]),
          _i18.RouteConfig(WorkRouter.name,
              path: 'work',
              parent: MainGameRoute.name,
              children: [
                _i18.RouteConfig(WorkRoute.name,
                    path: '', parent: WorkRouter.name)
              ]),
          _i18.RouteConfig(ShopRouter.name,
              path: 'shop',
              parent: MainGameRoute.name,
              children: [
                _i18.RouteConfig(ShopRoute.name,
                    path: '', parent: ShopRouter.name)
              ]),
          _i18.RouteConfig(RelationshipRouter.name,
              path: 'relationship',
              parent: MainGameRoute.name,
              children: [
                _i18.RouteConfig(RelationshipRoute.name,
                    path: '',
                    parent: RelationshipRouter.name,
                    children: [
                      _i18.RouteConfig(ParentsRoute.name,
                          path: 'parents', parent: RelationshipRoute.name),
                      _i18.RouteConfig(SiblingsRoute.name,
                          path: 'siblings', parent: RelationshipRoute.name),
                      _i18.RouteConfig(PartnersRoute.name,
                          path: 'partners', parent: RelationshipRoute.name),
                      _i18.RouteConfig(ChildrenRoute.name,
                          path: 'children', parent: RelationshipRoute.name),
                      _i18.RouteConfig(RelativesRoute.name,
                          path: 'relatives', parent: RelationshipRoute.name),
                      _i18.RouteConfig(InLawsRoute.name,
                          path: 'inlaws', parent: RelationshipRoute.name),
                      _i18.RouteConfig(FriendsRoute.name,
                          path: 'friends', parent: RelationshipRoute.name),
                      _i18.RouteConfig(ExesRoute.name,
                          path: 'exes', parent: RelationshipRoute.name),
                      _i18.RouteConfig(GraveyardRoute.name,
                          path: 'graveyard', parent: RelationshipRoute.name)
                    ])
              ]),
          _i18.RouteConfig(ActivitiesRouter.name,
              path: 'activities',
              parent: MainGameRoute.name,
              children: [
                _i18.RouteConfig(ActivitiesRoute.name,
                    path: '', parent: ActivitiesRouter.name)
              ])
        ]),
        _i18.RouteConfig(GameManagerRoute.name, path: '/manager')
      ];
}

/// generated route for
/// [_i1.MainGameScreen]
class MainGameRoute extends _i18.PageRouteInfo<void> {
  const MainGameRoute({List<_i18.PageRouteInfo>? children})
      : super(MainGameRoute.name, path: '/maingame', initialChildren: children);

  static const String name = 'MainGameRoute';
}

/// generated route for
/// [_i2.GameManagerScreen]
class GameManagerRoute extends _i18.PageRouteInfo<void> {
  const GameManagerRoute() : super(GameManagerRoute.name, path: '/manager');

  static const String name = 'GameManagerRoute';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class PlayerRouter extends _i18.PageRouteInfo<void> {
  const PlayerRouter({List<_i18.PageRouteInfo>? children})
      : super(PlayerRouter.name, path: 'player', initialChildren: children);

  static const String name = 'PlayerRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class WorkRouter extends _i18.PageRouteInfo<void> {
  const WorkRouter({List<_i18.PageRouteInfo>? children})
      : super(WorkRouter.name, path: 'work', initialChildren: children);

  static const String name = 'WorkRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class ShopRouter extends _i18.PageRouteInfo<void> {
  const ShopRouter({List<_i18.PageRouteInfo>? children})
      : super(ShopRouter.name, path: 'shop', initialChildren: children);

  static const String name = 'ShopRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class RelationshipRouter extends _i18.PageRouteInfo<void> {
  const RelationshipRouter({List<_i18.PageRouteInfo>? children})
      : super(RelationshipRouter.name,
            path: 'relationship', initialChildren: children);

  static const String name = 'RelationshipRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class ActivitiesRouter extends _i18.PageRouteInfo<void> {
  const ActivitiesRouter({List<_i18.PageRouteInfo>? children})
      : super(ActivitiesRouter.name,
            path: 'activities', initialChildren: children);

  static const String name = 'ActivitiesRouter';
}

/// generated route for
/// [_i4.PlayerScreen]
class PlayerRoute extends _i18.PageRouteInfo<void> {
  const PlayerRoute() : super(PlayerRoute.name, path: '');

  static const String name = 'PlayerRoute';
}

/// generated route for
/// [_i5.WorkScreen]
class WorkRoute extends _i18.PageRouteInfo<void> {
  const WorkRoute() : super(WorkRoute.name, path: '');

  static const String name = 'WorkRoute';
}

/// generated route for
/// [_i6.ShopScreen]
class ShopRoute extends _i18.PageRouteInfo<void> {
  const ShopRoute() : super(ShopRoute.name, path: '');

  static const String name = 'ShopRoute';
}

/// generated route for
/// [_i7.RelationshipScreen]
class RelationshipRoute extends _i18.PageRouteInfo<void> {
  const RelationshipRoute({List<_i18.PageRouteInfo>? children})
      : super(RelationshipRoute.name, path: '', initialChildren: children);

  static const String name = 'RelationshipRoute';
}

/// generated route for
/// [_i8.ParentsScreen]
class ParentsRoute extends _i18.PageRouteInfo<ParentsRouteArgs> {
  ParentsRoute(
      {_i19.Key? key,
      required List<_i20.RelationshipPair<_i21.Parent, _i22.Person>> parents})
      : super(ParentsRoute.name,
            path: 'parents',
            args: ParentsRouteArgs(key: key, parents: parents));

  static const String name = 'ParentsRoute';
}

class ParentsRouteArgs {
  const ParentsRouteArgs({this.key, required this.parents});

  final _i19.Key? key;

  final List<_i20.RelationshipPair<_i21.Parent, _i22.Person>> parents;

  @override
  String toString() {
    return 'ParentsRouteArgs{key: $key, parents: $parents}';
  }
}

/// generated route for
/// [_i9.SiblingsScreen]
class SiblingsRoute extends _i18.PageRouteInfo<SiblingsRouteArgs> {
  SiblingsRoute(
      {_i19.Key? key,
      required List<_i20.RelationshipPair<_i23.Sibling, _i22.Person>> siblings})
      : super(SiblingsRoute.name,
            path: 'siblings',
            args: SiblingsRouteArgs(key: key, siblings: siblings));

  static const String name = 'SiblingsRoute';
}

class SiblingsRouteArgs {
  const SiblingsRouteArgs({this.key, required this.siblings});

  final _i19.Key? key;

  final List<_i20.RelationshipPair<_i23.Sibling, _i22.Person>> siblings;

  @override
  String toString() {
    return 'SiblingsRouteArgs{key: $key, siblings: $siblings}';
  }
}

/// generated route for
/// [_i10.PartnersScreen]
class PartnersRoute extends _i18.PageRouteInfo<PartnersRouteArgs> {
  PartnersRoute(
      {_i19.Key? key,
      required List<_i20.RelationshipPair<_i24.Partner, _i22.Person>> partners})
      : super(PartnersRoute.name,
            path: 'partners',
            args: PartnersRouteArgs(key: key, partners: partners));

  static const String name = 'PartnersRoute';
}

class PartnersRouteArgs {
  const PartnersRouteArgs({this.key, required this.partners});

  final _i19.Key? key;

  final List<_i20.RelationshipPair<_i24.Partner, _i22.Person>> partners;

  @override
  String toString() {
    return 'PartnersRouteArgs{key: $key, partners: $partners}';
  }
}

/// generated route for
/// [_i11.ChildrenScreen]
class ChildrenRoute extends _i18.PageRouteInfo<ChildrenRouteArgs> {
  ChildrenRoute(
      {_i19.Key? key,
      required List<_i20.RelationshipPair<_i25.Child, _i22.Person>>
          childrenList})
      : super(ChildrenRoute.name,
            path: 'children',
            args: ChildrenRouteArgs(key: key, childrenList: childrenList));

  static const String name = 'ChildrenRoute';
}

class ChildrenRouteArgs {
  const ChildrenRouteArgs({this.key, required this.childrenList});

  final _i19.Key? key;

  final List<_i20.RelationshipPair<_i25.Child, _i22.Person>> childrenList;

  @override
  String toString() {
    return 'ChildrenRouteArgs{key: $key, childrenList: $childrenList}';
  }
}

/// generated route for
/// [_i12.RelativesScreen]
class RelativesRoute extends _i18.PageRouteInfo<RelativesRouteArgs> {
  RelativesRoute(
      {_i19.Key? key,
      required List<_i20.RelationshipPair<_i26.Relative, _i22.Person>>
          relatives})
      : super(RelativesRoute.name,
            path: 'relatives',
            args: RelativesRouteArgs(key: key, relatives: relatives));

  static const String name = 'RelativesRoute';
}

class RelativesRouteArgs {
  const RelativesRouteArgs({this.key, required this.relatives});

  final _i19.Key? key;

  final List<_i20.RelationshipPair<_i26.Relative, _i22.Person>> relatives;

  @override
  String toString() {
    return 'RelativesRouteArgs{key: $key, relatives: $relatives}';
  }
}

/// generated route for
/// [_i13.InLawsScreen]
class InLawsRoute extends _i18.PageRouteInfo<InLawsRouteArgs> {
  InLawsRoute(
      {_i19.Key? key,
      required List<_i20.RelationshipPair<_i27.InLaw, _i22.Person>> inLaws})
      : super(InLawsRoute.name,
            path: 'inlaws', args: InLawsRouteArgs(key: key, inLaws: inLaws));

  static const String name = 'InLawsRoute';
}

class InLawsRouteArgs {
  const InLawsRouteArgs({this.key, required this.inLaws});

  final _i19.Key? key;

  final List<_i20.RelationshipPair<_i27.InLaw, _i22.Person>> inLaws;

  @override
  String toString() {
    return 'InLawsRouteArgs{key: $key, inLaws: $inLaws}';
  }
}

/// generated route for
/// [_i14.FriendsScreen]
class FriendsRoute extends _i18.PageRouteInfo<FriendsRouteArgs> {
  FriendsRoute(
      {_i19.Key? key,
      required List<_i20.RelationshipPair<_i28.Friend, _i22.Person>> friends})
      : super(FriendsRoute.name,
            path: 'friends',
            args: FriendsRouteArgs(key: key, friends: friends));

  static const String name = 'FriendsRoute';
}

class FriendsRouteArgs {
  const FriendsRouteArgs({this.key, required this.friends});

  final _i19.Key? key;

  final List<_i20.RelationshipPair<_i28.Friend, _i22.Person>> friends;

  @override
  String toString() {
    return 'FriendsRouteArgs{key: $key, friends: $friends}';
  }
}

/// generated route for
/// [_i15.ExesScreen]
class ExesRoute extends _i18.PageRouteInfo<ExesRouteArgs> {
  ExesRoute(
      {_i19.Key? key,
      required List<_i20.RelationshipPair<_i24.Partner, _i22.Person>> exes})
      : super(ExesRoute.name,
            path: 'exes', args: ExesRouteArgs(key: key, exes: exes));

  static const String name = 'ExesRoute';
}

class ExesRouteArgs {
  const ExesRouteArgs({this.key, required this.exes});

  final _i19.Key? key;

  final List<_i20.RelationshipPair<_i24.Partner, _i22.Person>> exes;

  @override
  String toString() {
    return 'ExesRouteArgs{key: $key, exes: $exes}';
  }
}

/// generated route for
/// [_i16.GraveyardScreen]
class GraveyardRoute extends _i18.PageRouteInfo<GraveyardRouteArgs> {
  GraveyardRoute({_i19.Key? key, required List<_i29.Graveyard> graveyards})
      : super(GraveyardRoute.name,
            path: 'graveyard',
            args: GraveyardRouteArgs(key: key, graveyards: graveyards));

  static const String name = 'GraveyardRoute';
}

class GraveyardRouteArgs {
  const GraveyardRouteArgs({this.key, required this.graveyards});

  final _i19.Key? key;

  final List<_i29.Graveyard> graveyards;

  @override
  String toString() {
    return 'GraveyardRouteArgs{key: $key, graveyards: $graveyards}';
  }
}

/// generated route for
/// [_i17.ActivitiesScreen]
class ActivitiesRoute extends _i18.PageRouteInfo<void> {
  const ActivitiesRoute() : super(ActivitiesRoute.name, path: '');

  static const String name = 'ActivitiesRoute';
}
