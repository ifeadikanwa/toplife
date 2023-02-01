import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/app_bars/plain_icon_button.dart';

class EditableQuantity extends StatelessWidget {
  final String text;
  final Function() onIncrease;
  final Function() onDecrease;

  const EditableQuantity({
    Key? key,
    required this.text,
    required this.onIncrease,
    required this.onDecrease,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PlainIconButton(
          onPressed: onDecrease,
          icon: const Icon(Icons.remove),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(text),
        ),
        PlainIconButton(
          onPressed: onIncrease,
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
