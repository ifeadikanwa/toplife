import 'package:flutter/material.dart';
import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/result_dialog.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/constants/piercing/piercing_body_location.dart';
import 'package:toplife/main_systems/system_person/domain/repository/piercing_repository.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_money/check_if_player_can_afford_it_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_money/take_money_from_player_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';

class GetPiercingFromShopUsecase {
  final PiercingRepository _piercingRepository;
  final CheckIfPlayerCanAffordItUsecase _checkIfPlayerCanAffordItUsecase;
  final TakeMoneyFromPlayerUsecase _takeMoneyFromPlayerUsecase;
  final JournalUsecases _journalUsecases;

  const GetPiercingFromShopUsecase(
    this._piercingRepository,
    this._checkIfPlayerCanAffordItUsecase,
    this._takeMoneyFromPlayerUsecase,
    this._journalUsecases,
  );

  Future<void> execute({
    required BuildContext context,
    required int personID,
    required int gameID,
    required int currentDay,
    required PiercingBodyLocation chosenLocation,
    required RelationshipUsecases relationshipUsecases,
  }) async {
    //entries
    late final String resultTitle;
    late final String resultDescription;
    late final String journalEntry;

    //check if person has piercing in the chosen location
    final List<Piercing> allPersonPiercings =
        await _piercingRepository.getAllPiercings(personID);

    final bool personAlreadyHasPiercing = allPersonPiercings
        .where((piercing) => piercing.location == chosenLocation.name)
        .isNotEmpty;

    //person already has piercings
    if (personAlreadyHasPiercing) {
      //set entries
      resultTitle = "What's That?";
      resultDescription =
          "You have an existing piercing on your ${chosenLocation.presentationName.toLowerCase()}.";
      journalEntry =
          "I tried to get a piercing on my ${chosenLocation.presentationName.toLowerCase()} but I already have one there.";
    }
    //person doesnt have piercings
    else {
      //check if person can afford piercing
      final bool playerCanAffordPiercing =
          await _checkIfPlayerCanAffordItUsecase.execute(
        relationshipUsecases: relationshipUsecases,
        personID: personID,
        basePrice: chosenLocation.basePrice,
        adjustToEconomy: true,
      );

      //player can NOT afford it
      if (!playerCanAffordPiercing) {
        //set entries
        resultTitle = "Where's the money?";
        resultDescription =
            "You do not have enough money to pay for your ${chosenLocation.presentationName.toLowerCase()} piercing.";
        journalEntry =
            "I tried to get a piercing on my ${chosenLocation.presentationName.toLowerCase()} but I don't have enough money.";
      }
      //player can afford it
      else {
        //take money
        await _takeMoneyFromPlayerUsecase.execute(
          relationshipUsecases: relationshipUsecases,
          mainPlayerID: personID,
          baseAmountToTake: chosenLocation.basePrice,
          adjustToEconomy: true,
        );

        //add piercing to database
        await _piercingRepository.createPiercing(
          Piercing(
            id: DatabaseConstants.dummyId,
            personId: personID,
            location: chosenLocation.name,
            dayObtained: currentDay,
          ),
        );

        //set entries
        resultTitle = "Pierced Up!";
        resultDescription =
            "Your ${chosenLocation.presentationName.toLowerCase()} piercing is complete.";
        journalEntry =
            "I pierced my ${chosenLocation.presentationName.toLowerCase()}.";
      }
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
