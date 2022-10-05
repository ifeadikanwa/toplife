import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/dialogs/dialog_constants/dialog_constants.dart';
import 'package:toplife/core/common_widgets/dialogs/dialog_constants/dialog_container.dart';
import 'package:toplife/core/common_widgets/dialogs/dialog_constants/dialog_text.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/event_choice.dart';

class ChoiceDialog {
  static Future<void> show({
    required BuildContext context,
    required String categoryTitle,
    required String eventDescription,
    required List<EventChoice> choices,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: DialogContainer(
            title: DialogText(text: categoryTitle),
            children: [
              DialogText(
                text: eventDescription,
                style: DialogConstants.descriptionTextStyle,
              ),
              const AddVerticalSpace(
                  height: DialogConstants.verticalDescriptionButtonSpacing),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ...choicesWidgets(choices: choices, context: context),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  static List<Widget> choicesWidgets({
    required List<EventChoice> choices,
    required BuildContext context,
  }) {
    List<Widget> choiceWidgets = [];

    for (var eventChoice in choices) {
      choiceWidgets.add(
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: DialogConstants.verticalChoiceButtonSpacing,
          ),
          child: ElevatedButton(
            onPressed: () {
              AutoRouter.of(context).popForced();
              eventChoice.choiceAction();
            },
            child: Text(
              eventChoice.choiceDescription,
            ),
          ),
        ),
      );
    }

    return choiceWidgets;
  }
}
