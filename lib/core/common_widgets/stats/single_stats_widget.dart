import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/constants.dart';
import 'package:toplife/core/common_widgets/progress_bar/progress_bar.dart';
import 'package:toplife/core/common_widgets/spaces/add_horizontal_space.dart';

class SingleStatsWidget extends StatelessWidget {
  final String statsName;
  final int statsValue;

  const SingleStatsWidget({
    Key? key,
    required this.statsValue,
    required this.statsName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
           Text(
            statsName,
            style: largeStatsTextStyle,
          ),
          const AddHorizontalSpace(
            width: textAndProgressBarSpacing,
          ),
          Expanded(
            child: ProgressBar(
              progressValue: statsValue,
              minHeight: smallMinHeight,
              showProgressValue: false,
            ),
          ),
        ],
      ),
    );
  }
}
