import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/get/player_and_game/player_currency_provider.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/utils/money/money_constants.dart';

class MoneyTextField extends ConsumerWidget {
  final TextEditingController textEditingController;

  const MoneyTextField({
    super.key,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //
    final currencyProvider = ref.watch(playerCurrencyProvider);
    //
    //enough for millions. the commas are counted as characters, if we do less that nine, millions which needs 2 commas will get formatted wierd because it cuts off a zero to satisfy the character count
    const int maxCharacterLength = 9;

    //
    return currencyProvider.when(
      data: (currency) => TextField(
        controller: textEditingController,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          //only numbers
          FilteringTextInputFormatter.deny(TextConstants.dash),
          //no negatives
          FilteringTextInputFormatter.deny(
            TextConstants.fullStop, //no decimals
          ),
          MoneyConstants.defaultCurrencyTextInputFormatter,
          //add commas
        ],
        keyboardType: TextInputType.number,
        maxLength: maxCharacterLength,
        decoration: InputDecoration(
          hintText: TextConstants.enterAmount,
          prefixText: currency,
        ),
        style: DialogConstants.defaultBodyTextStyle,
      ),
      error: (error, stackTrace) => const SizedBox(),
      loading: () => const SizedBox(),
    );
  }
}
