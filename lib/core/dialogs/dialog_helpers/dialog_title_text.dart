import 'package:flutter/material.dart';

class DialogTitleText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const DialogTitleText({super.key, required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: style?.copyWith(fontFamily: 'ThickPixel') ??
          const TextStyle(
            fontWeight: FontWeight.w700,
          ),
      textAlign: TextAlign.center,
      softWrap: true,
    );
  }
}
