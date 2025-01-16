import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/card_templates/border_card.dart';
import 'package:toplife/core/common_widgets/spaces/add_horizontal_space.dart';
import 'package:toplife/core/common_widgets/time/label_time.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';

class QuickActionListItem extends StatelessWidget {
  final String quickActionTitle;
  final int timeInMinutes;
  final IconData icon;
  final bool addPlusToTime;
  final void Function() onTap;

  const QuickActionListItem({
    super.key,
    required this.timeInMinutes,
    required this.onTap,
    required this.quickActionTitle,
    required this.icon,
    this.addPlusToTime = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: BorderCard(children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Icon(
                      icon,
                    ),
                    const AddHorizontalSpace(width: 4.0),
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          quickActionTitle,
                          style: primaryTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              LabelTime(
                timeInMinutes: timeInMinutes,
                addPlus: addPlusToTime,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
