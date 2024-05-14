import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/common_widgets/spaces/add_horizontal_space.dart';
import 'package:toplife/core/utils/extensions/string_extensions.dart';

class LevelAppBar extends StatelessWidget {
  final String title;
  final IconButton? leading;
  final List<IconButton>? actions;

  const LevelAppBar({
    super.key,
    required this.title,
    this.leading,
    this.actions,
  });

//icon buttons come with irremovable padding, so we have to account for that when adding our padding

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Container(
      padding: EdgeInsets.only(
        //vertical
        top: (leading != null || actions != null) ? 0 : appBarVerticalPadding,
        bottom:
            (leading != null || actions != null) ? 0 : appBarVerticalPadding,
        //horizontal
        left: (leading != null) ? (appSidePadding / 2) : appSidePadding,
        right: (actions != null) ? (appSidePadding / 2) : appSidePadding,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                leading ?? const SizedBox(),
                leading == null
                    ? const SizedBox()
                    : const AddHorizontalSpace(width: appSidePadding / 2),
                Expanded(
                  child: FittedBox(
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.scaleDown,
                    child: Text(
                      title.prepareTextToEllipsize().toUpperCase(),
                      overflow: TextOverflow.ellipsis,
                      style: appBarTextStyle.copyWith(
                        color: appTheme.colorScheme.tertiary,
                      ),
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
            padding: const EdgeInsets.only(left: defaultIconSize),
            child: action,
          ),
        )
        .toList();
  } else {
    return null;
  }
}
