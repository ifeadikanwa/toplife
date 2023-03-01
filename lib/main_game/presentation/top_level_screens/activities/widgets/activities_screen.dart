import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/app_screen_content_templates/scrollable_screen_content.dart';
import 'package:toplife/core/common_widgets/app_screens/top_level_screen.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/activities/widgets/sections/activities_section/activities_section.dart';
import 'package:toplife/main_game/presentation/top_level_screens/activities/widgets/sections/event_section/event_section.dart';
import 'package:toplife/main_game/presentation/top_level_screens/activities/widgets/sections/quick_actions_section/quick_actions_section.dart';

class ActivitiesScreen extends ConsumerWidget {
  const ActivitiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TopLevelScreen(
      title: TextConstants.activities,
      child: ScrollableScreenContent(
        content: Column(
          children: const [
            QuickActionsSection(),
            EventSection(),
            ActivitiesSection(),
          ],
        ),
      ),
    );
  }
}
