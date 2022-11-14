import 'package:flutter/material.dart';

class AppTab extends StatelessWidget {
  final String text;
  const AppTab({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      text: text.toUpperCase(),
    );
  }
}
