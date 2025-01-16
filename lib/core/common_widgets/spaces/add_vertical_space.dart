import 'package:flutter/material.dart';

class AddVerticalSpace extends StatelessWidget {
  final double height;
  const AddVerticalSpace({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
