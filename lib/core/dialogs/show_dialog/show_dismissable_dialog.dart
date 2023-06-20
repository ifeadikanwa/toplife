import 'package:flutter/material.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';

Future<T?> showDismissableDialog<T>({
  required BuildContext context,
  required Widget child,
}) {
  return showDialog<T>(
    context: context,
    barrierDismissible: true,
    barrierColor: DialogConstants.barrierColor,
    builder: (context) => child,
  );
}
