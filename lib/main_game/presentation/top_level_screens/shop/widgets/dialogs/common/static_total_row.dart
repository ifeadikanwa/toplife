import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StaticTotalRow extends ConsumerWidget {
  final int basePrice;

  const StaticTotalRow({
    Key? key,
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

    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   children: [
    //     const Text(
    //       ShopDialogConstants.total,
    //       style: TextStyle(fontWeight: FontWeight.bold),
    //     ),
    //     Text(
    //       "${getCurrencyLabelFromCurrencyString(currentCurrency)}$totalPrice",
    //     ),
    //   ],
    // );
  }
}
