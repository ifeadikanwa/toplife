import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:go_router/go_router.dart';
import 'package:toplife/config/routing/app_router.dart';
import 'package:toplife/core/common_widgets/scaffold_with_bottom_nav_bar/scaffold_with_bottom_nav_bar_item.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/text_constants.dart';

class ScaffoldWithBottomNavBar extends StatelessWidget {
  final Widget child;

  const ScaffoldWithBottomNavBar({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: child,
      ),
      bottomNavigationBar: SnakeNavigationBar.color(
        height: bottomNavBarHeight,
        behaviour: SnakeBarBehaviour.pinned,
        snakeShape: SnakeShape.indicator,
        backgroundColor: appTheme.scaffoldBackgroundColor,
        snakeViewColor: appTheme.colorScheme.tertiary,
        selectedItemColor: appTheme.colorScheme.tertiary,
        unselectedItemColor: (appTheme.brightness == Brightness.light)
            ? Colors.black
            : Colors.white,
        currentIndex: _calculateSelectedIndex(context),
        onTap: (index) => _onItemTapped(context, index),
        items: tabs,
      ),
    );
  }

  static final tabs = [
    ScaffoldWithBottomNavBarItem(
      initialLocation: AppRouter.playerPath,
      icon: const Icon(Icons.person_outline),
      label: TextConstants.home,
    ),
    ScaffoldWithBottomNavBarItem(
      initialLocation: AppRouter.workPath,
      icon: const Icon(Icons.work_outline_outlined),
      label: TextConstants.work,
    ),
    ScaffoldWithBottomNavBarItem(
      initialLocation: AppRouter.shopPath,
      icon: const Icon(Icons.shopping_cart_outlined),
      label: TextConstants.shop,
    ),
    ScaffoldWithBottomNavBarItem(
      initialLocation: AppRouter.relationshipPath,
      icon: const Icon(Icons.favorite_border_outlined),
      label: TextConstants.relationships,
    ),
    ScaffoldWithBottomNavBarItem(
      initialLocation: AppRouter.activitiesPath,
      icon: const Icon(Icons.more_horiz_outlined),
      label: TextConstants.activities,
    )
  ];

  static int _calculateSelectedIndex(BuildContext context) {
    final GoRouter route = GoRouter.of(context);
    final String location = route.location;

    final index =
        tabs.indexWhere((tab) => location.startsWith(tab.initialLocation));

    // if index not found (-1), return 0
    return index < 0 ? 0 : index;
  }

  void _onItemTapped(BuildContext context, int tabIndex) {
    // go to the initial location of the selected tab (by index)
    context.go(tabs[tabIndex].initialLocation);
  }
}
