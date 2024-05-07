import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/shop_and_storage/shop_and_storage_dependencies_providers.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/sub_screens/house/tab_screens/purchase_houses_screen/purchase_houses_screen_view_model.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/util/get_house_storage_change_label.dart';

part 'buy_house_dialog_view_model.g.dart';

class BuyHouseDialogData extends Equatable {
  final String homeStorageChangeLabel;

  const BuyHouseDialogData({
    required this.homeStorageChangeLabel,
  });

  @override
  List<Object?> get props => [
        homeStorageChangeLabel,
      ];
}

@riverpod
class BuyHouseDialogViewModel extends _$BuyHouseDialogViewModel {
  @override
  Future<BuyHouseDialogData?> build({required int newHouseStorage}) async {
    final int? currentPlayerId = await ref.watch(
      currentPlayerProvider.selectAsync((data) => data?.id),
    );

    if (currentPlayerId != null) {
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

      return BuyHouseDialogData(homeStorageChangeLabel: storageChangeLabel);
    }

    return null;
  }

  void purchaseHouse(
    House house,
  ) async {
    final int? currentPlayerId = await ref.read(
      currentPlayerProvider.selectAsync((data) => data?.id),
    );

    if (currentPlayerId != null) {
      final bool purchaseSuccessful = await ref
          .read(shopAndStorageUsecasesProvider)
          .purchaseHouseFullyPaidUsecase
          .execute(
            house: house,
            personID: currentPlayerId,
          );

      if (purchaseSuccessful) {
        ref
            .read(purchaseHousesScreenViewModelProvider.notifier)
            .removePurchasedHouseFromShop(house);
      }
    }
  }
}
