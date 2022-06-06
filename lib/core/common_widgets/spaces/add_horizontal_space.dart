import 'package:flutter/material.dart';

class AddHorizontalSpace extends StatelessWidget {
  final double width;
  const AddHorizontalSpace({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}