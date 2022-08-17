import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';

class ScreenContent extends StatelessWidget {
  final List<Widget> children;
  const ScreenContent({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: appSidePadding,
        vertical: widgetVerticalSpacing,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...children,
        ],
      ),
    ));
  }
}
