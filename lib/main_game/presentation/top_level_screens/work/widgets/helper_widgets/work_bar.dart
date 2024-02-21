import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/stats/single_stats_widget.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/utils/stats/stats_item_builder.dart';

class WorkBar extends StatelessWidget {
  final int performance;
  const WorkBar({
    Key? key,
    required this.performance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleStatsWidget(
      statsItem: StatsItemBuilder.defaultStat(
        statsName: TextConstants.performance,
        statsLevel: performance,
      ),
      showProgressValue: false,
    );
  }
}
