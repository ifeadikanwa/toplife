import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';

class RelationshipListScreen extends StatelessWidget {
  final ListView listView;
  const RelationshipListScreen({
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
