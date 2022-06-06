import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/app_bars/plain_icon_button.dart';
import 'package:toplife/core/common_widgets/constants.dart';

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
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: appSidePadding,
        vertical: innerLevelAppBarVerticalPadding,
      ),
      decoration: const BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(),
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
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: defaultIconSize),
                child: Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              ...?rightPadEachAction(actions),
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

List<Widget>? rightPadEachAction(List<Widget>? actions) {
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
