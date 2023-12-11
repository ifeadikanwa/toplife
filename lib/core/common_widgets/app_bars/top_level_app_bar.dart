import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/app_bars/level_app_bar.dart';

class TopLevelAppBar extends StatelessWidget {
  final String title;
  final IconButton? leading;
  final List<IconButton>? actions;

  const TopLevelAppBar({
    Key? key,
    required this.title,
    this.leading,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LevelAppBar(
      title: title,
      leading: leading,
      actions: actions,
    );
  }
}
