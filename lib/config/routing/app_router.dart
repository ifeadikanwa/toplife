import 'package:auto_route/annotations.dart';
import 'package:auto_route/empty_router_widgets.dart';
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
              children: [
                
              ],
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
