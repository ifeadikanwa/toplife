import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/list_templates/helper_widgets/action_icon.dart';
import 'package:toplife/core/common_widgets/list_templates/helper_widgets/action_text.dart';
import 'package:toplife/core/common_widgets/list_templates/case/general_list_item_case.dart';
import 'package:toplife/core/common_widgets/list_templates/helper_widgets/open_forward_arrow.dart';

class ActionListItem extends StatelessWidget {
  final IconData? icon;
  final String actionTitle;
  final String actionDescription;
  final bool hasDivider;
  final void Function() onTap;

  const ActionListItem({
    Key? key,
    this.icon,
    required this.actionTitle,
    required this.actionDescription,
    this.hasDivider = true,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GeneralListItemCase(
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
            const OpenForwardArrow(),
          ],
        ),
      ],
    );
  }
}
