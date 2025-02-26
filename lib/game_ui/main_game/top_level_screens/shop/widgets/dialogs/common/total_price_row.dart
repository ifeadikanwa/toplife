import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/dialogs/common/price_descriptor_row/price_descriptor_row.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/dialogs/constants/shop_dialog_constants.dart';

class TotalPriceRow extends ConsumerWidget {
  final int basePrice;

  const TotalPriceRow({
    super.key,
    required this.basePrice,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PriceDescriptorRow(
      descriptor: ShopDialogConstants.total,
      basePrice: basePrice,
    );
  }
}
