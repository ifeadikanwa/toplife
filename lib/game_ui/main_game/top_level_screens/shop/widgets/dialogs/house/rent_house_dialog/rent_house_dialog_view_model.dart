import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/shop_and_storage/shop_and_storage_dependencies_providers.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/sub_screens/house/tab_screens/rental_houses_screen/rental_houses_screen_view_model.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/house_constants.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/util/get_house_storage_change_label.dart';

part 'rent_house_dialog_view_model.g.dart';

@CopyWith()
class RentHouseDialogData extends Equatable {
  final int chosenLeaseDuration;
  final String homeStorageChangeLabel;
  final int totalRentBasePrice;

  const RentHouseDialogData({
    required this.chosenLeaseDuration,
    required this.homeStorageChangeLabel,
    required this.totalRentBasePrice,
  });

  @override
  List<Object?> get props => [
        chosenLeaseDuration,
        homeStorageChangeLabel,
        totalRentBasePrice,
      ];
}

@riverpod
class RentHouseDialogViewModel extends _$RentHouseDialogViewModel {
  @override
  Future<RentHouseDialogData?> build({
    required int newHouseBasePrice,
    required int newHouseStorage,
  }) async {
    final int? currentPlayerId = await ref.watch(
      currentPlayerProvider.selectAsync((data) => data?.id),
    );

    if (currentPlayerId != null) {
      //total base price is rent * 2 (this means deposit + first rent)
      final totalRentBasePrice = newHouseBasePrice * 2;

      //storage change label
      //get current storage
      final int currentStorage = await ref
          .watch(shopAndStorageUsecasesProvider)
          .getCurrentHouseStorageSpaceUsecase
          .execute(personID: currentPlayerId);
      final storageChangeLabel = getHouseStorageChangeLabel(
        newHouseStorage: newHouseStorage,
        currentHouseStorage: currentStorage,
      );

      return RentHouseDialogData(
        chosenLeaseDuration: HouseConstants.minLeaseAgreementDuration,
        homeStorageChangeLabel: storageChangeLabel,
        totalRentBasePrice: totalRentBasePrice,
      );
    }

    return null;
  }

  void rentHouse(House house) async {
    final int? currentPlayerId = await ref.read(
      currentPlayerProvider.selectAsync((data) => data?.id),
    );

    final RentHouseDialogData? currentState = state.valueOrNull;

    if (currentPlayerId != null && currentState != null) {
      final bool rentSuccessful = await ref
          .read(shopAndStorageUsecasesProvider)
          .rentHouseUsecase
          .execute(
            house: house,
            personID: currentPlayerId,
            leaseDuration: currentState.chosenLeaseDuration,
          );

      if (rentSuccessful) {
        ref
            .read(rentalHousesScreenViewModelProvider.notifier)
            .removeRentedHouseFromShop(house);
      }
    }
  }

  void increaseLeaseDuration() {
    final RentHouseDialogData? currentState = state.valueOrNull;

    if (currentState != null) {
      final int currentLeaseDuration = currentState.chosenLeaseDuration;
      //
      if (currentLeaseDuration < HouseConstants.maxLeaseAgreementDuration) {
        state = AsyncData(
          currentState.copyWith(
              chosenLeaseDuration: currentLeaseDuration +
                  HouseConstants.leaseAgreementDurationIncrement),
        );
      }
    }
  }

  void decreaseLeaseDuration() {
    final RentHouseDialogData? currentState = state.valueOrNull;

    if (currentState != null) {
      final int currentLeaseDuration = currentState.chosenLeaseDuration;
      //
      if (currentLeaseDuration > HouseConstants.minLeaseAgreementDuration) {
        state = AsyncData(
          currentState.copyWith(
              chosenLeaseDuration: currentLeaseDuration -
                  HouseConstants.leaseAgreementDurationIncrement),
        );
      }
    }
  }
}
