import 'package:flutter/material.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_event_choices_to_buttons.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/event_choice.dart';

class DialogContainer extends StatelessWidget {
  final Widget? title;
  final List<Widget>? children;
  final bool closeable;

  const DialogContainer({
    Key? key,
    this.title,
    this.children,
    this.closeable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);

    final closeChoice = EventChoice(
      choiceDescription: DialogConstants.close,
      choiceAction: (BuildContext context) {},
    );

    return SimpleDialog(
      backgroundColor: appTheme.cardTheme.color,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: appTheme.colorScheme.tertiary,
          width: DialogConstants.borderWidth,
        ),
        borderRadius: BorderRadius.circular(DialogConstants.borderRadius),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: DialogConstants.horizontalContentPadding,
        vertical: DialogConstants.verticalContentPadding,
      ),
      title: title,
      children: [
        ...?children,
        (closeable)
            ? DialogEventChoicesToWidgets(eventChoices: [closeChoice])
            : const SizedBox(),
      ],
    );
  }
}
