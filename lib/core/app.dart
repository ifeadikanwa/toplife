import 'package:flutter/material.dart';
import 'package:toplife/config/theme/app_theme.dart';
import 'package:toplife/core/common_widgets/scaffold_with_bottom_nav_bar/snake_bottom_navigation_bar.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/player/widgets/player_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TextConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkBlueTheme,
      home: const Scaffold(
        bottomNavigationBar: SnakeBottomNavigationBar(),
        body: SafeArea(
          child: PlayerScreen(),
        ),
      ),
    );
  }
}
