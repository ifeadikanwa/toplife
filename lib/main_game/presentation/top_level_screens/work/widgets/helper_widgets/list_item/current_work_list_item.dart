import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/work/widgets/helper_widgets/work_bar.dart';

class CurrentWorkListItem extends StatelessWidget {
  final String workTitle;
  final int performance;
  const CurrentWorkListItem({Key? key, required this.workTitle, required this.performance})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: listVerticalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            workTitle,
            style: primaryTextStyle,
          ),
          const AddVerticalSpace(height: 4.0),
          WorkBar(performance: performance),
          const AddVerticalSpace(height: listVerticalPadding),
          listDivider,
        ],
      ),
    );
  }
}
