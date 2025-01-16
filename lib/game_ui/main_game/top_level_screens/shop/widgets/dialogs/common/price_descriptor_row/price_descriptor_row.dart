import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/get/player_and_game/formatted_money_provider.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/dialogs/common/descriptor_row.dart';

class PriceDescriptorRow extends ConsumerWidget {
  final String descriptor;
  final int basePrice;

  const PriceDescriptorRow({
    super.key,
    required this.descriptor,
    required this.basePrice,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //adjust and format base price
    final formattedPriceProvider = ref.watch(
      formattedMoneyProvider(
        amount: basePrice,
        adjustToEconomy: true,
      ),
    );

    return formattedPriceProvider.when(
        data: (formattedPrice) {
          return DescriptorRow(
            descriptor: descriptor,
            value: formattedPrice,
          );
        },
        loading: () => const DescriptorRow(
              descriptor: TextConstants.dash,
              value: TextConstants.dash,
            ),
        error: (error, stackTrace) => const SizedBox());
  }
}
