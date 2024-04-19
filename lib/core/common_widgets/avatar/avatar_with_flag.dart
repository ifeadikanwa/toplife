import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/avatar/avatar_widget.dart';
import 'package:toplife/core/common_widgets/avatar/flag_widget.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';

class AvatarWithFlag extends StatelessWidget {
  final double avatarSize;
  final double flagSize;
  final String avatarImagePath;
  final String flagImagePath;

  const AvatarWithFlag({
    super.key,
    this.avatarSize = defaultAvatarSize,
    this.flagSize = 15.0,
    required this.avatarImagePath,
    required this.flagImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          child: AvatarWidget(
            avatarSize: avatarSize,
            imagePath: avatarImagePath,
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomLeft,
            child: FlagWidget(
              flagSize: flagSize,
              imagePath: flagImagePath,
            ),
          ),
        ),
      ],
    );
  }
}
