import 'package:flutter/material.dart';
import 'package:toplife/core/dialogs/custom_dialogs/death_event_dialogs/family_planned_funeral_widget.dart';
import 'package:toplife/core/dialogs/dialog_helpers/show_persistent_dialog.dart';
import 'package:toplife/main_systems/system_event/domain/model/event.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/event_choice.dart';

class FamilyPlannedFuneralDialog {
  static Future<void> show({
    required BuildContext context,
    required int mainPlayerID,
    required Event deathEvent,
    required String eventDescription,
    required String funeralArrangementsDescription,
    required int playerContribution,
    required String playerCurrency,
    required List<EventChoice> choices,
  }) async {
    if(context.mounted){
      return showPersistentDialog(
      context: context,
      child: FamilyPlannedFuneralWidget(
        mainPlayerID: mainPlayerID,
        deathEvent: deathEvent,
        eventDescription: eventDescription,
        funeralArrangementsDescription: funeralArrangementsDescription,
        playerContribution: playerContribution,
        playerCurrency: playerCurrency,
        choices: choices,
      ),
    );
    }
    
  }
}
