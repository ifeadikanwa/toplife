import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final double avatarSize;
  final String imagePath;
  const Avatar({
    Key? key,
    required this.avatarSize,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(avatarSize / 2),
      child: Image.asset(
        imagePath,
        height: avatarSize,
        width: avatarSize,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
