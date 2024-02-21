import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_game_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/date_and_time/get_sentence_time.dart';
import 'package:toplife/core/utils/money/format_money_to_string.dart';
import 'package:toplife/core/utils/money/get_currency_label_from_country_string.dart';
import 'package:toplife/main_systems/system_location/util/get_country_economy_adjusted_price.dart';
import 'package:toplife/main_systems/system_person/constants/tattoo/tattoo_body_location.dart';
import 'package:toplife/main_systems/system_person/constants/tattoo/tattoo_shop.dart';
import 'package:toplife/main_systems/system_person/constants/tattoo/tattoo_size.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/tattoo_shop_details.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_person/util/tattoo_utils/tattoo_utils.dart';

final tattooShopDialogWidgetViewModelProvider = StateNotifierProvider<
    TattooShopDialogWidgetViewModel, AsyncValue<TattooShopDetails>>((ref) {
  return TattooShopDialogWidgetViewModel(
    personUsecases: ref.watch(personUsecasesProvider),
    currentPlayerFuture: ref.watch(currentPlayerProvider.future),
    currentGameFuture: ref.watch(currentGameProvider.future),
  );
});

class TattooShopDialogWidgetViewModel
    extends StateNotifier<AsyncValue<TattooShopDetails>> {
  //
  final PersonUsecases _personUsecases;
  //
  late final Game? _game;
  late final Person? _currentPlayer;
  String _playerCountry = "";
  int economyAdjustedCost = 0;

  TattooShopDialogWidgetViewModel({
    required PersonUsecases personUsecases,
    required Future<Person?> currentPlayerFuture,
    required Future<Game?> currentGameFuture,
  })  : _personUsecases = personUsecases,
        super(const AsyncLoading()) {
    _fetch(
      currentPlayerFuture: currentPlayerFuture,
      currentGameFuture: currentGameFuture,
    );
  }

  Future<void> _fetch({
    required Future<Person?> currentPlayerFuture,
    required Future<Game?> currentGameFuture,
  }) async {
    state = const AsyncLoading();

    //get current game
    _game = await currentGameFuture;

    //get current player
    final Person? currentPlayer = await currentPlayerFuture;

    //if we dont have a valid player, set state to null
    if (currentPlayer != null) {
      //set variable
      _currentPlayer = currentPlayer;
      //set player country
      _playerCountry = currentPlayer.currentCountry;
    }

    //set starting state
    state = await AsyncValue.guard(
      () async => const TattooShopDetails(
        tattooShop: TattooShop.fiveStars,
        tattooSize: TattooSize.large,
        tattooBodyLocation: TattooBodyLocation.hand,
      ),
    );
  }

  void updateTattooShop(TattooShop tattooShop) async {
    final TattooShopDetails? oldValue = state.valueOrNull;
    if (oldValue != null) {
      state = await AsyncValue.guard(
        () async => oldValue.copyWith(
          tattooShop: tattooShop,
        ),
      );
    }
  }

  void updateTattooSize(TattooSize tattooSize) async {
    final TattooShopDetails? oldValue = state.valueOrNull;
    if (oldValue != null) {
      state = await AsyncValue.guard(
        () async => oldValue.copyWith(
          tattooSize: tattooSize,
        ),
      );
    }
  }

  void updateTattooBodyLocation(TattooBodyLocation tattooBodyLocation) async {
    final TattooShopDetails? oldValue = state.valueOrNull;
    if (oldValue != null) {
      state = await AsyncValue.guard(
        () async => oldValue.copyWith(
          tattooBodyLocation: tattooBodyLocation,
        ),
      );
    }
  }

  String getCost() {
    final TattooShopDetails? tattooShopDetails = state.valueOrNull;

    if (tattooShopDetails != null) {
      final cost = getCountryEconomyAdjustedPrice(
          country: _playerCountry,
          basePrice: TattooUtils.getTattooBasePrice(
            tattooBodyLocation: tattooShopDetails.tattooBodyLocation,
            tattooSize: tattooShopDetails.tattooSize,
            tattooShop: tattooShopDetails.tattooShop,
          ));

      economyAdjustedCost = cost;

      return "${getCurrencyLabelFromCountryString(_playerCountry)}${formatMoneyToString(cost)}";
    }

    return "-";
  }

  String getDuration() {
    final TattooShopDetails? tattooShopDetails = state.valueOrNull;

    if (tattooShopDetails != null) {
      return getSentenceTime(
        timeInMinutes: tattooShopDetails.tattooSize.durationInMinutes,
      );
    }

    return "-";
  }

  int getTattooDescriptionLength() {
    return 100;
  }

  Future<void> getTattoo({
    required BuildContext context,
    required String tattooDescription,
  }) async {
    final TattooShopDetails? tattooShopDetails = state.valueOrNull;

    if (_game != null && _currentPlayer != null && tattooShopDetails != null) {
      _personUsecases.getTattooFromShopUsecase.execute(
        context: context,
        personID: _currentPlayer.id,
        gameID: _game.id,
        currentDay: _game.currentDay,
        economyAdjustedCost: economyAdjustedCost,
        chosenLocation: tattooShopDetails.tattooBodyLocation,
        tattooShop: tattooShopDetails.tattooShop,
        tattooSize: tattooShopDetails.tattooSize,
        tattooDescription: tattooDescription,
      );
    }
  }
}
