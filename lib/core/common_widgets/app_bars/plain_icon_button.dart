import 'package:flutter/material.dart';

class PlainIconButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget icon;
  const PlainIconButton({Key? key, this.onPressed, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      onPressed: onPressed,
      icon: icon,
    );
  }
}
