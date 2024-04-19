import 'package:flutter/material.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';

class DialogContainer extends StatelessWidget {
  final Widget? title;
  final List<Widget>? children;

  const DialogContainer({
    super.key,
    this.title,
    this.children,
  });

  //persistent dialogs that want to give the player an option to exit the dialog should just be dismissable dialogs.
  //If we are consistently making required dialogs persistent and optional dialogs dismissable,
  //then the player will know that is they can't close the dialog by clicing outside the box, then their input is mandatory

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);

    return SimpleDialog(
      backgroundColor: appTheme.cardTheme.color,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: appTheme.colorScheme.tertiary,
          width: DialogConstants.borderWidth,
        ),
        borderRadius: BorderRadius.circular(DialogConstants.borderRadius),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: DialogConstants.horizontalContentPadding,
        vertical: DialogConstants.verticalContentPadding,
      ),
      title: title,
      children: [
        ...?children,
      ],
    );
  }
}
