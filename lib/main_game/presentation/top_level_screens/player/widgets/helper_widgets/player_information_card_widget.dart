import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/app_bars/plain_icon_button.dart';
import 'package:toplife/core/common_widgets/avatar/avatar_with_flag.dart';
import 'package:toplife/core/common_widgets/card_templates/border_card.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/common_widgets/spaces/add_horizontal_space.dart';
import 'package:toplife/core/common_widgets/stats/multiple_stats_widget.dart';
import 'package:toplife/main_systems/system_person/domain/model/helpers/stats_item.dart';
import 'package:toplife/core/utils/extensions/string_extensions.dart';

class PlayerInformationCard extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String age;
  final String jobTitle;
  final String avatarImagePath;
  final String flagImagePath;
  const PlayerInformationCard({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.jobTitle,
    required this.avatarImagePath,
    required this.flagImagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);

    return Stack(
      children: [
        BorderCard(
          children: [
            playerInfo(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(
                height: 0.5,
                color: (appTheme.brightness == Brightness.light)
                    ? Colors.black
                    : Colors.white,
              ),
            ),
            allStats(),
          ],
        ),
        Positioned(
          right: 4,
          top: 4,
          child: moreInfo(),
        ),
      ],
    );
  }

  Widget playerInfo() {
    return Row(
      children: [
        faceAndFlag(),
        basicInfo(),
        const AddHorizontalSpace(width: horizontalTextSpacing),
      ],
    );
  }

  Widget faceAndFlag() {
    return AvatarWithFlag(
      avatarSize: 50,
      avatarImagePath: avatarImagePath,
      flagImagePath: flagImagePath,
    );
  }

  Widget basicInfo() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$firstName $lastName".prepareTextToEllipsize(),
              overflow: TextOverflow.ellipsis,
              style: headerTextStyle,
            ),
            const AddHorizontalSpace(width: 4.0),
            Text(
              age,
              style: cardSecondaryTextStyle,
            ),
            Text(
              jobTitle,
              style: cardSecondaryTextStyle,
            ),
          ],
        ),
      ),
    );
  }

  Widget moreInfo() {
    return PlainIconButton(
      icon: const Icon(
        Icons.info_outline,
        size: cardInfoButtonSize,
      ),
      onPressed: () {},
    );
  }

  Widget allStats() {
    return const MultipleStatsWidget(
      statsList: [
        StatsItem(statsName: "ENERGY", statsLevel: 80),
        StatsItem(statsName: "HUNGER", statsLevel: 30),
        StatsItem(statsName: "WELLBEING", statsLevel: 99),
      ],
    );
  }

  // List<Widget> statsList() {
  //   return const [
  //     StatsItem(
  //       statName: "ENERGY",
  //       progressValue: 80,
  //     ),
  //     StatsItem(
  //       statName: "HUNGER",
  //       progressValue: 20,
  //     ),
  //     StatsItem(
  //       statName: "WELLBEING",
  //       progressValue: 100,
  //     ),
  //   ];
  // }
}
