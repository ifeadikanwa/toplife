import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/app_bars/top_level_app_bar.dart';
import 'package:toplife/core/common_widgets/app_screen_content_templates/scrollable_screen_content.dart';
import 'package:toplife/core/common_widgets/app_screens/top_level_screen.dart';
import 'package:toplife/core/common_widgets/player_status_bar/player_status_bar.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/activities/widgets/activities_test_lists.dart';
import 'package:toplife/main_game/presentation/top_level_screens/activities/widgets/sections/activities_section.dart';
import 'package:toplife/main_game/presentation/top_level_screens/activities/widgets/sections/event_section.dart';
import 'package:toplife/main_game/presentation/top_level_screens/activities/widgets/sections/quick_actions_section.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TopLevelScreen(
      title: TextConstants.activities,
      child: ScrollableScreenContent(
        content: Column(
          children: [
            const QuickActionsSection(),
            EventSection(
              eventPersonPairs: ActivitiesTestList.eventPersonPairsList,
            ),
            const ActivitiesSection(),
          ],
        ),
      ),
    );
  }
}
