import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/button/app_icon_button.dart';

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
        appIconButton(
          smallIconButton: true,
          onPressed: onDecrease,
          icon: const Icon(Icons.remove),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(text),
        ),
        appIconButton(
          smallIconButton: true,
          onPressed: onIncrease,
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
