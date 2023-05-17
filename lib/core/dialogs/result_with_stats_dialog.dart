import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/common_widgets/stats/multiple_stats_widget.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_body_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_title_text.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/stats_item.dart';

class ResultWithStatsDialog {
  static Future<void> show({
    required BuildContext context,
    required String title,
    required String result,
    required List<StatsItem> statsList,
  }) async {
    if (context.mounted) {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
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
        },
      );
    }
  }
}
