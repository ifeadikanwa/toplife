import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    return Container();
    // final String? currentCurrency =
    //     ref.watch(currentPlayerCurrencyProvider).valueOrNull;
    // final String? currentPlayerCountry =
    //     ref.watch(currentPlayerCountryProvider).valueOrNull;

    // final int totalPrice = currentPlayerCountry != null
    //     ? getCountryEconomyAdjustedPrice(
    //         country: currentPlayerCountry,
    //         basePrice: basePrice,
    //       )
    //     : basePrice;

    // return DescriptorRow(
    //   descriptor: descriptor,
    //   value:
    //       "${getCurrencyLabelFromCurrencyString(currentCurrency)}$totalPrice",
    // );
  }
}
