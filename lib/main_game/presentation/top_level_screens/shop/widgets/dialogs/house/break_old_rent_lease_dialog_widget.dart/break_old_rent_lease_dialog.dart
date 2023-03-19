import 'package:flutter/material.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/house/break_old_rent_lease_dialog_widget.dart/break_old_rent_lease_widget.dart';

//This dialog is used internally in the rent house usecase.
//It is not called by any other widget.
//Its here because i thought it best that all house dialogs be here together.
//Shouldn't this be a choice dialog? 
//Yes it was until I added the functionality that removes rented houses from the shop list. 
//The usecase for breaking lease and renting another house only runs after the user makes a choice ,
//so I have to create another view model so we can know what choice the user made and act on it.
class BreakOldRentLeaseDialog {
  static Future<void> show({
    required BuildContext context,
    required House house,
    required Future<bool> Function(BuildContext context) breakLeaseChoiceAction,
  }) async {
    if (context.mounted) {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return BreakOldRentLeaseWidget(
            house: house,
            breakLeaseChoiceAction: breakLeaseChoiceAction,
          );
        },
      );
    }
  }
}
