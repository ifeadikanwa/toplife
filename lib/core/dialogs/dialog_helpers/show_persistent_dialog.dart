import 'package:flutter/material.dart';

Future<T?> showPersistentDialog<T>({
  required BuildContext context,
  required Widget child,
}) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: child,
        );
      });
}
