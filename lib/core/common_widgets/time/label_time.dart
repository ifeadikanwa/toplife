import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/spaces/add_horizontal_space.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/utils/date_and_time/get_label_time.dart';

class LabelTime extends StatelessWidget {
  final int timeInMinutes;
  final bool addPlus;
  const LabelTime({
    super.key,
    required this.timeInMinutes,
    this.addPlus = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.schedule_outlined,
          size: listClockIconSize,
        ),
        const AddHorizontalSpace(width: 2.0),
        Text(
          getLabelTime(
            timeInMinutes: timeInMinutes,
            addPlus: addPlus,
          ),
        ),
      ],
    );
  }
}
