import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/constants.dart';

class SingleListScreen extends StatelessWidget {
  final ListView listView;
  const SingleListScreen({
    Key? key,
    required this.listView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: appSidePadding,
        vertical: widgetVerticalSpacing,
      ),
      child: listView,
    );
  }
}
