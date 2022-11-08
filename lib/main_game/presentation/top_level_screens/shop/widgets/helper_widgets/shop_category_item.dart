import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';

class ShopCategoryItem extends StatelessWidget {
  final IconData icon;
  final String categoryTitle;
  final void Function() onTap;
  const ShopCategoryItem({
    Key? key,
    required this.icon,
    required this.categoryTitle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: appTheme.colorScheme.tertiary,
            width: 2.0,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: shopCategoryIconSize,
            ),
            const AddVerticalSpace(height: 8.0),
            Text(
              categoryTitle,
              softWrap: true,
              maxLines: 2,
              style: primaryTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
