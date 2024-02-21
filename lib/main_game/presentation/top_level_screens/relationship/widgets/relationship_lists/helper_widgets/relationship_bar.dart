import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/stats/single_stats_widget.dart';
import 'package:toplife/core/utils/stats/stats_item_builder.dart';

class RelationshipBar extends StatelessWidget {
  final int relationshipAmount;
  const RelationshipBar({
    Key? key,
    required this.relationshipAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleStatsWidget(
      statsItem: StatsItemBuilder.relationshipStat(
        relationshipAmount: relationshipAmount,
      ),
      showProgressValue: false,
    );
  }
}
