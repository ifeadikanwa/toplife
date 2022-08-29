import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/app_bars/top_level_app_bar.dart';
import 'package:toplife/core/common_widgets/app_templates/scrollable_screen_content.dart';
import 'package:toplife/core/common_widgets/player_status_bar/player_status_bar.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/activities/widgets/sections/activities_section.dart';
import 'package:toplife/main_game/presentation/top_level_screens/activities/widgets/sections/quick_actions_section.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const avatarImagePath = "assets/images/black_woman_placeholder.jpg";
    const flagImagePath = "assets/images/france_flag.jpg";

    return Column(
      children: [
        const PlayerStatusBar(
          firstName: "Janet",
          lastName: "Jackson",
          avatarImagePath: avatarImagePath,
          flagImagePath: flagImagePath,
          currency: "\$",
          bankBalance: "60,000",
          time: "08:45 AM",
          dayNumber: "34",
        ),
        TopLevelAppBar(
          title: TextConstants.activities.toUpperCase(),
        ),
        ScrollableScreenContent(
          content: Column(
            children: const [
              QuickActionsSection(),
              ActivitiesSection(),
            ],
          ),
        ),
      ],
    );
  }
}
