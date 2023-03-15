import 'package:flutter/material.dart';
import 'package:toplife/core/dialogs/custom_dialogs/attend_event_dialog/attend_regular_event/attend_regular_event_widget.dart';
import 'package:toplife/core/dialogs/dialog_helpers/show_persistent_dialog.dart';
import 'package:toplife/main_systems/system_event/constants/event_stay_duration.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

class AttendRegularEventDialog {
  static Future<void> show({
    required BuildContext context,
    required int mainPlayerID,
    required Event event,
    required Person eventMainPerson,
    required String relationshipLabel,
    required String eventTitle,
    required String eventDescription,
    required bool hasActivePartner,
    required Future<void> Function({
      required BuildContext context,
      required Event event,
      required int mainPlayerID,
      required Person eventMainPerson,
      required String relationshipLabel,
      required EventStayDuration eventStayDuration,
    })
        attendAlone,
    required Future<void> Function({
      required BuildContext context,
      required Event event,
      required int mainPlayerID,
      required Person eventMainPerson,
      required String relationshipLabel,
      required EventStayDuration eventStayDuration,
    })
        attendWithPartner,
  }) async {
    if (context.mounted) {
      return showPersistentDialog(
        context: context,
        child: AttendRegularEventWidget(
          mainPlayerID: mainPlayerID,
          event: event,
          eventMainPerson: eventMainPerson,
          relationshipLabel: relationshipLabel,
          eventTitle: eventTitle,
          eventDescription: eventDescription,
          hasActivePartner: hasActivePartner,
          attendAlone: attendAlone,
          attendWithPartner: attendWithPartner,
        ),
      );
    }
  }
}
