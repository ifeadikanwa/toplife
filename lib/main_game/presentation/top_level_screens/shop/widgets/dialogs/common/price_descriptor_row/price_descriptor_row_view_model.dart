import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/get/player_and_game/current_player_bar_info_provider.dart';
import 'package:toplife/core/utils/money/format_money_to_string.dart';
import 'package:toplife/main_systems/system_location/util/get_country_economy_adjusted_price.dart';

final priceDescriptorRowViewModelProvider =
    FutureProvider<PriceDescriptorRowViewModel>((ref) async {
  //get recent
  final currentCurrency = await ref.watch(
    currentPlayerBarInfoProvider
        .selectAsync((playerBarInfo) => playerBarInfo.currency),
  );
  final currentCountry = await ref.watch(
    currentPlayerBarInfoProvider
        .selectAsync((playerBarInfo) => playerBarInfo.country),
  );

  return PriceDescriptorRowViewModel(
    currentCountry: currentCountry,
    currentCurrency: currentCurrency,
  );
});

class PriceDescriptorRowViewModel {
  late final String _currentCurrency;
  late final String _currentCountry;

  PriceDescriptorRowViewModel({
    required String currentCountry,
    required String currentCurrency,
  })  : _currentCountry = currentCountry,
        _currentCurrency = currentCurrency;

  String getEconomyAdjustedPrice({required int basePrice}) {
    final int adjustedPrice = getCountryEconomyAdjustedPrice(
      country: _currentCountry,
      basePrice: basePrice,
    );

    final String formattedAdjustedPrice = formatMoneyToString(adjustedPrice);

    return "$_currentCurrency$formattedAdjustedPrice";
  }
}
