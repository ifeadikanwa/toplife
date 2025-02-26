import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/utils/extensions/string_extensions.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/work/widgets/helper_widgets/work_bar.dart';

class WorkTitleAndPerformance extends StatelessWidget {
  final String workTitle;
  final int performance;
  const WorkTitleAndPerformance(
      {super.key, required this.workTitle, required this.performance});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          workTitle.prepareTextToEllipsize(),
          overflow: TextOverflow.ellipsis,
          style: primaryTextStyle,
        ),
        const AddVerticalSpace(height: 4.0),
        WorkBar(performance: performance),
      ],
    );
  }
}
