import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/common_states/get/player_and_game/formatted_money_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_game_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/date_and_time/get_sentence_time.dart';
import 'package:toplife/main_systems/system_person/constants/piercing/piercing_body_location.dart';
import 'package:toplife/main_systems/system_person/constants/piercing/piercing_constants.dart';

part 'piercing_shop_dialog_widget_view_model.g.dart';

//Piercing shop widget data class
@CopyWith()
class PiercingShopWidgetData extends Equatable {
  final PiercingBodyLocation chosenPiercingLocation;
  final List<PiercingBodyLocation> availablePiercingLocations;
  final String chosenPiercingLocationPrice;
  final String piercingDuration;

  const PiercingShopWidgetData({
    required this.chosenPiercingLocation,
    required this.availablePiercingLocations,
    required this.chosenPiercingLocationPrice,
    required this.piercingDuration,
  });

  @override
  List<Object?> get props => [
        chosenPiercingLocation,
        availablePiercingLocations,
        chosenPiercingLocationPrice,
        piercingDuration,
      ];
}

//VIEWMODEL
@riverpod
class PiercingShopDialogWidgetViewModel
    extends _$PiercingShopDialogWidgetViewModel {
  static const adjustPiercingCostToEconomy = true;

  @override
  Future<PiercingShopWidgetData?> build() async {
    //get current player id
    final int? currentPlayerId = await ref.watch(
      currentPlayerProvider.selectAsync(
        (data) => data?.id,
      ),
    );

    //if we have a valid player id
    if (currentPlayerId != null) {
      //get available locations
      final List<PiercingBodyLocation> availableLocations = await ref
          .watch(personUsecasesProvider)
          .getPersonAvailablePiercingLocationsUsecase
          .execute(
            personID: currentPlayerId,
          );

      //if there are available locations
      if (availableLocations.isNotEmpty) {
        //set chosen as the first location
        final PiercingBodyLocation chosenLocation = availableLocations.first;
        //get the formatted cost
        final String chosenLocationPrice = await ref.watch(
          formattedMoneyProvider(
            amount: chosenLocation.basePrice,
            adjustToEconomy: adjustPiercingCostToEconomy,
          ).future,
        );
        //return the data
        return PiercingShopWidgetData(
          chosenPiercingLocation: chosenLocation,
          availablePiercingLocations: availableLocations,
          chosenPiercingLocationPrice: chosenLocationPrice,
          piercingDuration: getSentenceTime(
            timeInMinutes: PiercingConstants.piercingDurationInMinutes,
          ),
        );
      }
    }

    //if we can't get a valid result
    return null;
  }

  Future<void> updateChosenLocation(
    PiercingBodyLocation piercingBodyLocation,
  ) async {
    //get price for new location
    final String chosenLocationPrice = await ref.read(
      formattedMoneyProvider(
        amount: piercingBodyLocation.basePrice,
        adjustToEconomy: adjustPiercingCostToEconomy,
      ).future,
    );
    //get the current state of the provider
    final PiercingShopWidgetData? currentValue = state.valueOrNull;

    if (currentValue != null) {
      state = AsyncData(
        currentValue.copyWith(
          chosenPiercingLocation: piercingBodyLocation,
          chosenPiercingLocationPrice: chosenLocationPrice,
        ),
      );
    }
  }

  Future<void> getPiercing() async {
    //get current value, player and game
    final PiercingShopWidgetData? currentValue = state.valueOrNull;
    final Person? currentPlayer = await ref.read(currentPlayerProvider.future);
    final Game? currentGame = await ref.read(currentGameProvider.future);

    if (currentValue != null && currentPlayer != null && currentGame != null) {
      ref.read(personUsecasesProvider).getPiercingFromShopUsecase.execute(
            personID: currentPlayer.id,
            gameID: currentGame.id,
            currentDay: currentGame.currentDay,
            chosenLocation: currentValue.chosenPiercingLocation,
          );
    }
  }
}
