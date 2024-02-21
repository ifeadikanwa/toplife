//the called dialogs already check for context mount status
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:toplife/core/dialogs/result_dialog.dart';
import 'package:toplife/core/utils/words/sentence_util.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/house/rent/end_lease_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/house/rent/sign_lease_for_rental_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_result_constants/shop_result_constants.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_house_name.dart';

class BreakOldLeaseSignNewLease {
  final EndLeaseUsecase _endLeaseUsecase;
  final SignLeaseForRentalUsecase _signLeaseForRentalUsecase;
  final JournalUsecases _journalUsecases;

  const BreakOldLeaseSignNewLease(
    this._endLeaseUsecase,
    this._signLeaseForRentalUsecase,
    this._journalUsecases,
  );

  Future<bool> execute({
    required BuildContext context,
    required int personID,
    required House newHouse,
    required House oldHouse,
    required int leaseDuration,
    required Game currentGame,
    required String country,
  }) async {
    //break lease
    await _endLeaseUsecase.execute(
      personID: personID,
      returnSecurityDeposit: false,
    );

    //sign lease
    final String firstPersonMoveStatus =
        await _signLeaseForRentalUsecase.execute(
      leaseDuration: leaseDuration,
      personID: personID,
      house: newHouse,
      currentDay: currentGame.currentDay,
      country: country,
    );

    //set entries
    final String journalEntry =
        "${ShopResultConstants.breakLeaseAndRentJournalEntry(
      oldHouseName: getHouseName(
        buildingType: oldHouse.buildingType,
        houseDesignStyle: oldHouse.style,
      ),
      newHouseName: getHouseName(
        buildingType: newHouse.buildingType,
        houseDesignStyle: newHouse.style,
      ),
      newHouseAddress: newHouse.address,
      newHouseStorage: newHouse.storage,
    )} $firstPersonMoveStatus";

    await _journalUsecases.addToJournalUsecase.execute(
      gameID: currentGame.id,
      day: currentGame.currentDay,
      mainPlayerID: personID,
      entry: journalEntry,
    );

    final String secondPersonResult =
        "${ShopResultConstants.houseRentedResultEntry(leaseDuration: leaseDuration)} \n${SentenceUtil.convertFromFirstPersonToSecondPerson(firstPersonSentence: firstPersonMoveStatus)} \n${ShopResultConstants.houseNoDepositResultEntry}";

    const String resultTitle =
        ShopResultConstants.houseRentCheckoutSuccessTitle;

    //return result dialog
    ResultDialog.show(
      context: context,
      title: resultTitle,
      result: secondPersonResult,
    );

    return true;
  }
}
