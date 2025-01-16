import 'package:flutter/material.dart';

class FlagWidget extends StatelessWidget {
  final String imagePath;
  final double flagSize;
  const FlagWidget({
    super.key,
    required this.imagePath,
    this.flagSize = 15.0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(flagSize / 2),
      child: Image.asset(
        imagePath,
        height: flagSize,
        width: flagSize,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
