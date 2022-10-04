import 'package:flutter/material.dart';

//A bottom nav item class that takes in an extra property
class ScaffoldWithBottomNavBarItem extends BottomNavigationBarItem {
  final String initialLocation;

  ScaffoldWithBottomNavBarItem({
    required this.initialLocation,
    required super.icon,
    required super.label,
  });
}
