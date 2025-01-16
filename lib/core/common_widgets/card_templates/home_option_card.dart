import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/card_templates/border_card.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';

class HomeOptionCard extends StatelessWidget {
  final IconData iconData;
  final String optionName;
  final void Function() onTap;

  const HomeOptionCard({
    super.key,
    required this.iconData,
    required this.optionName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: cardPadding),
        child: BorderCard(
          blendBorderWithBackground: true,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  iconData,
                  color: (appTheme.brightness == Brightness.light)
                      ? Colors.black
                      : Colors.white.withOpacity(whiteColorOpacityAdjustment),
                ),
                const AddVerticalSpace(height: 2.0),
                Text(
                  optionName,
                  style: cardSecondaryTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: (appTheme.brightness == Brightness.light)
                        ? Colors.black
                        : Colors.white.withOpacity(whiteColorOpacityAdjustment),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
