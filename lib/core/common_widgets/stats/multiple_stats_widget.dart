import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/common_widgets/progress_bar/progress_bar.dart';
import 'package:toplife/main_systems/system_person/domain/model/helpers/stats_item.dart';

class MultipleStatsWidget extends StatelessWidget {
  final List<StatsItem> statsList;
  const MultipleStatsWidget({
    Key? key,
    required this.statsList,
    // required this.statName,
    // required this.progressValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        statNames(),
        statsLevels(),
      ],
    );
  }

  Widget statNames() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ...statNamesToWidget(),
      ],
    );
  }

  List<Widget> statNamesToWidget() {
    return statsList
        .map(
          (stats) => addVerticalPadding(
            widget: Text(
              stats.statsName,
              style: largeStatsTextStyle,
            ),
          ),
        )
        .toList();
  }

  Widget statsLevels() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ...statLevelsToWidget(),
        ],
      ),
    );
  }

  List<Widget> statLevelsToWidget() {
    return statsList
        .map(
          (stats) => addVerticalPadding(
            widget: ProgressBar(progressValue: stats.statsLevel),
          ),
        )
        .toList();
  }

  Widget addVerticalPadding({
    required Widget widget,
    double topPadding = 4.0,
    double bottomPadding = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        top: topPadding,
        bottom: bottomPadding,
      ),
      child: widget,
    );
  }
}
