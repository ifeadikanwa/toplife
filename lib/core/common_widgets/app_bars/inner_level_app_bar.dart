import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/app_bars/level_app_bar.dart';

class InnerLevelAppBar extends StatelessWidget {
  final String title;
  final IconButton? leading;
  final List<IconButton>? actions;

  const InnerLevelAppBar({
    super.key,
    required this.title,
    this.leading,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return LevelAppBar(
      title: title,
      leading: leading ?? backButton(context),
      actions: actions,
    );
  }
}

IconButton backButton(BuildContext context) {
  return IconButton(
    icon: const Icon(Icons.arrow_back_outlined),
    onPressed: () => AutoRouter.of(context).popForced(),
  );
}
