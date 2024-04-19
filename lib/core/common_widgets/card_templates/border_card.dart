import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';

class BorderCard extends StatelessWidget {
  final List<Widget> children;
  const BorderCard({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);

    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: (appTheme.brightness == Brightness.light) ? Colors.black : Colors.white,
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(cardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ...children,
          ],
        ),
      ),
    );
  }
}
