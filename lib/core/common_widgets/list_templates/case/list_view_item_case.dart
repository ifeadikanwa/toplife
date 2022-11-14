import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';

class ListViewItemCase extends StatelessWidget {
  final Row content;
  final void Function() onTap;

  const ListViewItemCase({
    Key? key,
    required this.content,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: listVerticalPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            content,
          ],
        ),
      ),
    );
  }
}
