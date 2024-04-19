import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';

class AvatarWidget extends StatelessWidget {
  final double avatarSize;
  final String imagePath;
  const AvatarWidget({
    super.key,
    this.avatarSize = defaultAvatarSize,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    //images have transparent background so a border radius is unnecessary
    return ClipRRect(
      // borderRadius: BorderRadius.circular(avatarSize / 2),
      child: Image.asset(
        imagePath,
        height: avatarSize,
        width: avatarSize,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
