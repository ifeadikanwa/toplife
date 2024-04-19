import 'package:flutter/material.dart';

class EmptyShopListScreen extends StatelessWidget {
  const EmptyShopListScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.remove_shopping_cart_outlined,
          size: 50,
        ),
      ],
    );
  }
}
