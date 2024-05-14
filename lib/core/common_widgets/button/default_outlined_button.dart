import 'package:flutter/material.dart';

class DefaultOutlinedButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final bool keepOriginalLetterCase;

  const DefaultOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.keepOriginalLetterCase = false,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(
        (keepOriginalLetterCase) ? text : text.toUpperCase(),
      ),
    );
  }
}
