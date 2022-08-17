import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';

class MoneyAndTimeCard extends StatelessWidget {
  

  final String currency;
  final String bankBalance;
  final String time;
  final String dayNumber;

  const MoneyAndTimeCard({Key? key, required this.currency, required this.bankBalance, required this.time, required this.dayNumber,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(cardPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$currency$bankBalance",
                style: headerTextStyle.copyWith(color: Colors.green),
              ),
              const AddVerticalSpace(height: verticalTextSpacing),
              const Text(
                "Bank balance",
                style: cardSecondaryTextStyle,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                time,
                style: headerTextStyle,
              ),
              const AddVerticalSpace(height: verticalTextSpacing),
              Text(
                "Day $dayNumber",
                style: cardSecondaryTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
