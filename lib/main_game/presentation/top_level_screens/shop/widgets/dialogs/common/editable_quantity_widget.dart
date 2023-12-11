import 'package:flutter/material.dart';

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
        IconButton(
          onPressed: onDecrease,
          icon: const Icon(Icons.remove),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(text),
        ),
        IconButton(
          onPressed: onIncrease,
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
