import 'package:flutter/material.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';

Future<T?> showPersistentDialog<T>({
  required BuildContext context,
  required Widget child,
}) {
  return showDialog<T>(
      context: context,
      barrierDismissible: false,
      barrierColor: DialogConstants.barrierColor,
      builder: (context) {
        return PopScope(
          canPop: false,
          child: child,
        );
      });
}
