import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/list_templates/case/clickable_general_list_item_case.dart';
import 'package:toplife/core/common_widgets/list_templates/helper_widgets/open_forward_arrow.dart';
import 'package:toplife/core/common_widgets/spaces/add_horizontal_space.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/work/widgets/helper_widgets/list_item/work_title_and_performance.dart';

class CurrentWorkListItem extends StatelessWidget {
  final String workTitle;
  final int performance;
  final void Function() onTap;
  const CurrentWorkListItem({
    Key? key,
    required this.workTitle,
    required this.performance,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClickableGeneralListItemCase(
      onTap: onTap,
      content: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: WorkTitleAndPerformance(
                workTitle: workTitle,
                performance: performance,
              ),
            ),
            const AddHorizontalSpace(width: horizontalWidgetSpacing),
            const OpenForwardArrow(),
          ],
        ),
      ],
    );
  }
}
