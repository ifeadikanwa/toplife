import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';

class HomeOptionCard extends StatelessWidget {
  final IconData iconData;
  final String optionName;
  const HomeOptionCard(
      {Key? key, required this.iconData, required this.optionName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: cardPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.purple,
              shape: BoxShape.circle,
            ),
            child: Icon(iconData, color: Colors.white),
          ),
          Text(
            optionName,
            style: cardSecondaryTextStyle.copyWith(color: Colors.purple),
          ),
        ],
      ),
    );
  }
}
