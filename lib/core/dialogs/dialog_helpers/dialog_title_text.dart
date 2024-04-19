import 'package:flutter/material.dart';

class DialogTitleText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const DialogTitleText({super.key, required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: TextAlign.center,
      softWrap: true,
    );
  }
}
