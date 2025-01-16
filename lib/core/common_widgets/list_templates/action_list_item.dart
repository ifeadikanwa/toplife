import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/list_templates/case/clickable_general_list_item_case.dart';
import 'package:toplife/core/common_widgets/list_templates/helper_widgets/action_icon.dart';
import 'package:toplife/core/common_widgets/list_templates/helper_widgets/action_text.dart';
import 'package:toplife/core/common_widgets/list_templates/helper_widgets/open_forward_arrow.dart';

class ActionListItem extends StatelessWidget {
  final IconData? icon;
  final String actionTitle;
  final String actionDescription;
  final bool hasDivider;
  final bool hasArrow;
  final void Function() onTap;

  const ActionListItem({
    super.key,
    this.icon,
    required this.actionTitle,
    required this.actionDescription,
    this.hasDivider = true,
    this.hasArrow = true,
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
            Expanded(
              child: Row(
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
                ],
              ),
            ),
            (hasArrow) ? const OpenForwardArrow() : const SizedBox(),
          ],
        ),
      ],
    );
  }
}
