import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/utils/money/get_currency_and_money_string.dart';

part 'formatted_money_provider.g.dart';

@riverpod
Future<String> formattedMoney(
  FormattedMoneyRef ref, {
  required int amount,
  required bool adjustToEconomy,
}) async {
  //get the player current country
  final String? playerCountry = await ref.watch(
    currentPlayerProvider.selectAsync(
      (data) => data?.currentCountry,
    ),
  );

  //if the country is null, return dash string
  //else return the currency and money string
  return (playerCountry == null)
      ? TextConstants.dash
      : getCurrencyAndMoneyString(
          country: playerCountry,
          amount: amount,
          adjustToEconomy: adjustToEconomy,
        );
}
