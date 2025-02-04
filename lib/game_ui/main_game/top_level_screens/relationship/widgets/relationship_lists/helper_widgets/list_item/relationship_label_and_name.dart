import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/utils/extensions/string_extensions.dart';

class RelationshipLabelAndName extends StatelessWidget {
  final String relationshipLabel;
  final String name;

  const RelationshipLabelAndName({
    super.key,
    required this.relationshipLabel,
    required this.name,
  });

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
          name.prepareTextToEllipsize(),
          style: primaryTextStyle,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
