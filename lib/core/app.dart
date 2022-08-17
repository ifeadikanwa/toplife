import 'package:flutter/material.dart';
import 'package:toplife/config/theme/app_theme.dart';
import 'package:toplife/core/common_widgets/scaffold_with_bottom_nav_bar/bottom_navigation_bar.dart';
import 'package:toplife/game_manager/presentation/game_manager_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const Scaffold(
        bottomNavigationBar: BottomNavBar(),
        body: SafeArea(
          child: GameScreen(),
        ),
      ),
    );
  }
}
