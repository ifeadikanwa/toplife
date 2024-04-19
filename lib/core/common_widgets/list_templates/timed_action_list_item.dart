import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/list_templates/case/clickable_general_list_item_case.dart';
import 'package:toplife/core/common_widgets/list_templates/helper_widgets/action_icon.dart';
import 'package:toplife/core/common_widgets/list_templates/helper_widgets/action_text.dart';
import 'package:toplife/core/common_widgets/spaces/add_horizontal_space.dart';
import 'package:toplife/core/common_widgets/time/label_time.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';

class TimedActionListItem extends StatelessWidget {
  final IconData? icon;
  final String actionTitle;
  final String actionDescription;
  final int timeInMinutes;
  final void Function() onTap;
  final bool hasDivider;

  const TimedActionListItem({
    super.key,
    this.icon,
    required this.actionTitle,
    required this.actionDescription,
    required this.timeInMinutes,
    required this.hasDivider,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClickableGeneralListItemCase(
      onTap: onTap,
      hasDivider: hasDivider,
      content: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ActionIcon(
              icon: icon,
            ),
            Expanded(
              child: ActionText(
                actionTitle: actionTitle,
                actionDescription: actionDescription,
              ),
            ),
            const AddHorizontalSpace(width: horizontalWidgetSpacing),
            LabelTime(timeInMinutes: timeInMinutes),
          ],
        )
      ],
    );
  }
}
