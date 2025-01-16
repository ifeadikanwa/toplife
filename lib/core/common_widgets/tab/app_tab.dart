import 'package:flutter/material.dart';

class AppTab extends StatelessWidget {
  final String text;
  const AppTab({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Tab(
      text: text.toUpperCase(),
    );
  }
}
