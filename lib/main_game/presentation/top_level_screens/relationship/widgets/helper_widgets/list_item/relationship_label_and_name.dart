import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';

class RelationshipLabelAndName extends StatelessWidget {
  final String relationshipLabel;
  final String name;

  const RelationshipLabelAndName({
    Key? key,
    required this.relationshipLabel,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          relationshipLabel,
          style: relationshipLabelTextStyle,
        ),
        Text(
          name,
          style: relationshipNameTextStyle,
        ),
      ],
    );
  }
}
