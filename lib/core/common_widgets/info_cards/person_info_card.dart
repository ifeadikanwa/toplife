import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/avatar/avatar_widget.dart';
import 'package:toplife/core/common_widgets/avatar/avatar_with_flag.dart';
import 'package:toplife/core/common_widgets/divider/themed_divider.dart';
import 'package:toplife/core/common_widgets/spaces/add_horizontal_space.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/common_widgets/stats/multiple_stats_widget.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/utils/extensions/string_extensions.dart';
import 'package:toplife/core/utils/stats/stats_item.dart';
import 'package:toplife/core/utils/words/string_pair.dart';
import 'package:toplife/game_systems/main_systems/system_person/util/get_fullname_string.dart';

class PersonInfoCard extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String age;
  final List<StringPair> extraInformation;
  final String? currentCountry;
  final List<StatsItem> statsList;
  final bool showInfoButton;

  const PersonInfoCard({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.extraInformation,
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
            right: 0,
            top: 0,
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
    required List<StringPair> extraInformation,
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
    required List<StringPair> extraInformation,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              getFullNameString(
                firstName: firstName,
                lastName: lastName,
              ).prepareTextToEllipsize(),
              overflow: TextOverflow.ellipsis,
              style: largeCardPrimaryTextStyle,
            ),
            const AddVerticalSpace(height: 2.0),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: TextConstants.ageSemiColonSpace,
                    style: largeCardSecondaryTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: age,
                    style: largeCardSecondaryTextStyle,
                  ),
                ],
              ),
            ),
            ...extraInformation.map(
              (infoPair) => Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: infoPair.first,
                      style: largeCardSecondaryTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: infoPair.second,
                      style: largeCardSecondaryTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget moreInfo(bool showInfoButton) {
    return (showInfoButton)
        ? IconButton(
            icon: const Icon(
              Icons.info_outline,
            ),
            iconSize: cardInfoButtonSize,
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
