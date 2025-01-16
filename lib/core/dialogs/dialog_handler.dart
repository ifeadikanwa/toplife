import 'package:flutter/cupertino.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/custom_dialogs/choice_dialog_widget.dart';
import 'package:toplife/core/dialogs/custom_dialogs/event/death_event_dialogs/family_planned_funeral/family_planned_funeral_dialog_widget.dart';
import 'package:toplife/core/dialogs/custom_dialogs/event/death_event_dialogs/player_planned_funeral/player_planned_funeral_dialog_widget.dart';
import 'package:toplife/core/dialogs/custom_dialogs/relationship/send_food_dialog/send_food_dialog_widget.dart';
import 'package:toplife/core/dialogs/custom_dialogs/relationship/send_money_dialog/send_money_dialog_widget.dart';
import 'package:toplife/core/dialogs/custom_dialogs/relationship/torment_dialog/torment_dialog_widget.dart';
import 'package:toplife/core/dialogs/custom_dialogs/result_dialog_widget.dart';
import 'package:toplife/core/dialogs/custom_dialogs/result_with_stats_dialog.dart';
import 'package:toplife/core/dialogs/custom_dialogs/shop/break_old_rent_lease_dialog/break_old_rent_lease_widget.dart';
import 'package:toplife/core/dialogs/show_dialog/show_dismissable_dialog.dart';
import 'package:toplife/core/dialogs/show_dialog/show_persistent_dialog.dart';
import 'package:toplife/core/utils/stats/stats_item.dart';
import 'package:toplife/game_systems/main_systems/system_event/domain/model/info_models/event_choice.dart';
import 'package:toplife/game_systems/main_systems/system_event/domain/model/info_models/funeral_event_detail.dart';
import 'package:toplife/game_systems/main_systems/system_location/countries/country.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/model/info_models/person_relationship_pair.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/interactions/constants/torment_option.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/model/info_models/fridge_food_pair.dart';

class DialogHandler {
  final GlobalKey<NavigatorState> navigatorKey;

  const DialogHandler({required this.navigatorKey});

  //getter for getting build context out of the navigator key - for the dialogs
  BuildContext? get _currentContext =>
      navigatorKey.currentState?.overlay?.context;

  Future<void> showResultDialog({
    required String title,
    required String result,
  }) async {
    final BuildContext? context = _currentContext;

    if (context != null) {
      return showDismissableDialog(
        context: context,
        child: ResultDialogWidget(
          title: title,
          result: result,
        ),
      );
    }
  }

  Future<void> showResultWithStatsDialog({
    required String title,
    required String result,
    required List<StatsItem> statsList,
  }) async {
    final BuildContext? context = _currentContext;

    if (context != null) {
      return showDismissableDialog(
        context: context,
        child: ResultWithStatsDialogWidget(
          title: title,
          result: result,
          statsList: statsList,
        ),
      );
    }
  }

  Future<void> showChoiceDialog({
    required String categoryTitle,
    required String eventDescription,
    required List<EventChoice> choices,
  }) async {
    final BuildContext? context = _currentContext;

    if (context != null) {
      return showPersistentDialog(
        context: context,
        child: ChoiceDialogWidget(
          categoryTitle: categoryTitle,
          eventDescription: eventDescription,
          choices: choices,
        ),
      );
    }
  }

  Future<bool?> showFamilyPlannedFuneralDialog({
    required String eventDescription,
    required String funeralArrangementsDescription,
    required String formattedAdjustedPlayerContribution,
  }) async {
    final BuildContext? context = _currentContext;

    if (context != null) {
      return showPersistentDialog<bool>(
        context: context,
        child: FamilyPlannedFuneralDialogWidget(
          eventDescription: eventDescription,
          funeralArrangementsDescription: funeralArrangementsDescription,
          formattedAdjustedPlayerContribution:
              formattedAdjustedPlayerContribution,
        ),
      );
    }

    return null;
  }

  Future<FuneralEventDetail?> showPlayerPlannedFuneralDialog({
    required String firstPersonEventDescription,
    required Country playerCountry,
  }) async {
    final BuildContext? context = _currentContext;

    if (context != null) {
      return showPersistentDialog<FuneralEventDetail>(
        context: context,
        child: PlayerPlannedFuneralDialogWidget(
          firstPersonEventDescription: firstPersonEventDescription,
          playerCountry: playerCountry,
        ),
      );
    }

    return null;
  }

  Future<FridgeFoodPair?> showSendFoodDialog({
    required List<FridgeFoodPair> fridgeFoodPairs,
    required PersonRelationshipPair personRelationshipPair,
    required String relationshipLabel,
  }) async {
    final BuildContext? context = _currentContext;

    if (context != null) {
      return showDismissableDialog<FridgeFoodPair>(
        context: context,
        child: SendFoodDialogWidget(
          personRelationshipPair: personRelationshipPair,
          relationshipLabel: relationshipLabel,
          foodOptions: fridgeFoodPairs,
        ),
      );
    }

    return null;
  }

  Future<int?> showSendMoneyDialog({
    required PersonRelationshipPair personRelationshipPair,
    required String relationshipLabel,
  }) async {
    final BuildContext? context = _currentContext;

    if (context != null) {
      return showDismissableDialog<int>(
        context: context,
        child: SendMoneyDialogWidget(
          personRelationshipPair: personRelationshipPair,
          relationshipLabel: relationshipLabel,
        ),
      );
    }

    return null;
  }

  Future<TormentOption?> showTormentDialog({
    required PersonRelationshipPair personRelationshipPair,
    required String relationshipLabel,
  }) async {
    final BuildContext? context = _currentContext;

    if (context != null) {
      return showDismissableDialog<TormentOption>(
        context: context,
        child: TormentDialogWidget(
          personRelationshipPair: personRelationshipPair,
          relationshipLabel: relationshipLabel,
        ),
      );
    }

    return null;
  }

  Future<bool?> showBreakOldRentLeaseDialog({
    required House house,
  }) async {
    final BuildContext? context = _currentContext;

    if (context != null) {
      return showDismissableDialog<bool>(
        context: context,
        child: BreakOldRentLeaseWidget(
          house: house,
        ),
      );
    }

    return null;
  }
}
