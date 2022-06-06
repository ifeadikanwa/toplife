import 'package:flutter/material.dart';
import 'package:toplife/config/theme/colors.dart';
import 'package:toplife/core/common_widgets/constants.dart';

class HomeOptionCard extends StatelessWidget {
  final IconData iconData;
  final String optionName;
  const HomeOptionCard(
      {Key? key, required this.iconData, required this.optionName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: brightPurple,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(cardPadding),
        child: Column(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(iconData, color: Colors.white),
            ),
            Text(
              optionName,
              style: cardSecondaryTextStyle.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
