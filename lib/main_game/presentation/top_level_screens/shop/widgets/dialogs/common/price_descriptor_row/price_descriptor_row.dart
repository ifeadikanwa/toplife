import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/common/descriptor_row.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/common/price_descriptor_row/price_descriptor_row_view_model.dart';

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
    final priceDescriptorRowViewModelDataProvider =
        ref.watch(priceDescriptorRowViewModelProvider);

    return priceDescriptorRowViewModelDataProvider.when(
        data: (priceDescriptorRowViewModel) {
          return DescriptorRow(
            descriptor: descriptor,
            value: priceDescriptorRowViewModel.getEconomyAdjustedPrice(
              basePrice: basePrice,
            ),
          );
        },
        loading: () => const DescriptorRow(
              descriptor: TextConstants.dash,
              value: TextConstants.dash,
            ),
        error: (error, stackTrace) => Container());
  }
}
