import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';

class ActionText extends StatelessWidget {
  final String actionTitle;
  final String actionDescription;
  final String? anotherActionDescription;
  final bool disabled;

  const ActionText({
    Key? key,
    required this.actionTitle,
    required this.actionDescription,
    this.anotherActionDescription,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);

    final textColor =
        (appTheme.brightness == Brightness.light) ? Colors.black : Colors.white;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            actionTitle,
            style: primaryTextStyle.copyWith(
              color: (disabled)
                  ? textColor.withOpacity(
                      0.5,
                    )
                  : null,
            ),
          ),
        ),
        const AddVerticalSpace(height: 6.0),
        FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Text(
            actionDescription,
            style: secondaryTextStyle.copyWith(
              color: (disabled)
                  ? textColor.withOpacity(
                      0.5,
                    )
                  : null,
            ),
          ),
        ),
        (anotherActionDescription != null)
            ? Column(
                children: [
                  const AddVerticalSpace(height: 6.0),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      anotherActionDescription!,
                      style: secondaryTextStyle.copyWith(
                        color: (disabled)
                            ? textColor.withOpacity(
                                0.5,
                              )
                            : null,
                      ),
                    ),
                  ),
                ],
              )
            : const SizedBox(),
      ],
    );
  }
}
