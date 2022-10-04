import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:toplife/core/common_widgets/scaffold_with_bottom_nav_bar/scaffold_with_bottom_nav_bar.dart';
import 'package:toplife/game_manager/presentation/game_manager_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/activities/widgets/activities_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/player/widgets/player_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/relationship_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/shop_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/work/widgets/work_screen.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey<NavigatorState>();

  //route names
  //Game manager routes
  //-paths (for top level destinations only)
  static const gameManagerPath = "/manager";
  //-named routes
  static const gameManagerRouteName = "manager";

  //Main game routes
  //-paths (for top level destinations only)
  static const playerPath = "/player";
  static const workPath = "/work";
  static const relationshipPath = "/relationship";
  static const shopPath = "/shop";
  static const activitiesPath = "/activities";
  //-named routes
  static const playerRouteName = "player";
  static const workRouteName = "work";
  static const relationshipRouteName = "relationship";
  static const shopRouteName = "shop";
  static const activitiesRouteName = "activities";

  //Router
  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: playerPath,
    routes: [
      //Game manager routing(should cover the entire screen including nav bar)
      GoRoute(
        name: gameManagerRouteName,
        path: gameManagerPath,
        builder: (context, state) {
          return const GameManagerScreen();
        },
        routes: const [
          //new game, load game, settings, achievements etc. will go in here with KEY =  _rootNavigatorKey
        ],
      ),
      //Main game shell
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return ScaffoldWithBottomNavBar(child: child);
        },
        routes: [
          GoRoute(
            name: playerRouteName,
            path: playerPath,
            builder: (context, state) {
              return const PlayerScreen();
            },
          ),
          GoRoute(
            name: workRouteName,
            path: workPath,
            builder: (context, state) {
              return const WorkScreen();
            },
          ),
          GoRoute(
            name: relationshipRouteName,
            path: relationshipPath,
            builder: (context, state) {
              return const RelationshipScreen();
            },
          ),
          GoRoute(
            name: shopRouteName,
            path: shopPath,
            builder: (context, state) {
              return const ShopScreen();
            },
          ),
          GoRoute(
            name: activitiesRouteName,
            path: activitiesPath,
            builder: (context, state) {
              return const ActivitiesScreen();
            },
          )
        ],
      )
    ],
  );
}
