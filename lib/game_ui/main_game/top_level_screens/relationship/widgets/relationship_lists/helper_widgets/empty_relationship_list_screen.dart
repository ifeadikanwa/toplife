import 'package:flutter/material.dart';

class EmptyRelationshipListScreen extends StatelessWidget {
  const EmptyRelationshipListScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.group_off_outlined,
          size: 50,
        ),
      ],
    );
  }
}
