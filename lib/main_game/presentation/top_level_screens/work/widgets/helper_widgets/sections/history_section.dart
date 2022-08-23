import 'package:flutter/material.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/work/constants/work_screen_texts.dart';
import 'package:toplife/main_game/presentation/top_level_screens/work/widgets/helper_widgets/list_item/work_list_item.dart';
import 'package:toplife/main_game/presentation/top_level_screens/work/widgets/helper_widgets/sections/helper_widgets/work_section.dart';

class HistorySection extends StatelessWidget {
  const HistorySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WorkSection(
      sectionTitle: TextConstants.history,
      sections: [
        GestureDetector(
          onTap: () {},
          child: const WorkListItem(
            actionTitle: WorkScreenText.resume,
            actionDescription: WorkScreenText.resumeDesc,
          ),
        ),
      ],
    );
  }
}
