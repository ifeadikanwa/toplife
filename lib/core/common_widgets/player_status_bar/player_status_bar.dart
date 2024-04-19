import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/avatar/avatar_with_flag.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/common_widgets/spaces/add_horizontal_space.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/utils/extensions/string_extensions.dart';

class PlayerStatusBar extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String avatarImagePath;
  final String flagImagePath;
  final String currency;
  final String bankBalance;
  final String time;
  final String dayNumber;
  final String dayOfWeek;

  const PlayerStatusBar({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.avatarImagePath,
    required this.flagImagePath,
    required this.currency,
    required this.bankBalance,
    required this.time,
    required this.dayNumber,
    required this.dayOfWeek,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Container(
      color: appTheme.colorScheme.secondary,
      padding:
          const EdgeInsets.symmetric(vertical: 8.0, horizontal: appSidePadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                faceAndFlag(),
                const AddHorizontalSpace(width: 8.0),
                Expanded(child: nameAndBankBalance(appTheme)),
              ],
            ),
          ),
          const AddHorizontalSpace(width: horizontalWidgetSpacing),
          dayAndTime(time: time, dayNumber: dayNumber, dayOfWeek: dayOfWeek),
        ],
      ),
    );
  }

  Widget nameAndBankBalance(ThemeData appTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$firstName $lastName".prepareTextToEllipsize(),
          overflow: TextOverflow.ellipsis,
          style: headerTextStyle.copyWith(
            decoration: TextDecoration.underline,
          ),
        ),
        const AddVerticalSpace(height: verticalTextSpacing),
        Text(
          "$currency$bankBalance",
          style: TextStyle(
            color: (appTheme.brightness == Brightness.light)
                ? Colors.white
                : Colors.green,
          ),
        ),
      ],
    );
  }

  Widget dayAndTime({
    required String time,
    required String dayNumber,
    required String dayOfWeek,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          time,
          style: headerTextStyle,
        ),
        const AddVerticalSpace(height: verticalTextSpacing),
        Text("$dayOfWeek, Day $dayNumber"),
      ],
    );
  }

  Widget faceAndFlag() {
    return AvatarWithFlag(
      avatarImagePath: avatarImagePath,
      flagImagePath: flagImagePath,
    );
  }
}
