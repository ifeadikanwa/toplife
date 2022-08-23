import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/app_templates/screen_content.dart';

//this exists because relationship screens should take in ONLY listview as the screen content.
//this is a way to ensure that restriction.
class RelationshipListScreen extends StatelessWidget {
  final ListView listView;
  const RelationshipListScreen({
    Key? key,
    required this.listView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenContent(content: listView);
  }
}
