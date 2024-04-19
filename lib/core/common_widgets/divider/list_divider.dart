import 'package:flutter/material.dart';

class ListDivider extends StatelessWidget {
  const ListDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Divider(
      height: 2.0,
      color: (appTheme.brightness == Brightness.light) ? Colors.black : Colors.white,
    );
  }
}
