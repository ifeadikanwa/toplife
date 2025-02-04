import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';

class ScreenContent extends StatelessWidget {
  final Widget content;
  const ScreenContent({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: appSidePadding,
        vertical: widgetVerticalSpacing,
      ),
      child: content,
    );
  }
}
