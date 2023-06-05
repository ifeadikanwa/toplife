import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/stats/single_stats_widget.dart';
import 'package:toplife/core/text_constants.dart';

class RelationshipBar extends StatelessWidget {
  final int relationshipAmount;
  const RelationshipBar({
    Key? key,
    required this.relationshipAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleStatsWidget(
      statsValue: relationshipAmount,
      statsName: TextConstants.relationship,
    );
  }
}
