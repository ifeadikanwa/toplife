import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/common_widgets/progress_bar/progress_bar.dart';
import 'package:toplife/core/common_widgets/spaces/add_horizontal_space.dart';
import 'package:toplife/core/utils/stats/stats_item.dart';

class SingleStatsWidget extends StatelessWidget {
  final StatsItem statsItem;
  final bool showProgressValue;

  const SingleStatsWidget({
    Key? key,
    required this.statsItem,
    required this.showProgressValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          Text(
            statsItem.statsName,
            style: statsTextStyle,
          ),
          const AddHorizontalSpace(
            width: textAndProgressBarSpacing,
          ),
          Expanded(
            child: ProgressBar(
              minHeight: smallMinHeight,
              progressValue: statsItem.statsLevel,
              progressStatsRange: statsItem.statsRange,
              positveIsAlwaysGreen: statsItem.positiveIsAlwaysGreen,
              showProgressValue: showProgressValue,
            ),
          ),
        ],
      ),
    );
  }
}
