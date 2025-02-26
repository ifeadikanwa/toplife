import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/app_bars/top_level_app_bar.dart';
import 'package:toplife/core/common_widgets/app_screen_content_templates/screen_content.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/player/widgets/helper_widgets/baby_monitor/baby_monitor_card.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/player/widgets/helper_widgets/home_options/home_options.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/player/widgets/helper_widgets/money_and_time/money_and_time_card.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/player/widgets/helper_widgets/player_information/player_information_card.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/player/widgets/helper_widgets/todays_journal/todays_journal_card.dart';

@RoutePage()
class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopLevelAppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu_outlined,
            ),
          ),
          title: TextConstants.appName,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.emoji_events_outlined,
              ),
            ),
          ],
        ),
        const Expanded(
          child: ScreenContent(
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MoneyAndTimeCard(),
                PlayerInformationCard(),
                HomeOptions(),
                BabyMonitorCard(
                  babies: [
                    // ["Natasha", "Happy"],
                    // ["Christian", "Happy"],
                    ["Natalie Howard", "Angry"],
                  ],
                ),
                TodaysJournalCard(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
