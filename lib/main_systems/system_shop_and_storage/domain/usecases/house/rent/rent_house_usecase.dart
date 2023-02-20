//the called dialogs already check for context mount status
// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:toplife/core/dialogs/choice_dialog.dart';
import 'package:toplife/core/dialogs/result_dialog.dart';
import 'package:toplife/core/utils/words/sentence_util.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/event_choice.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/house.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/repository/house_repository.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/house/rent/break_old_lease_sign_new_lease_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/house/rent/end_lease_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/house/rent/sign_lease_for_rental_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_result_constants/shop_result_constants.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_house_name.dart';

class RentHouseUsecase {
  final HouseRepository _houseRepository;
  final PersonUsecases _personUsecases;
  final GameUsecases _gameUsecases;
  final EndLeaseUsecase _endLeaseUsecase;
  final SignLeaseForRentalUsecase _signLeaseForRentalUsecase;
  final JournalUsecases _journalUsecases;
  final BreakOldLeaseSignNewLease _breakOldLeaseSignNewLease;

  const RentHouseUsecase(
    this._houseRepository,
    this._personUsecases,
    this._gameUsecases,
    this._endLeaseUsecase,
    this._signLeaseForRentalUsecase,
    this._journalUsecases,
    this._breakOldLeaseSignNewLease,
  );

  Future<void> execute({
    required BuildContext context,
    required int personID,
    required House house,
    required int leaseDuration,
  }) async {
    late final String journalEntry;
    late final String secondPersonResult;
    late final String resultTitle;

    final houseName = getHouseName(
      buildingType: house.buildingType,
      houseDesignStyle: house.style,
    );
    const houseQuantifier = "a";

    final Person? person = await _personUsecases.getPersonUsecase.execute(
      personID: personID,
    );

    final Game? currentGame =
        await _gameUsecases.getLastPlayedActiveGameUsecase.execute();

    //if person and game are valid, start processing
    if (person != null && currentGame != null) {
      //first rent is double: security deposit + rent
      final int baseHouseRentPrice = 2 * house.basePrice;

      //check if player has enough money
      final bool playerCanAffordIt =
          await _personUsecases.checkIfPlayerCanAffordItUsecase.execute(
        personID: personID,
        basePrice: baseHouseRentPrice,
        country: person.currentCountry,
        adjustToEconomy: true,
      );

      //player CANT afford it
      if (!playerCanAffordIt) {
        journalEntry = ShopResultConstants.noFundsForRentJournalEntry(
          houseName,
          houseQuantifier,
        );

        _journalUsecases.addToJournalUsecase.execute(
          gameID: currentGame.id,
          day: currentGame.currentDay,
          mainPlayerID: personID,
          entry: journalEntry,
        );

        secondPersonResult = ShopResultConstants.noFundsResultEntry;

        resultTitle = ShopResultConstants.houseCheckoutFailedTitle;
      }

      //player CAN afford it
      else {
        //check if they are renting another house
        //get all the player houses
        //filter it to see if any is for rent

        final allHouses = await _houseRepository.getAllHouses(
          personID,
        );

        final rentals = allHouses
            .where(
              (house) => house.isForRent == true,
            )
            .toList();

        //no rentals so rent
        if (rentals.isEmpty) {
          //rent the house
          final firstPersonMoveStatus =
              await _signLeaseForRentalUsecase.execute(
            leaseDuration: leaseDuration,
            personID: personID,
            house: house,
            currentDay: currentGame.currentDay,
            country: person.currentCountry,
          );

          //set entries
          journalEntry = "${ShopResultConstants.newRentJournalEntry(
            newHouseName: houseName,
            newHouseAddress: house.address,
            newHouseStorage: house.storage,
          )} $firstPersonMoveStatus";

          _journalUsecases.addToJournalUsecase.execute(
            gameID: currentGame.id,
            day: currentGame.currentDay,
            mainPlayerID: personID,
            entry: journalEntry,
          );

          //house rented + move status
          secondPersonResult =
              "${ShopResultConstants.houseRentedResultEntry(leaseDuration: leaseDuration)} \n${SentenceUtil.convertFromFirstPersonToSecondPerson(firstPersonSentence: firstPersonMoveStatus)}";

          resultTitle = ShopResultConstants.houseRentCheckoutSuccessTitle;
        }

        //lease is expired so rent
        else if (rentals.first.endOfLeaseDay == currentGame.currentDay) {
          //end expired lease
          await _endLeaseUsecase.execute(
            personID: personID,
            returnSecurityDeposit: true,
          );

          //rent the house and keep result string
          final String firstPersonMoveStatus =
              await _signLeaseForRentalUsecase.execute(
            leaseDuration: leaseDuration,
            personID: personID,
            house: house,
            currentDay: currentGame.currentDay,
            country: person.currentCountry,
          );

          //set entries
          journalEntry = "${ShopResultConstants.endLeaseAndRentJournalEntry(
            oldHouseName: getHouseName(
              buildingType: rentals.first.buildingType,
              houseDesignStyle: rentals.first.style,
            ),
            newHouseName: houseName,
            newHouseAddress: house.address,
            newHouseStorage: house.storage,
          )} $firstPersonMoveStatus";

          _journalUsecases.addToJournalUsecase.execute(
            gameID: currentGame.id,
            day: currentGame.currentDay,
            mainPlayerID: personID,
            entry: journalEntry,
          );

          //house rented + move status + security deposit
          secondPersonResult =
              "${ShopResultConstants.houseRentedResultEntry(leaseDuration: leaseDuration)} \n${SentenceUtil.convertFromFirstPersonToSecondPerson(firstPersonSentence: firstPersonMoveStatus)} \n${ShopResultConstants.houseReturnedDepositResultEntry}";

          resultTitle = ShopResultConstants.houseRentCheckoutSuccessTitle;
        }
        //currently renting a house, so DONT rent
        else {
          //tell the player that they are currently renting a house

          //they have the options to
          //break active lease and rent the house
          //or nevermind

          final EventChoice breakLeaseChoice = EventChoice(
            choiceDescription: ShopResultConstants.breakLeaseOption,
            choiceAction: (context) {
              _breakOldLeaseSignNewLease.execute(
                context: context,
                personID: personID,
                newHouse: house,
                oldHouse: rentals.first,
                leaseDuration: leaseDuration,
                currentGame: currentGame,
                country: person.currentCountry,
              );
            },
          );

          final EventChoice nevermindChoice = EventChoice(
            choiceDescription: ShopResultConstants.nevermindOption,
            choiceAction: (context) {
              AutoRouter.of(context).pop();
            },
          );

          return ChoiceDialog.show(
            context: context,
            categoryTitle: ShopResultConstants.breakLeaseTitle,
            eventDescription: ShopResultConstants.breakLeaseDescription,
            choices: [
              breakLeaseChoice,
              nevermindChoice,
            ],
          );
        }
      }

      //show result dialog
      return ResultDialog.show(
        context: context,
        title: resultTitle,
        result: secondPersonResult,
      );
    }

    //if invalid game or person
    else {
      ResultDialog.show(
        context: context,
        title: ShopResultConstants.houseCheckoutFailedTitle,
        result: ShopResultConstants.houseInvalidIDsResultEntry,
      );
    }
  }
}
