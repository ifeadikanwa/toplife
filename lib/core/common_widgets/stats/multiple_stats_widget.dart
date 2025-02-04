import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/common_widgets/progress_bar/progress_bar.dart';
import 'package:toplife/core/utils/stats/stats_item.dart';

class MultipleStatsWidget extends StatelessWidget {
  final List<StatsItem> statsList;

  //I can adjust the max text width in situations where there is a longer text
  const MultipleStatsWidget({
    super.key,
    required this.statsList,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const <int, TableColumnWidth>{
        0: IntrinsicColumnWidth(),
        1: FlexColumnWidth(),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        ...statsList.map(
          (statsItem) => TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 1.0),
                child: Text(
                  statsItem.statsName.toUpperCase(),
                  style: statsTextStyle,
                  textAlign: TextAlign.right,
                ),
              ),
              ProgressBar(
                progressValue: statsItem.statsLevel,
                progressStatsRange: statsItem.statsRange,
                positiveIsAlwaysGreen: statsItem.positiveIsAlwaysGreen,
                showProgressValue: true,
              ),
            ],
          ),
        ),
      ],
    );

    // return Column(
    //   children: [
    //     ...statsList.map(
    //       (e) => Padding(
    //         padding: const EdgeInsets.symmetric(vertical: 0.5),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             SizedBox(
    //               width: textWidth,
    //               child: Text(
    //                 e.statsName.toUpperCase(),
    //                 style: statsTextStyle,
    //                 textAlign: TextAlign.right,
    //               ),
    //             ),
    //             Expanded(
    //               child: ProgressBar(
    //                 progressValue: e.statsLevel,
    //                 progressStatsRange: e.statsRange,
    //                 positiveIsAlwaysGreen: e.positiveIsAlwaysGreen,
    //                 showProgressValue: true,
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     )
    //   ],
    // );
  }
}
