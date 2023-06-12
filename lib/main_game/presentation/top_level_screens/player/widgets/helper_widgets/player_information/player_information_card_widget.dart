import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/app_bars/plain_icon_button.dart';
import 'package:toplife/core/common_widgets/avatar/avatar_with_flag.dart';
import 'package:toplife/core/common_widgets/card_templates/border_card.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/common_widgets/spaces/add_horizontal_space.dart';
import 'package:toplife/core/common_widgets/stats/multiple_stats_widget.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/player/widgets/helper_widgets/player_information/player_information_card_view_model.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/player_information.dart';
import 'package:toplife/core/utils/extensions/string_extensions.dart';
import 'package:toplife/core/utils/stats/stats_item_builder.dart';

class PlayerInformationCard extends ConsumerWidget {
  const PlayerInformationCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = Theme.of(context);
    final playerInformationCarViewModel =
        ref.watch(playerInformationCardViewModelProvider);

    return playerInformationCarViewModel.when(
      data: (playerInformation) {
        return playerInformationCardWidget(
          playerInformation,
          appTheme,
        );
      },
      error: (error, stackTrace) => Container(),
      loading: () => playerInformationCardWidget(
        PlayerInformation.blankPlayerInformation,
        appTheme,
      ),
    );
  }

  Widget playerInformationCardWidget(
    PlayerInformation playerInformation,
    ThemeData appTheme,
  ) {
    return Stack(
      children: [
        BorderCard(
          children: [
            playerInfo(
              firstName: playerInformation.firstName,
              lastName: playerInformation.lastName,
              age: playerInformation.age,
              jobTitles: playerInformation.jobTitles,
              currentCountry: playerInformation.country,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(
                height: 0.5,
                color: (appTheme.brightness == Brightness.light)
                    ? Colors.black
                    : Colors.white,
              ),
            ),
            allStats(playerInformation.stats),
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

  Widget playerInfo({
    required String firstName,
    required String lastName,
    required String age,
    required String jobTitles,
    required String currentCountry,
  }) {
    return Row(
      children: [
        faceAndFlag(currentCountry: currentCountry),
        basicInfo(
            firstName: firstName,
            lastName: lastName,
            age: age,
            jobTitles: jobTitles),
        const AddHorizontalSpace(width: horizontalWidgetSpacing),
      ],
    );
  }

  Widget faceAndFlag({required String currentCountry}) {
    const avatarImagePath = "assets/images/blank_male_2.png";
    const flagImagePath = "assets/images/us_flag.png";

    return const AvatarWithFlag(
      avatarSize: 50,
      avatarImagePath: avatarImagePath,
      flagImagePath: flagImagePath,
    );
  }

  Widget basicInfo({
    required String firstName,
    required String lastName,
    required String age,
    required String jobTitles,
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
              style: headerTextStyle,
            ),
            const AddHorizontalSpace(width: 4.0),
            Text(
              age,
              style: cardSecondaryTextStyle,
            ),
            Text(
              jobTitles,
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

  Widget allStats(Stats playerStats) {
    return MultipleStatsWidget(
      statsList: [
        StatsItemBuilder.defaultStat(
          statsName: TextConstants.energy,
          statsLevel: playerStats.energy,
        ),
        StatsItemBuilder.defaultStat(
          statsName: TextConstants.hunger,
          statsLevel: playerStats.hunger,
        ),
        StatsItemBuilder.defaultStat(
          statsName: TextConstants.mood,
          statsLevel: playerStats.mood,
        ),
        StatsItemBuilder.defaultStat(
          statsName: TextConstants.health,
          statsLevel: playerStats.health,
        ),
        StatsItemBuilder.defaultStat(
          statsName: TextConstants.sober,
          statsLevel: playerStats.sober,
        ),
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
