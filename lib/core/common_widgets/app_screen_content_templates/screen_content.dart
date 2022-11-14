import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';

class ScreenContent extends StatelessWidget {
  final Widget content;
  const ScreenContent({Key? key, required this.content}) : super(key: key);

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
