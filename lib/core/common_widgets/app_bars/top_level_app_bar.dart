import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/common_widgets/spaces/add_horizontal_space.dart';

class TopLevelAppBar extends StatelessWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;

  const TopLevelAppBar({
    Key? key,
    required this.title,
    this.leading,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: appSidePadding,
        vertical: appBarVerticalPadding,
      ),
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: (appTheme.brightness == Brightness.dark)
              ? const BorderSide(color: Colors.white)
              : const BorderSide(),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                leading ?? const AddHorizontalSpace(width: 0),
                leading == null
                    ? const AddHorizontalSpace(width: 0)
                    : const AddHorizontalSpace(width: appSidePadding),
                Expanded(
                  child: FittedBox(
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.scaleDown,
                    child: Text(
                      title.toUpperCase(),
                      overflow: TextOverflow.ellipsis,
                      style: appBarTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              ...?leftPadEachAction(actions),
            ],
          ),
        ],
      ),
    );
  }
}

List<Widget>? leftPadEachAction(List<Widget>? actions) {
  if (actions != null) {
    return actions
        .map(
          (action) => Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: action,
          ),
        )
        .toList();
  } else {
    return null;
  }
}
