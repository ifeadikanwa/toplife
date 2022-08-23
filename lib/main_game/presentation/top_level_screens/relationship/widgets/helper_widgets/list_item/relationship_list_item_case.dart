import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';

class RelationshipListItemCase extends StatelessWidget {
  final Row content;
  const RelationshipListItemCase({Key? key, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: listVerticalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          content,
        ],
      ),
    );
  }
}
