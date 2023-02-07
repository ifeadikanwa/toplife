import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/utils/money/get_currency_label_from_currency_string.dart';
import 'package:toplife/game_manager/presentation/game_states.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/common/descriptor_row.dart';
import 'package:toplife/main_systems/system_location/util/get_country_economy_adjusted_price.dart';

class PriceDescriptorRow extends ConsumerWidget {
  final String descriptor;
  final int basePrice;

  const PriceDescriptorRow({
    Key? key,
    required this.descriptor,
    required this.basePrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? currentCurrency =
        ref.watch(currentPlayerCurrencyProvider).valueOrNull;
    final String? currentPlayerCountry =
        ref.watch(currentPlayerCountryProvider).valueOrNull;

    final int totalPrice = currentPlayerCountry != null
        ? getCountryEconomyAdjustedPrice(
            country: currentPlayerCountry,
            basePrice: basePrice,
          )
        : basePrice;

    return DescriptorRow(
      descriptor: descriptor,
      value:
          "${getCurrencyLabelFromCurrencyString(currentCurrency)}$totalPrice",
    );
  }
}
