import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/list_templates/action_list_item.dart';

class InteractionListItem extends StatelessWidget {
  final IconData? icon;
  final String interactionTitle;
  final String interactionDescription;
  final void Function() onTap;

  const InteractionListItem({
    Key? key,
    this.icon,
    required this.interactionTitle,
    required this.interactionDescription,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionListItem(
      actionTitle: interactionTitle,
      actionDescription: interactionDescription,
      onTap: onTap,
      icon: icon,
      hasArrow: false,
      hasDivider: false,
    );
  }
}
