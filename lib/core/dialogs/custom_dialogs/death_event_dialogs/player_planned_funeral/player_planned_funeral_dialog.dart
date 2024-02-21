import 'package:flutter/material.dart';
import 'package:toplife/core/dialogs/custom_dialogs/death_event_dialogs/player_planned_funeral/player_planned_funeral_widget.dart';
import 'package:toplife/core/dialogs/show_dialog/show_persistent_dialog.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/funeral_event_detail.dart';
import 'package:toplife/main_systems/system_location/countries/country.dart';

class PlayerPlannedFuneralDialog {
  static Future<FuneralEventDetail?> show({
    required BuildContext context,
    required String firstPersonEventDescription,
    required Country playerCountry,
  }) async {
    if (context.mounted) {
      return showPersistentDialog<FuneralEventDetail>(
        context: context,
        child: PlayerPlannedFuneralWidget(
          firstPersonEventDescription: firstPersonEventDescription,
          playerCountry: playerCountry,
        ),
      );
    }

    return null;
  }
}
