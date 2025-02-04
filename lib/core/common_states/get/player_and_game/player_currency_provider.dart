import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/utils/money/get_currency_label_from_country_string.dart';

part "player_currency_provider.g.dart";

@riverpod
Future<String> playerCurrency(PlayerCurrencyRef ref) async {
  //watch only the player current country
  final String? playerCountry = await ref.watch(
    currentPlayerProvider.selectAsync(
      (player) => player?.currentCountry,
    ),
  );

  //get the currency using the player country
  final String playerCurrency = (playerCountry == null)
      ? TextConstants.dash
      : getCurrencyLabelFromCountryString(playerCountry);

  //return
  return playerCurrency;
}
