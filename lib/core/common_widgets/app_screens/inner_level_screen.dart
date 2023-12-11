import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/app_bars/inner_level_app_bar.dart';
import 'package:toplife/core/common_widgets/app_screens/active_player_status_bar.dart';

class InnerLevelScreen extends StatelessWidget {
  final String title;
  final IconButton? appBarLeading;
  final List<IconButton>? appBarActions;
  final Widget child;
  const InnerLevelScreen({
    Key? key,
    required this.title,
    required this.child,
    this.appBarLeading,
    this.appBarActions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ActivePlayerStatusBar(),
        InnerLevelAppBar(
          title: title,
          leading: appBarLeading,
          actions: appBarActions,
        ),
        child,
      ],
    );
  }
}
