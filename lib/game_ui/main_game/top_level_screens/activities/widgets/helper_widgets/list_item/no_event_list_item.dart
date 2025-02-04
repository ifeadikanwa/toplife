import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/list_templates/case/general_list_item_case.dart';
import 'package:toplife/core/common_widgets/list_templates/helper_widgets/action_text.dart';
import 'package:toplife/core/text_constants.dart';

class NoEventListItem extends StatelessWidget {
  const NoEventListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const GeneralListItemCase(content: [
      ActionText(
        actionTitle: TextConstants.noEventTitle,
        actionDescription: TextConstants.noEventDesc,
      )
    ]);
  }
}
