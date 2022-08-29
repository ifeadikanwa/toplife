import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/list_templates/section.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/activities/constants/activities_screen_text.dart';
import 'package:toplife/main_game/presentation/top_level_screens/activities/constants/default_activity_duration.dart';
import 'package:toplife/main_game/presentation/top_level_screens/activities/widgets/helper_widgets/list_item/quick_action_list_item.dart';

class QuickActionsSection extends StatelessWidget {
  const QuickActionsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Section(
      sectionTitle: TextConstants.quickActions,
      sectionItems: [
        Row(
          children: [
            Expanded(
              child: QuickActionListItem(
                quickActionTitle: ActivitiesScreenText.eat,
                icon: Icons.ramen_dining_outlined,
                timeInMinutes: DefaultActivityDuration.eat.durationInMinutes,
                addPlusToTime: DefaultActivityDuration.eat.canTakeLonger,
                onTap: () {},
              ),
            ),
            Expanded(
              child: QuickActionListItem(
                icon: Icons.bedtime_outlined,
                quickActionTitle: ActivitiesScreenText.sleep,
                timeInMinutes: DefaultActivityDuration.sleep.durationInMinutes,
                addPlusToTime: DefaultActivityDuration.sleep.canTakeLonger,
                onTap: () {},
              ),
            )
          ],
        )
      ],
    );
  }
}
