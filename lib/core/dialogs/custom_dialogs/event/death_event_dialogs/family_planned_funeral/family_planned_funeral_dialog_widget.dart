import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/button/default_elevated_button.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/dialogs/custom_dialogs/event/death_event_dialogs/death_event_dialogs_text_constants.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_body_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_title_text.dart';

class FamilyPlannedFuneralDialogWidget extends StatelessWidget {
  final String eventDescription;
  final String funeralArrangementsDescription;
  final String formattedAdjustedPlayerContribution;

  const FamilyPlannedFuneralDialogWidget({
    super.key,
    required this.eventDescription,
    required this.funeralArrangementsDescription,
    required this.formattedAdjustedPlayerContribution,
  });

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
          text:
              "${DeathEventDialogsTextConstants.yourContribution}: $formattedAdjustedPlayerContribution",
        ),
        const AddVerticalSpace(
          height: DialogConstants.verticalDescriptionButtonSpacing,
        ),
        DefaultElevatedButton(
          onPressed: () {
            //return true to the caller
            AutoRouter.of(context).popForced(true);
          },
          text: DeathEventDialogsTextConstants.payContribution,
        ),
        const AddVerticalSpace(
          height: DialogConstants.verticalChoiceButtonSpacing,
        ),
        DefaultElevatedButton(
          onPressed: () {
            //return false to the caller
            AutoRouter.of(context).popForced(false);
          },
          text: DeathEventDialogsTextConstants.refuseToContribute,
        ),
      ],
    );
  }
}
