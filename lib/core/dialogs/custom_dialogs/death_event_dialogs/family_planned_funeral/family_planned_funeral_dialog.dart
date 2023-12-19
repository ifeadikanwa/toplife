import 'package:flutter/material.dart';
import 'package:toplife/core/dialogs/custom_dialogs/death_event_dialogs/family_planned_funeral/family_planned_funeral_widget.dart';
import 'package:toplife/core/dialogs/show_dialog/show_persistent_dialog.dart';

class FamilyPlannedFuneralDialog {
  static Future<bool?> show({
    required BuildContext context,
    required String eventDescription,
    required String funeralArrangementsDescription,
    required int playerContribution,
    required String playerCurrency,
  }) async {
    if (context.mounted) {
      return showPersistentDialog<bool>(
        context: context,
        child: FamilyPlannedFuneralWidget(
          eventDescription: eventDescription,
          funeralArrangementsDescription: funeralArrangementsDescription,
          playerContribution: playerContribution,
          playerCurrency: playerCurrency,
        ),
      );
    }

    return null;
  }
}
