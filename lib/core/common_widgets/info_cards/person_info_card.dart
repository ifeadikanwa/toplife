import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/app_bars/plain_icon_button.dart';
import 'package:toplife/core/common_widgets/avatar/avatar_widget.dart';
import 'package:toplife/core/common_widgets/avatar/avatar_with_flag.dart';
import 'package:toplife/core/common_widgets/divider/themed_divider.dart';
import 'package:toplife/core/common_widgets/spaces/add_horizontal_space.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/common_widgets/stats/multiple_stats_widget.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/utils/extensions/string_extensions.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/stats_item.dart';

class PersonInfoCard extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String age;
  final String? extraInformation;
  final String? currentCountry;
  final List<StatsItem> statsList;
  final bool showInfoButton;
  const PersonInfoCard({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.age,
    this.extraInformation,
    required this.currentCountry,
    required this.statsList,
    this.showInfoButton = true,
  });

  @override
  Widget build(BuildContext context) {
    const double widgetSpacing = 8.0;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: widgetSpacing),
      child: Stack(
        children: [
          Column(
            children: [
              personInfo(
                firstName: firstName,
                lastName: lastName,
                age: age,
                extraInformation: extraInformation,
                currentCountry: currentCountry,
              ),
              const AddVerticalSpace(height: widgetSpacing),
              allStats(statsList),
              const AddVerticalSpace(height: widgetSpacing),
              const ThemedDivider(
                thickness: appBarLineThickness,
              ),
            ],
          ),
          Positioned(
            right: 4,
            top: 4,
            child: moreInfo(showInfoButton),
          ),
        ],
      ),
    );
  }

  Widget personInfo({
    required String firstName,
    required String lastName,
    required String age,
    required String? extraInformation,
    required String? currentCountry,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        faceAndFlag(currentCountry: currentCountry),
        basicInfo(
          firstName: firstName,
          lastName: lastName,
          age: age,
          extraInformation: extraInformation,
        ),
        const AddHorizontalSpace(width: horizontalWidgetSpacing),
      ],
    );
  }

  Widget faceAndFlag({required String? currentCountry}) {
    const avatarImagePath = "assets/images/blank_male_2.png";
    const flagImagePath = "assets/images/us_flag.png";
    const avatarSize = 60.0;

    return (currentCountry != null)
        ? const AvatarWithFlag(
            avatarSize: avatarSize,
            avatarImagePath: avatarImagePath,
            flagImagePath: flagImagePath,
          )
        : const AvatarWidget(
            avatarSize: avatarSize,
            imagePath: avatarImagePath,
          );
  }

  Widget basicInfo({
    required String firstName,
    required String lastName,
    required String age,
    required String? extraInformation,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$firstName $lastName".prepareTextToEllipsize(),
              overflow: TextOverflow.ellipsis,
              style: largeCardPrimaryTextStyle,
            ),
            const AddVerticalSpace(height: 2.0),
            Text(
              age,
              style: largeCardSecondaryTextStyle,
            ),
            (extraInformation != null)
                ? Text(
                    extraInformation,
                    style: largeCardSecondaryTextStyle,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget moreInfo(bool showInfoButton) {
    return (showInfoButton)
        ? PlainIconButton(
            icon: const Icon(
              Icons.info_outline,
              size: cardInfoButtonSize,
            ),
            onPressed: () {},
          )
        : const SizedBox();
  }

  Widget allStats(List<StatsItem> statsList) {
    return MultipleStatsWidget(
      statsList: statsList,
    );
  }
}
