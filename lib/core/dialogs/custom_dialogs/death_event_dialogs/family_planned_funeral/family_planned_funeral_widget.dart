import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/custom_dialogs/death_event_dialogs/death_event_dialogs_text_constants.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_body_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_event_choices_to_buttons.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_title_text.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/event_choice.dart';

class FamilyPlannedFuneralWidget extends StatelessWidget {
  final int mainPlayerID;
  final Event deathEvent;
  final String eventDescription;
  final String funeralArrangementsDescription;
  final int playerContribution;
  final String playerCurrency;
  final List<EventChoice> choices;

  const FamilyPlannedFuneralWidget({
    Key? key,
    required this.mainPlayerID,
    required this.deathEvent,
    required this.eventDescription,
    required this.funeralArrangementsDescription,
    required this.playerContribution,
    required this.playerCurrency,
    required this.choices,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DialogContainer(
      title: const DialogTitleText(
        text: DeathEventDialogsTextConstants.funeralPlanEventTitle,
      ),
      children: [
        DialogBodyText(
          text: eventDescription,
        ),
        const AddVerticalSpace(
          height: DialogConstants.verticalTextTextSpacing,
        ),
        DialogBodyText(
          text: funeralArrangementsDescription,
        ),
        const AddVerticalSpace(
          height: DialogConstants.verticalTextTextSpacing,
        ),
        DialogBodyText(
          text: "${DeathEventDialogsTextConstants.yourContribution}: $playerCurrency$playerContribution",
        ),
        const AddVerticalSpace(
          height: DialogConstants.verticalDescriptionButtonSpacing,
        ),
        DialogEventChoicesToWidgets(
          eventChoices: choices,
        ),
      ],
    );
  }
}
