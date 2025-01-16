import 'package:flutter/material.dart';

class AddHorizontalSpace extends StatelessWidget {
  final double width;
  const AddHorizontalSpace({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}