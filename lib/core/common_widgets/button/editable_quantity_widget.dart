import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/button/app_icon_button.dart';

class EditableQuantity extends StatelessWidget {
  final String text;
  final Function() onIncrease;
  final Function() onDecrease;

  const EditableQuantity({
    super.key,
    required this.text,
    required this.onIncrease,
    required this.onDecrease,
  });

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
