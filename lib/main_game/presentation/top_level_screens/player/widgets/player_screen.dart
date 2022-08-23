import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/app_bars/top_level_app_bar.dart';
import 'package:toplife/core/common_widgets/app_templates/screen_content.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/player/widgets/helper_widgets/home_options.dart';
import 'package:toplife/main_game/presentation/top_level_screens/player/widgets/helper_widgets/money_and_time_card.dart';
import 'package:toplife/main_game/presentation/top_level_screens/player/widgets/helper_widgets/player_information_card_widget.dart';
import 'package:toplife/main_game/presentation/top_level_screens/player/widgets/helper_widgets/todays_journal.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const avatarImagePath = "assets/images/black_woman_placeholder.jpg";
    const flagImagePath = "assets/images/france_flag.jpg";

    return Column(
      children: [
        TopLevelAppBar(
          leading: const Icon(
            Icons.menu_outlined,
          ),
          title: TextConstants.appName.toUpperCase(),
          actions: const [
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
                MoneyAndTimeCard(
                    currency: "\$",
                    bankBalance: "65,000",
                    time: "08:45  AM",
                    dayNumber: "34"),
                PlayerInformationCard(
                  firstName: "Janet",
                  lastName: "Jackson",
                  age: "Young Adult",
                  jobTitle: "Singer",
                  avatarImagePath: avatarImagePath,
                  flagImagePath: flagImagePath,
                ),
                HomeOptions(),
                // BabyMonitorCard(
                //   babies: [
                //     ["Natasha", "Happy"],
                //     ["Christian", "Happy"],
                //     ["Jason", "Happy"],
                //   ],
                // ),
                TodaysJournalCard(
                    todaysJournalEntry:
                        "Normally, Both your asses would be dead as fucking fried chicken, but you happen to pull this shit while I'm in a transitional period so I don't wanna kill you, I wanna help you. But I can't give you this case, it don't belong to me. Besides, I've already been through too much shit this morning over this case to hand it over to your dumb ass."),
              ],
            ),
          ),
        )
      ],
    );
  }
}
