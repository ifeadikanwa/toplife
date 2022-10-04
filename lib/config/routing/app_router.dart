import 'package:auto_route/annotations.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:toplife/config/routing/route_name.dart';
import 'package:toplife/game_manager/presentation/game_manager_screen.dart';
import 'package:toplife/main_game/presentation/main_game_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/activities/widgets/activities_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/player/widgets/player_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/relationship_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/shop_screen.dart';
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
          ],
        ),
        AutoRoute(
          path: RouteName.relationshipPath,
          name: RouteName.relationshipRouter,
          page: EmptyRouterPage,
          children: [
            //all screens under relationship tab
            AutoRoute(
              path: RouteName.emptyPath,
              page: RelationshipScreen,
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
