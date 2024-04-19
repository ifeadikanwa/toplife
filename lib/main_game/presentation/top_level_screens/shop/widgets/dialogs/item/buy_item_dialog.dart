import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/common/simple_buy_dialog/simple_buy_dialog.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/item/buy_item_dialog_view_model.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_count_label.dart';

class BuyItemDialog extends ConsumerWidget {
  final Item item;

  const BuyItemDialog({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SimpleBuyDialog(
      title: item.name,
      subtitle1: getCountLabel(counts: item.count),
      basePrice: item.basePrice,
      onCheckout: (int quantity) {
        ref
            .read(buyItemDialogViewModelProvider.notifier)
            .checkoutItem(item, quantity);
      },
    );
  }
}
