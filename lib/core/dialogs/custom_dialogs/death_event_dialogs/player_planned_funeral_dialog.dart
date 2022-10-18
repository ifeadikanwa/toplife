import 'package:flutter/material.dart';
import 'package:toplife/core/dialogs/custom_dialogs/death_event_dialogs/player_planned_funeral_widget.dart';
import 'package:toplife/main_systems/system_event/constants/funeral_type.dart';
import 'package:toplife/main_systems/system_event/domain/model/event.dart';
import 'package:toplife/main_systems/system_location/countries/country.dart';

class PlayerPlannedFuneralDialog {
  static Future<void> show({
    required BuildContext context,
    required int mainPlayerID,
    required Event deathEvent,
    required String firstPersonEventDescription,
    required Country playerCountry,
    required Future<void> Function({
      required BuildContext context,
      required int mainPlayerID,
      required Event deathEvent,
      required String firstPersonEventDescription,
      required Country playerCountry,
      required FuneralType funeralType,
      required int cost,
      required int eventStartTime,
    })
        planFuneral,
  }) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: PlayerPlannedFuneralWidget(
              mainPlayerID: mainPlayerID,
              deathEvent: deathEvent,
              firstPersonEventDescription: firstPersonEventDescription,
              playerCountry: playerCountry,
              planFuneral: planFuneral,
            ),
          );
        });
  }
}
