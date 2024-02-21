import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/shop_and_storage/shop_and_storage_dependencies_providers.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/car/tab_screens/new_cars_screen/new_cars_screen_view_model.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/sub_screens/car/tab_screens/used_cars_screen/used_cars_screen_view_model.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';

final carLoanDialogViewModelProvider = Provider<CarLoanDialogViewModel>((ref) {
  //get recent
  final shopAndStorageUsecases = ref.watch(shopAndStorageUsecasesProvider);
  final NewCarsScreenViewModel newCarsScreenViewModel =
      ref.watch(newCarsScreenViewModelProvider.notifier);
  final UsedCarsScreenViewModel usedCarsScreenViewModel =
      ref.watch(usedCarsScreenViewModelProvider.notifier);

  return CarLoanDialogViewModel(
    shopAndStorageUsecases: shopAndStorageUsecases,
    newCarsScreenViewModel: newCarsScreenViewModel,
    usedCarsScreenViewModel: usedCarsScreenViewModel,
  );
});

class CarLoanDialogViewModel {
  final ShopAndStorageUsecases _shopAndStorageUsecases;
  final NewCarsScreenViewModel _newCarsScreenViewModel;
  final UsedCarsScreenViewModel _usedCarsScreenViewModel;

  CarLoanDialogViewModel({
    required ShopAndStorageUsecases shopAndStorageUsecases,
    required NewCarsScreenViewModel newCarsScreenViewModel,
    required UsedCarsScreenViewModel usedCarsScreenViewModel,
  })  : _shopAndStorageUsecases = shopAndStorageUsecases,
        _newCarsScreenViewModel = newCarsScreenViewModel,
        _usedCarsScreenViewModel = usedCarsScreenViewModel;

  void applyForCarLoan(
    BuildContext context,
    int personID,
    Car car,
    int downPaymentPercentage,
  ) async {
    final bool purchaseSuccessful =
        await _shopAndStorageUsecases.purchaseCarWithLoanUsecase.execute(
      context: context,
      car: car,
      downPaymentPercentage: downPaymentPercentage,
      personID: personID,
    );

    //if purchase is successful, ask responsible view model to remove the car from the shop
    if (purchaseSuccessful) {
      //new cars have 100% condition at purchase
      (car.maxConditionAtPurchase == defaultMaxStatsValue)
          ? _newCarsScreenViewModel.removePurchasedCarFromShop(car)
          : _usedCarsScreenViewModel.removePurchasedCarFromShop(car);
    }
  }
}
