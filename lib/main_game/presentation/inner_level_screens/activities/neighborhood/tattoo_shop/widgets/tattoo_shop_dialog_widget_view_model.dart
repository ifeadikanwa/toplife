import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/common_states/get/player_and_game/formatted_money_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_game_provider.dart';
import 'package:toplife/core/common_states/watch/player_and_game/current_player_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/date_and_time/get_sentence_time.dart';
import 'package:toplife/main_systems/system_person/constants/tattoo/tattoo_body_location.dart';
import 'package:toplife/main_systems/system_person/constants/tattoo/tattoo_shop.dart';
import 'package:toplife/main_systems/system_person/constants/tattoo/tattoo_size.dart';
import 'package:toplife/main_systems/system_person/util/tattoo_utils/tattoo_utils.dart';

part 'tattoo_shop_dialog_widget_view_model.g.dart';

@CopyWith()
class TattooShopWidgetData extends Equatable {
  final TattooShop tattooShop;
  final TattooSize tattooSize;
  final TattooBodyLocation tattooBodyLocation;
  final String chosenTattooPrice;
  final String tattooDuration;
  final int tattooDescriptionLength;

  const TattooShopWidgetData({
    required this.tattooShop,
    required this.tattooSize,
    required this.tattooBodyLocation,
    required this.chosenTattooPrice,
    required this.tattooDuration,
    required this.tattooDescriptionLength,
  });

  @override
  List<Object?> get props => [
        tattooShop,
        tattooSize,
        tattooBodyLocation,
        chosenTattooPrice,
        tattooDuration,
        tattooDescriptionLength,
      ];
}

//VIEWMODEL
@riverpod
class TattooShopDialogWidgetViewModel
    extends _$TattooShopDialogWidgetViewModel {
  static const adjustTattooCostToEconomy = true;

  @override
  Future<TattooShopWidgetData> build() async {
    //set chosen location
    const TattooBodyLocation chosenLocation = TattooBodyLocation.hand;
    const TattooSize chosenSize = TattooSize.medium;
    const TattooShop chosenShop = TattooShop.fiveStars;
    //get the formatted cost
    final String chosenTattooPrice = await ref.watch(
      formattedMoneyProvider(
        amount: TattooUtils.getTattooBasePrice(
          tattooBodyLocation: chosenLocation,
          tattooSize: chosenSize,
          tattooShop: chosenShop,
        ),
        adjustToEconomy: adjustTattooCostToEconomy,
      ).future,
    );
    //return
    return TattooShopWidgetData(
      tattooShop: chosenShop,
      tattooSize: chosenSize,
      tattooBodyLocation: chosenLocation,
      chosenTattooPrice: chosenTattooPrice,
      tattooDuration: getSentenceTime(
        timeInMinutes: chosenSize.durationInMinutes,
      ),
      tattooDescriptionLength: 100,
    );
  }

  Future<void> updateTattooDetail({
    TattooSize? tattooSize,
    TattooShop? tattooShop,
    TattooBodyLocation? tattooBodyLocation,
  }) async {
    //get the current state of the provider
    final TattooShopWidgetData? currentValue = state.valueOrNull;

    if (currentValue != null) {
      //get updated price
      final String updatedPrice = await ref.read(
        formattedMoneyProvider(
          amount: TattooUtils.getTattooBasePrice(
            tattooBodyLocation:
                tattooBodyLocation ?? currentValue.tattooBodyLocation,
            tattooSize: tattooSize ?? currentValue.tattooSize,
            tattooShop: tattooShop ?? currentValue.tattooShop,
          ),
          adjustToEconomy: adjustTattooCostToEconomy,
        ).future,
      );

      //update the state
      state = AsyncData(
        currentValue.copyWith(
          tattooSize: tattooSize,
          tattooShop: tattooShop,
          tattooBodyLocation: tattooBodyLocation,
          tattooDuration: (tattooSize != null)
              ? getSentenceTime(
                  timeInMinutes: tattooSize.durationInMinutes,
                )
              : null,
          chosenTattooPrice: updatedPrice,
        ),
      );
    }
  }

  Future<void> getTattoo({required String tattooDescription}) async {
    // get current value, player and game
    final TattooShopWidgetData? currentValue = state.valueOrNull;
    final Person? currentPlayer = await ref.read(currentPlayerProvider.future);
    final Game? currentGame = await ref.read(currentGameProvider.future);

    if (currentValue != null && currentPlayer != null && currentGame != null) {
      ref.read(personUsecasesProvider).getTattooFromShopUsecase.execute(
            personID: currentPlayer.id,
            gameID: currentGame.id,
            currentDay: currentGame.currentDay,
            tattooBodyLocation: currentValue.tattooBodyLocation,
            tattooShop: currentValue.tattooShop,
            tattooSize: currentValue.tattooSize,
            tattooDescription: tattooDescription,
          );
    }
  }
}
