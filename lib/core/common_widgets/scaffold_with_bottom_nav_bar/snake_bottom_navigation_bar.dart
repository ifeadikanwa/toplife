import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';

class SnakeBottomNavigationBar extends StatefulWidget {
  const SnakeBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<SnakeBottomNavigationBar> createState() =>
      _SnakeBottomNavigationBarState();
}

class _SnakeBottomNavigationBarState extends State<SnakeBottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);

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
      currentIndex: _selectedIndex,
      onTap: (index) => setState(() => _selectedIndex = index),
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.work_outline_outlined), label: "Work"),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined), label: "Shop"),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined), label: "Relationship"),
        BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz_outlined), label: "Activities"),
      ],
    );
  }
}
