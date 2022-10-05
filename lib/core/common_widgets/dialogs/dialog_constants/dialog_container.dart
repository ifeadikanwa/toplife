import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/dialogs/dialog_constants/dialog_constants.dart';

class DialogContainer extends StatelessWidget {
  final Widget? title;
  final List<Widget>? children;

  const DialogContainer({Key? key, this.title, this.children}) : super(key: key);

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
      children: children,
    );
  }
}
