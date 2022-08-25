import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/app_bars/plain_icon_button.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/utils/extensions/string_extensions.dart';

class InnerLevelAppBar extends StatelessWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  const InnerLevelAppBar({
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
          Row(
            children: [
              leading ?? backButton(),
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: (actions != null)
                        ? const EdgeInsets.only(left: defaultIconSize)
                        : const EdgeInsets.only(left: appSidePadding),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Center(
                        child: Text(
                          title.prepareTextToEllipsize().toUpperCase(),
                          overflow: TextOverflow.ellipsis,
                          style: appBarTextStyle,
                        ),
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

Widget backButton() {
  return PlainIconButton(
    icon: const Icon(Icons.arrow_back_outlined),
    onPressed: () {},
  );
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
