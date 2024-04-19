import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/common_widgets/stats/multiple_stats_widget.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_body_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_title_text.dart';
import 'package:toplife/core/utils/stats/stats_item.dart';

class ResultWithStatsDialogWidget extends StatelessWidget {
  final String title;
  final String result;
  final List<StatsItem> statsList;

  const ResultWithStatsDialogWidget({
    Key? key,
    required this.title,
    required this.result,
    required this.statsList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DialogContainer(
      title: DialogTitleText(text: title),
      children: [
        Center(
          child: DialogBodyText(text: result),
        ),
        const AddVerticalSpace(
          height: DialogConstants.verticalTextTextSpacing,
        ),
        MultipleStatsWidget(
          statsList: statsList,
        ),
      ],
    );
  }
}
