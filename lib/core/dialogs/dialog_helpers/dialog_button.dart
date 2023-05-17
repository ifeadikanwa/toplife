import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

//always pops the dialog before running actions
class DialogButton extends StatelessWidget {
  final String buttonDescription;
  final void Function() action;
  const DialogButton({
    super.key,
    required this.buttonDescription,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        AutoRouter.of(context).popForced();
        action();
      },
      child: Text(
        buttonDescription,
      ),
    );
  }
}
