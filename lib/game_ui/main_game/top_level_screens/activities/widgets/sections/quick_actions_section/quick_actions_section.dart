import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/common_widgets/list_templates/section.dart';
import 'package:toplife/core/dialogs/show_dialog/show_dismissable_dialog.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/activities/constants/activities_screen_text.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/activities/widgets/dialogs/sleep_action_dialog/sleep_action_dialog.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/activities/widgets/helper_widgets/list_item/quick_action_list_item.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/activities/widgets/sections/quick_actions_section/quick_actions_section_view_model.dart';

class QuickActionsSection extends ConsumerWidget {
  const QuickActionsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Section(
      sectionTitle: TextConstants.quickActions,
      sectionItems: [
        Row(
          children: [
            Expanded(
              child: QuickActionListItem(
                quickActionTitle: ActivitiesScreenText.eat,
                icon: Icons.ramen_dining_outlined,
                timeInMinutes: ref
                    .watch(personUsecasesProvider)
                    .quickEatUsecase
                    .defaultActionDuration
                    .durationInMinutes,
                addPlusToTime: ref
                    .watch(personUsecasesProvider)
                    .quickEatUsecase
                    .defaultActionDuration
                    .canTakeLonger,
                onTap: () async {
                  await ref
                      .read(quickActionsSectionViewModelProvider.notifier)
                      .quickEat();
                },
              ),
            ),
            Expanded(
              child: QuickActionListItem(
                icon: Icons.bedtime_outlined,
                quickActionTitle: ActivitiesScreenText.sleep,
                timeInMinutes: ref
                    .watch(personUsecasesProvider)
                    .sleepUsecase
                    .defaultActionDuration
                    .durationInMinutes,
                addPlusToTime: ref
                    .watch(personUsecasesProvider)
                    .sleepUsecase
                    .defaultActionDuration
                    .canTakeLonger,
                onTap: () => showDismissableDialog(
                  context: context,
                  child: const SleepActionDialog(),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
