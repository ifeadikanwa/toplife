import 'package:flutter/material.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';

class AnimatedBottomNavigationBar extends StatefulWidget {
  const AnimatedBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<AnimatedBottomNavigationBar> createState() =>
      _AnimatedBottomNavigationBarState();
}

class _AnimatedBottomNavigationBarState
    extends State<AnimatedBottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);

    return CustomNavigationBar(
      selectedColor: appTheme.colorScheme.tertiary,
      strokeColor: appTheme.colorScheme.tertiary,
      unSelectedColor: (appTheme.brightness == Brightness.light)
          ? Colors.black
          : Colors.white,
      backgroundColor: appTheme.scaffoldBackgroundColor,
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() => _selectedIndex = index);
      },
      items: [
        CustomNavigationBarItem(
          icon: const Icon(Icons.person_outlined),
        ),
        CustomNavigationBarItem(
          icon: const Icon(Icons.work_outline),
        ),
        CustomNavigationBarItem(
          icon: const Icon(Icons.shopping_cart_outlined),
        ),
        CustomNavigationBarItem(
            icon: const Icon(Icons.favorite_border_outlined)),
        CustomNavigationBarItem(
          icon: const Icon(Icons.more_horiz_outlined),
        ),
      ],
    );
  }
}
