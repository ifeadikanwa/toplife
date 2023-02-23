import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_manager/presentation/game_states.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/common/simple_buy_dialog.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_count_label.dart';

class BuyItemDialog extends ConsumerWidget {
  final Item item;
  const BuyItemDialog({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ShopAndStorageUsecases shopAndStorageUsecases =
        ref.watch(shopAndStorageUsecaseProvider);
    final currentGame = ref.watch(currentGameProvider).valueOrNull;

    return (currentGame != null)
        ? SimpleBuyDialog(
            title: item.name,
            subtitle1: getCountLabel(counts: item.count),
            basePrice: item.basePrice,
            onCheckout: (int quantity) {
              shopAndStorageUsecases.purchaseItemUsecase.execute(
                context: context,
                personID: currentGame.currentPlayerID,
                item: item,
                quantity: quantity,
              );
            },
          )
        : Container();
  }
}
