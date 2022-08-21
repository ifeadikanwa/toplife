import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/avatar/avatar_widget.dart';

class RelationshipAvatar extends StatelessWidget {
  final String avatarImagePath;
  
  const RelationshipAvatar({Key? key, required this.avatarImagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Avatar(
      avatarSize: 40,
      imagePath: avatarImagePath,
    );
  }
}