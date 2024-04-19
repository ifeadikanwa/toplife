import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';

class ElevatedCard extends StatelessWidget {
  final List<Widget> children;
  const ElevatedCard({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      shape: RoundedRectangleBorder(
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
