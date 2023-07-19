import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_game_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/date_and_time/get_sentence_time.dart';
import 'package:toplife/core/utils/money/format_money_to_string.dart';
import 'package:toplife/core/utils/money/get_currency_label_from_country_string.dart';
import 'package:toplife/main_systems/system_location/util/get_country_economy_adjusted_price.dart';
import 'package:toplife/main_systems/system_person/constants/piercing/piercing_body_location.dart';
import 'package:toplife/main_systems/system_person/constants/piercing/piercing_constants.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/chosen_and_available_piercing_locations_pair.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';

final piercingShopDialogWidgetViewModelProvider =
    StateNotifierProvider.autoDispose<PiercingShopDialogWidgetViewModel,
        AsyncValue<ChosenAndAvailablePiercingLocationsPair?>>((ref) {
  //
  return PiercingShopDialogWidgetViewModel(
    personUsecases: ref.watch(personUsecasesProvider),
    relationshipUsecases: ref.watch(relationshipUsecasesProvider),
    currentPlayerFuture: ref.watch(currentPlayerProvider.future),
    currentGameFuture: ref.watch(currentGameProvider.future),
  );
});

class PiercingShopDialogWidgetViewModel extends StateNotifier<
    AsyncValue<ChosenAndAvailablePiercingLocationsPair?>> {
  //
  final PersonUsecases _personUsecases;
  final RelationshipUsecases _relationshipUsecases;
  //
  late final Game? _game;
  String _playerCountry = "";

  //
  PiercingShopDialogWidgetViewModel({
    required PersonUsecases personUsecases,
    required RelationshipUsecases relationshipUsecases,
    required Future<Person?> currentPlayerFuture,
    required Future<Game?> currentGameFuture,
  })  : _personUsecases = personUsecases,
        _relationshipUsecases = relationshipUsecases,
        super(const AsyncLoading()) {
    //
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
    if (currentPlayer == null) {
      state = await AsyncValue.guard(() async => null);
    }
    //we have a valid player
    else {
      //set player country
      _playerCountry = currentPlayer.currentCountry;

      //get available locations
      final List<PiercingBodyLocation> availableLocations =
          await _personUsecases.getPersonAvailablePiercingLocationsUsecase
              .execute(
        personID: currentPlayer.id,
      );

      //if there is no available location, we have nothing to show
      if (availableLocations.isEmpty) {
        state = await AsyncValue.guard(() async => null);
      } else {
        // if there are available locations, set state value to it
        state = await AsyncValue.guard(
          () async => ChosenAndAvailablePiercingLocationsPair(
            chosenPiercingLocation: availableLocations.first,
            availablePiercingLocations: availableLocations,
          ),
        );
      }
    }
  }

  void updateChosenLocation(PiercingBodyLocation piercingBodyLocation) async {
    final ChosenAndAvailablePiercingLocationsPair? currentValue =
        state.valueOrNull;

    if (currentValue != null) {
      state = await AsyncValue.guard(
        () async => ChosenAndAvailablePiercingLocationsPair(
          chosenPiercingLocation: piercingBodyLocation,
          availablePiercingLocations: currentValue.availablePiercingLocations,
        ),
      );
    }
  }

  String getCost() {
    final int? basePrice = state.valueOrNull?.chosenPiercingLocation.basePrice;

    // final int? basePrice = (state.valueOrNull != null)
    //     ? PiercingUtils.getPiercingBasePrice(
    //         chosenLocation: state.valueOrNull!.chosenPiercingLocation)
    //     : null;

    if (basePrice != null) {
      return "${getCurrencyLabelFromCountryString(_playerCountry)}${formatMoneyToString(getCountryEconomyAdjustedPrice(
        country: _playerCountry,
        basePrice: basePrice,
      ))}";
    } else {
      return "${getCurrencyLabelFromCountryString(_playerCountry)}0";
    }
  }

  String getDuration() {
    return getSentenceTime(
      timeInMinutes: PiercingConstants.piercingDurationInMinutes,
    );
  }

  Future<void> getPiercing({
    required BuildContext context,
  }) async {
    if (_game != null && state.valueOrNull != null) {
      _personUsecases.getPiercingFromShopUsecase.execute(
        context: context,
        personID: _game!.currentPlayerID,
        gameID: _game!.id,
        currentDay: _game!.currentDay,
        chosenLocation: state.valueOrNull!.chosenPiercingLocation,
        relationshipUsecases: _relationshipUsecases,
      );
    }
  }
}
