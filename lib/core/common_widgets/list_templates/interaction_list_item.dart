import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/list_templates/timed_action_list_item.dart';

class InteractionListItem extends StatelessWidget {
  final IconData? icon;
  final String interactionTitle;
  final String interactionDescription;
  final int timeInMinutes;
  final void Function() onTap;

  const InteractionListItem({
    super.key,
    this.icon,
    required this.interactionTitle,
    required this.interactionDescription,
    required this.timeInMinutes,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TimedActionListItem(
      icon: icon,
      actionTitle: interactionTitle,
      actionDescription: interactionDescription,
      timeInMinutes: timeInMinutes,
      onTap: onTap,
      hasDivider: false,
    );
  }
}
