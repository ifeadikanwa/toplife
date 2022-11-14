import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/list_templates/section.dart';
import 'package:toplife/core/common_widgets/list_templates/action_list_item.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/work/constants/work_screen_text.dart';
class OpportunitiesSection extends StatelessWidget {
  const OpportunitiesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Section(
      sectionTitle: TextConstants.opportunities,
      sectionItems: [
        ActionListItem(
          actionTitle: WorkScreenText.school,
          actionDescription: WorkScreenText.schoolDesc,
          onTap: () {},
        ),
        ActionListItem(
          actionTitle: WorkScreenText.fulltimeJobBoard,
          actionDescription: WorkScreenText.fullTimeJobBoardDesc,
          onTap: () {},
        ),
        ActionListItem(
          actionTitle: WorkScreenText.parttimeJobBoard,
          actionDescription: WorkScreenText.partTimeJobBoardDesc,
          onTap: () {},
        ),
        ActionListItem(
          actionTitle: WorkScreenText.freelanceJobBoard,
          actionDescription: WorkScreenText.freelanceJobBoardDesc,
          onTap: () {},
        ),
        ActionListItem(
          actionTitle: WorkScreenText.specialCareers,
          actionDescription: WorkScreenText.specialsCareerDesc,
          hasDivider: false,
          onTap: () {},
        ),
      ],
    );
  }
}
