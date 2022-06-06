import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/avatar/avatar_widget.dart';
import 'package:toplife/core/common_widgets/avatar/flag_widget.dart';

class AvatarWithFlag extends StatelessWidget {
  final double avatarSize;
  final double flagSize;
  final String avatarImagePath;
  final String flagImagePath;

  const AvatarWithFlag({
    Key? key,
    this.avatarSize = 40.0,
    this.flagSize = 15.0,
    required this.avatarImagePath,
    required this.flagImagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          child: Avatar(
            avatarSize: avatarSize,
            imagePath: avatarImagePath,
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Flag(
              flagSize: flagSize,
              imagePath: flagImagePath,
            ),
          ),
        ),
      ],
    );
  }
}
