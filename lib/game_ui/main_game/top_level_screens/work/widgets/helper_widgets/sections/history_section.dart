import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/list_templates/action_list_item.dart';
import 'package:toplife/core/common_widgets/list_templates/section.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/work/constants/work_screen_text.dart';

class HistorySection extends StatelessWidget {
  const HistorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Section(
      sectionTitle: TextConstants.history,
      sectionItems: [
        GestureDetector(
          onTap: () {},
          child: ActionListItem(
            actionTitle: WorkScreenText.resume,
            actionDescription: WorkScreenText.resumeDesc,
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
