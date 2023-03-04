import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/app_bars/top_level_app_bar.dart';
import 'package:toplife/core/common_widgets/app_screen_content_templates/screen_content.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/player/widgets/helper_widgets/baby_monitor/baby_monitor_card.dart';
import 'package:toplife/main_game/presentation/top_level_screens/player/widgets/helper_widgets/home_options/home_options.dart';
import 'package:toplife/main_game/presentation/top_level_screens/player/widgets/helper_widgets/money_and_time/money_and_time_card.dart';
import 'package:toplife/main_game/presentation/top_level_screens/player/widgets/helper_widgets/player_information/player_information_card_widget.dart';
import 'package:toplife/main_game/presentation/top_level_screens/player/widgets/helper_widgets/todays_journal/todays_journal_card.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TopLevelAppBar(
          leading: Icon(
            Icons.menu_outlined,
          ),
          title: TextConstants.appName,
          actions: [
            Icon(
              Icons.emoji_events_outlined,
            )
          ],
        ),
        Expanded(
          child: ScreenContent(
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                MoneyAndTimeCard(),
                PlayerInformationCard(),
                HomeOptions(),
                BabyMonitorCard(
                  babies: [
                    ["Natasha", "Happy"],
                    ["Christian", "Happy"],
                    ["Jason", "Happy"],
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
