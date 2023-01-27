import 'package:flutter/material.dart';

class DescriptorRow extends StatelessWidget {
  final String descriptor;
  final String value;
  const DescriptorRow({
    Key? key,
    required this.descriptor,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(descriptor),
        Text(value),
      ],
    );
  }
}
