import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/event_choice.dart';

class DialogEventChoicesToWidgets extends StatelessWidget {
  final List<EventChoice> eventChoices;

  const DialogEventChoicesToWidgets({
    Key? key,
    required this.eventChoices,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ...eventChoices.map(
          (eventChoice) => Padding(
            padding: const EdgeInsets.symmetric(
              vertical: DialogConstants.verticalChoiceButtonSpacing,
            ),
            child: ElevatedButton(
              onPressed: () {
                AutoRouter.of(context).popForced();
                eventChoice.choiceAction(context);
              },
              child: Text(
                eventChoice.choiceDescription,
              ),
            ),
          ),
        )
      ],
    );
  }
}
