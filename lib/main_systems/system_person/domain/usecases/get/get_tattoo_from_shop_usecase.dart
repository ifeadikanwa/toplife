import 'package:flutter/material.dart';
import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/result_dialog.dart';
import 'package:toplife/core/utils/chance.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/constants/tattoo/tattoo_body_location.dart';
import 'package:toplife/main_systems/system_person/constants/tattoo/tattoo_quality.dart';
import 'package:toplife/main_systems/system_person/constants/tattoo/tattoo_shop.dart';
import 'package:toplife/main_systems/system_person/constants/tattoo/tattoo_size.dart';
import 'package:toplife/main_systems/system_person/domain/repository/tattoo_repository.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_money/check_if_player_can_afford_it_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_money/take_money_from_player_usecase.dart';

class GetTattooFromShopUsecase {
  final TattooRepository _tattooRepository;
  final CheckIfPlayerCanAffordItUsecase _checkIfPlayerCanAffordItUsecase;
  final TakeMoneyFromPlayerUsecase _takeMoneyFromPlayerUsecase;
  final JournalUsecases _journalUsecases;

  const GetTattooFromShopUsecase(
    this._tattooRepository,
    this._checkIfPlayerCanAffordItUsecase,
    this._takeMoneyFromPlayerUsecase,
    this._journalUsecases,
  );

  Future<void> execute({
    required BuildContext context,
    required int personID,
    required int gameID,
    required int currentDay,
    required int economyAdjustedCost,
    required TattooBodyLocation chosenLocation,
    required TattooShop tattooShop,
    required TattooSize tattooSize,
    required String tattooDescription,
  }) async {
    //entries
    late final String resultTitle;
    late final String resultDescription;
    late final String journalEntry;

    //check if person can afford tattoo
    final bool playerCanAffordTattoo =
        await _checkIfPlayerCanAffordItUsecase.execute(
      personID: personID,
      basePrice: economyAdjustedCost,
      adjustToEconomy: false,
    );

    //player can NOT afford it
    if (!playerCanAffordTattoo) {
      //set entries
      resultTitle = "Where's the money?";
      resultDescription =
          "You do not have enough money to pay for a ${tattooSize.presentationName.toLowerCase()} tattoo of: \"$tattooDescription\" on your ${chosenLocation.presentationName.toLowerCase()}.";
      journalEntry =
          "I tried to get a ${tattooSize.presentationName.toLowerCase()} tattoo of: \"$tattooDescription\" on my ${chosenLocation.presentationName.toLowerCase()} but I don't have enough money.";
    }
    //player can afford it
    else {
      //take money
      await _takeMoneyFromPlayerUsecase.execute(
        mainPlayerID: personID,
        baseAmountToTake: economyAdjustedCost,
        adjustToEconomy: false,
      );

      //get quality
      late final TattooQuality tattooQuality;

      //is tattoo botched?
      final bool botchedQuality = Chance.getTrueOrFalseBasedOnPercentageChance(
        trueChancePercentage: tattooShop.botchedChance,
      );

      if (botchedQuality) {
        tattooQuality = TattooQuality.botched;
      } else {
        //is tattoo artistic?
        final bool artisticQuality =
            Chance.getTrueOrFalseBasedOnPercentageChance(
          trueChancePercentage: tattooShop.artisticChance,
        );

        tattooQuality =
            (artisticQuality) ? TattooQuality.artistic : TattooQuality.simple;
      }

      //add tattoo to database
      await _tattooRepository.createTattoo(
        Tattoo(
          id: DatabaseConstants.dummyId,
          personId: personID,
          description: tattooDescription,
          location: chosenLocation.name,
          size: tattooSize.name,
          dayObtained: currentDay,
          quality: tattooQuality.name,
        ),
      );

      //set entries
      resultTitle = "Tatted Up!";
      resultDescription =
          "Your ${tattooQuality.name.toLowerCase()} ${chosenLocation.presentationName.toLowerCase()} tattoo of: \"$tattooDescription\" is complete.";
      journalEntry =
          "I got ${tattooQuality.presentationName.toLowerCase()}, ${tattooSize.presentationName.toLowerCase()} tattoo of: \"$tattooDescription\" on my ${chosenLocation.presentationName.toLowerCase()}.";
    }

    //log in journal
    await _journalUsecases.addToJournalUsecase.execute(
      gameID: gameID,
      day: currentDay,
      mainPlayerID: personID,
      entry: journalEntry,
    );

    //return result dialog
    if (context.mounted) {
      return ResultDialog.show(
        context: context,
        title: resultTitle,
        result: resultDescription,
      );
    }
  }
}
