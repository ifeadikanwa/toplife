import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:toplife/config/routing/app_router.gr.dart';
import 'package:toplife/core/common_states/dependencies/game/game_dependencies_providers.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_game_provider.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/text_constants.dart';

@RoutePage()
class MainGameScreen extends ConsumerWidget {
  const MainGameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Trigger game controller to work in the background
    //listen for changes in game
    ref.listen(currentGameProvider.future, (
      Future<Game?>? previousGameFuture,
      Future<Game?> nextGameFuture,
    ) async {
      //call the game controller
      ref.watch(gameUsecasesProvider).gameControllerUsecase.execute(
            previousGameFuture: previousGameFuture,
            nextGameFuture: nextGameFuture,
            context: context,
          );
    });

    final appTheme = Theme.of(context);

    return SafeArea(
      child: AutoTabsScaffold(
        routes: const [
          PlayerRoute(),
          WorkRoute(),
          ShopRoute(),
          RelationshipRoute(),
          ActivitiesRoute(),
        ],
        bottomNavigationBuilder: (context, tabsRouter) {
          return SnakeNavigationBar.color(
            height: bottomNavBarHeight,
            behaviour: SnakeBarBehaviour.pinned,
            snakeShape: SnakeShape.indicator,
            backgroundColor: appTheme.scaffoldBackgroundColor,
            snakeViewColor: appTheme.colorScheme.tertiary,
            selectedItemColor: appTheme.colorScheme.tertiary,
            unselectedItemColor: (appTheme.brightness == Brightness.light)
                ? Colors.black
                : Colors.white,
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) => tabsRouter.setActiveIndex(index),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: TextConstants.me,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.work_outline_outlined),
                label: TextConstants.work,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                label: TextConstants.shop,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_outlined),
                label: TextConstants.relationships,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz_outlined),
                label: TextConstants.activities,
              ),
            ],
          );
        },
      ),
    );
  }
}
