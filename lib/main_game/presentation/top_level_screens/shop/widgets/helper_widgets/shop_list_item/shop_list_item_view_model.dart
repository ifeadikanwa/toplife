import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/get/player_and_game/current_player_bar_info_provider.dart';
import 'package:toplife/core/utils/money/format_money_to_string.dart';
import 'package:toplife/main_systems/system_location/util/get_country_economy_adjusted_price.dart';

final shopListItemViewModelProvider =
    StateNotifierProvider<ShopListItemViewModel, AsyncValue<String>>((ref) {
  //get recent
  final currentCurrencyFuture = ref.watch(
    currentPlayerBarInfoProvider
        .selectAsync((playerBarInfo) => playerBarInfo.currency),
  );
  final currentCountryFuture = ref.watch(
    currentPlayerBarInfoProvider
        .selectAsync((playerBarInfo) => playerBarInfo.country),
  );

  return ShopListItemViewModel(
    currentCurrencyFuture: currentCurrencyFuture,
    currentCountryFuture: currentCountryFuture,
  );
});

class ShopListItemViewModel extends StateNotifier<AsyncValue<String>> {
  late final String _playerCountry;

  ShopListItemViewModel({
    required Future<String> currentCurrencyFuture,
    required Future<String> currentCountryFuture,
  }) : super(const AsyncLoading()) {
    _fetch(
      currentCurrencyFuture: currentCurrencyFuture,
      currentCountryFuture: currentCountryFuture,
    );
  }

  Future<void> _fetch({
    required Future<String> currentCurrencyFuture,
    required Future<String> currentCountryFuture,
  }) async {
    //set player country
    _playerCountry = await currentCountryFuture;

    //set state
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => currentCurrencyFuture);
  }

  String getEconomyAdjustedItemPrice({required int itemBasePrice}) {
    //player country from currentPlayerBarInfoProvider can be an empty string.
    //We don't have to worry because this funtion handles situations where we dont have a valid country
    return formatMoneyToString(
      getCountryEconomyAdjustedPrice(
        country: _playerCountry,
        basePrice: itemBasePrice,
      ),
    );
  }
}
