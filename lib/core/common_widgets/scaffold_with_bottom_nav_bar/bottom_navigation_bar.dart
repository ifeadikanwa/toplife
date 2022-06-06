import 'package:flutter/material.dart';
import 'package:toplife/config/theme/colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: const NavigationBarThemeData(
        height: 60.0,
        backgroundColor: translucentWhite,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      ),
      child: NavigationBar(
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.person_outline), label: "Home"),
          NavigationDestination(
              icon: Icon(Icons.work_outline_outlined), label: "Work"),
          NavigationDestination(
              icon: Icon(Icons.shopping_cart_outlined), label: "Shop"),
          NavigationDestination(
              icon: Icon(Icons.favorite_border_outlined),
              label: "Relationship"),
          NavigationDestination(
              icon: Icon(Icons.more_horiz_outlined), label: "Activities"),
        ],
      ),
    );
  }
}
