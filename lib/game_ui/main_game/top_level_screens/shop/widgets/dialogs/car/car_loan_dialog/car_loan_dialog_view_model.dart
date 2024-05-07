import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/shop_and_storage/shop_and_storage_dependencies_providers.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/sub_screens/car/tab_screens/new_cars_screen/new_cars_screen_view_model.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/sub_screens/car/tab_screens/used_cars_screen/used_cars_screen_view_model.dart';
import 'package:toplife/game_systems/main_systems/system_recurring_bills_and_loans/domain/model/info_models/economy_adjusted_loan_information.dart';

part 'car_loan_dialog_view_model.g.dart';

@riverpod
class CarLoanDialogViewModel extends _$CarLoanDialogViewModel {
  @override
  void build() {}

  void applyForCarLoan(
    Car car,
    EconomyAdjustedLoanInformation economyAdjustedLoanInformation,
  ) async {
    //
    final int? currentPlayerId = await ref.read(
      currentPlayerProvider.selectAsync((data) => data?.id),
    );

    //
    if (currentPlayerId != null) {
      //
      final bool purchaseSuccessful = await ref
          .read(shopAndStorageUsecasesProvider)
          .purchaseCarWithLoanUsecase
          .execute(
            car: car,
            personID: currentPlayerId,
            economyAdjustedLoanInformation: economyAdjustedLoanInformation,
          );

      //if purchase is successful, ask responsible view model to remove the car from the shop
      if (purchaseSuccessful) {
        //new cars have 100% condition at purchase
        (car.maxConditionAtPurchase == defaultMaxStatsValue)
            ? ref
                .read(newCarsScreenViewModelProvider.notifier)
                .removePurchasedCarFromShop(car)
            : ref
                .read(usedCarsScreenViewModelProvider.notifier)
                .removePurchasedCarFromShop(car);
      }
    }
  }
}
