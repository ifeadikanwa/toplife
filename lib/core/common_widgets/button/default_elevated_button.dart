import 'package:flutter/material.dart';

class DefaultElevatedButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const DefaultElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text.toUpperCase(),
      ),
    );
  }
}
