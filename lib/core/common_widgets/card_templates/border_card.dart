import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/constants.dart';

class BorderCard extends StatelessWidget {
  final List<Widget> children;
  const BorderCard({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: appTheme.colorScheme.secondary,
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
