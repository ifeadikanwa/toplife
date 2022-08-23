import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/app_templates/screen_content.dart';

class ScrollableScreenContent extends StatelessWidget {
  final Widget content;
  const ScrollableScreenContent({Key? key, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        child: SingleChildScrollView(
          child: ScreenContent(content: content),
        ),
      ),
    );
  }
}
