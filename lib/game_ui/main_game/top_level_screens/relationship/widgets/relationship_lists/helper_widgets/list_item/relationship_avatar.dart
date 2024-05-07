import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/avatar/avatar_widget.dart';

class RelationshipAvatar extends StatelessWidget {
  final String avatarImagePath;

  const RelationshipAvatar({super.key, required this.avatarImagePath});

  @override
  Widget build(BuildContext context) {
    return AvatarWidget(
      avatarSize: 45,
      imagePath: avatarImagePath,
    );
  }
}
