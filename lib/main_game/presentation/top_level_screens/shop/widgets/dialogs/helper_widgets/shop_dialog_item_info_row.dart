import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/spaces/add_horizontal_space.dart';

class ShopDialogItemInfoRow extends StatelessWidget {
  final String title;
  final String subtitle1;
  final String? subtitle2;

  const ShopDialogItemInfoRow({
    Key? key,
    required this.title,
    required this.subtitle1,
    required this.subtitle2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          "assets/images/baby_food.jpg",
          height: 40,
          width: 40,
        ),
        const AddHorizontalSpace(width: 8.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              subtitle1,
            ),
            (subtitle2 != null)
                ? Text(
                    subtitle2!,
                  )
                : const SizedBox(),
          ],
        )
      ],
    );
  }
}
