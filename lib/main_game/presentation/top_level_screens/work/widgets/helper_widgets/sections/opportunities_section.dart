import 'package:flutter/material.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/work/constants/work_screen_texts.dart';
import 'package:toplife/main_game/presentation/top_level_screens/work/widgets/helper_widgets/list_item/work_list_item.dart';
import 'package:toplife/main_game/presentation/top_level_screens/work/widgets/helper_widgets/sections/helper_widgets/work_section.dart';

class OpportunitiesSection extends StatelessWidget {
  const OpportunitiesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WorkSection(
      sectionTitle: TextConstants.opportunities,
      sections: [
        GestureDetector(
          onTap: () {},
          child: const WorkListItem(
            actionTitle: WorkScreenText.school,
            actionDescription: WorkScreenText.schoolDesc,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: const WorkListItem(
            actionTitle: WorkScreenText.fulltimeJobBoard,
            actionDescription: WorkScreenText.fullTimeJobBoardDesc,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: const WorkListItem(
            actionTitle: WorkScreenText.parttimeJobBoard,
            actionDescription: WorkScreenText.partTimeJobBoardDesc,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: const WorkListItem(
            actionTitle: WorkScreenText.freelanceJobBoard,
            actionDescription: WorkScreenText.freelanceJobBoardDesc,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: const WorkListItem(
            actionTitle: WorkScreenText.specialCareers,
            actionDescription: WorkScreenText.specialsCareerDesc,
            hasDivider: false,
          ),
        ),
      ],
    );
  }
}
