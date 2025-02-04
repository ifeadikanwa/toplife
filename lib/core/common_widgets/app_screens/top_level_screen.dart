import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/app_bars/top_level_app_bar.dart';
import 'package:toplife/core/common_widgets/app_screens/active_player_status_bar.dart';

class TopLevelScreen extends StatelessWidget {
  final String title;
  final Widget child;
  const TopLevelScreen({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ActivePlayerStatusBar(),
        TopLevelAppBar(title: title),
        child,
      ],
    );
  }
}
