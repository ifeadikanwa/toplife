import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/house/tab_screens/rental_houses_screen/rental_houses_screen_view_model.dart';

final breakOldRentLeaseWidgetViewModelProvider =
    Provider.autoDispose<BreakOldRentLeaseWidgetViewModel>((ref) {
  //get recent
  final RentalHousesScreenViewModel rentalHousesScreenViewModel =
      ref.watch(rentalHousesScreenViewModelProvider.notifier);

  return BreakOldRentLeaseWidgetViewModel(
    rentalHousesScreenViewModel: rentalHousesScreenViewModel,
  );
});

class BreakOldRentLeaseWidgetViewModel {
  final RentalHousesScreenViewModel _rentalHousesScreenViewModel;

  BreakOldRentLeaseWidgetViewModel({
    required RentalHousesScreenViewModel rentalHousesScreenViewModel,
  }) : _rentalHousesScreenViewModel = rentalHousesScreenViewModel;

  void breakLease(
    BuildContext context,
    House house,
    Future<bool> Function(BuildContext context) breakLeaseChoiceAction,
  ) async {
    final bool rentSuccessful = await breakLeaseChoiceAction(context);

    if (rentSuccessful) {
      _rentalHousesScreenViewModel.removeRentedHouseFromShop(house);
    }
  }
}
