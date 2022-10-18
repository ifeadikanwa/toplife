import 'package:flutter/material.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_body_text.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_event_choices_to_buttons.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_title_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/show_persistent_dialog.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/event_choice.dart';

class ChoiceDialog {
  static Future<void> show({
    required BuildContext context,
    required String categoryTitle,
    required String eventDescription,
    required List<EventChoice> choices,
  }) {
    return showPersistentDialog(
      context: context,
      child: DialogContainer(
        title: DialogTitleText(text: categoryTitle),
        children: [
          DialogBodyText(
            text: eventDescription,
            style: DialogConstants.defaultBodyTextStyle,
          ),
          const AddVerticalSpace(
              height: DialogConstants.verticalDescriptionButtonSpacing),
          DialogEventChoicesToWidgets(eventChoices: choices),
        ],
      ),
    );
  }
}
