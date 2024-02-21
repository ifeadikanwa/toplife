import 'package:flutter/material.dart';
import 'package:toplife/core/dialogs/custom_dialogs/attend_event_dialog/dialog/attend_event_widget.dart';
import 'package:toplife/core/dialogs/show_dialog/show_dismissable_dialog.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/attend_event_detail.dart';

class AttendEventDialog {
  static Future<AttendEventDetail?> show({
    required BuildContext context,
    required Event event,
    required int mainPlayerID,
    required Person eventMainPerson,
    required String eventTitle,
    required String secondPersonEventDescription,
    required String relationshipLabel,
    required bool isParty,
  }) async {
    if (context.mounted) {
      return showDismissableDialog<AttendEventDetail>(
        context: context,
        child: AttendEventWidget(
          eventTitle: eventTitle,
          event: event,
          mainPlayerID: mainPlayerID,
          eventMainPerson: eventMainPerson,
          secondPersonEventDescription: secondPersonEventDescription,
          relationshipLabel: relationshipLabel,
          isParty: isParty,
        ),
      );
    }

    return null;
  }
}
