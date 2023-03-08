import 'package:flutter/material.dart';

class EmptyRelationshipListScreen extends StatelessWidget {
  const EmptyRelationshipListScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Icon(
          Icons.group_off_outlined,
          size: 50,
        ),
      ],
    );
  }
}
