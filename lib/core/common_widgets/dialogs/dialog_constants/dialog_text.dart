import 'package:flutter/material.dart';

class DialogText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const DialogText({Key? key, required this.text, this.style}) : super(key: key);

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
