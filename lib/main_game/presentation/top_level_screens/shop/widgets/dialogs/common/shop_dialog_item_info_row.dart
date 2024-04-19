import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/spaces/add_horizontal_space.dart';

class ShopDialogItemInfoRow extends StatelessWidget {
  final String title;
  final String subtitle1;
  final String? subtitle2;

  const ShopDialogItemInfoRow({
    super.key,
    required this.title,
    required this.subtitle1,
    required this.subtitle2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          "assets/images/house.png",
          height: 40,
          width: 40,
        ),
        const AddHorizontalSpace(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
                softWrap: true,
              ),
              Text(
                subtitle1,
                softWrap: true,
              ),
              (subtitle2 != null)
                  ? Text(
                      subtitle2!,
                      softWrap: true,
                    )
                  : const SizedBox(),
            ],
          ),
        )
      ],
    );
  }
}
