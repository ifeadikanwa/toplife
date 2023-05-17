import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/list_templates/section.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/activities/constants/activities_screen_text.dart';
import 'package:toplife/main_game/presentation/top_level_screens/activities/constants/default_activity_duration.dart';
import 'package:toplife/main_game/presentation/top_level_screens/activities/widgets/helper_widgets/list_item/quick_action_list_item.dart';
import 'package:toplife/main_game/presentation/top_level_screens/activities/widgets/sections/quick_actions_section/quick_actions_section_view_model.dart';

class QuickActionsSection extends ConsumerWidget {
  const QuickActionsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quickActionsSectionViewModelClassProvider =
        ref.watch(quickActionsSectionViewModelProvider);

    return quickActionsSectionViewModelClassProvider.when(
      data: (quickActionsSectionViewModel) {
        return Section(
          sectionTitle: TextConstants.quickActions,
          sectionItems: [
            Row(
              children: [
                Expanded(
                  child: QuickActionListItem(
                    quickActionTitle: ActivitiesScreenText.eat,
                    icon: Icons.ramen_dining_outlined,
                    timeInMinutes:
                        DefaultActivityDuration.eat.durationInMinutes,
                    addPlusToTime: DefaultActivityDuration.eat.canTakeLonger,
                    onTap: () async {
                      await quickActionsSectionViewModel.quickEat(
                        DefaultActivityDuration.eat.durationInMinutes,
                        context,
                      );
                    },
                  ),
                ),
                Expanded(
                  child: QuickActionListItem(
                    icon: Icons.bedtime_outlined,
                    quickActionTitle: ActivitiesScreenText.sleep,
                    timeInMinutes:
                        DefaultActivityDuration.sleep.durationInMinutes,
                    addPlusToTime: DefaultActivityDuration.sleep.canTakeLonger,
                    onTap: () {
                      quickActionsSectionViewModel
                          .goToSleepActionDialog(context);
                    },
                  ),
                )
              ],
            )
          ],
        );
      },
      error: (error, stackTrace) => const SizedBox(),
      loading: () => const SizedBox(),
    );
  }
}
