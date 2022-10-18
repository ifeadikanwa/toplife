import 'dart:math';

import 'package:flutter/material.dart';
import 'package:toplife/core/dialogs/result_dialog.dart';
import 'package:toplife/main_systems/system_event/constants/event_stay_duration.dart';
import 'package:toplife/main_systems/system_event/domain/model/event.dart';
import 'package:toplife/main_systems/system_event/domain/repository/event_repository.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/info_models/storeroom_item_pair.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';

class AttendParty {
  final EventRepository _eventRepository;
  final PersonUsecases _personUsecases;
  final RelationshipUsecases _relationshipUsecases;
  final JournalUsecases _journalUsecases;
  final ShopAndStorageUsecases _shopAndStorageUsecases;

  const AttendParty(
    this._eventRepository,
    this._personUsecases,
    this._relationshipUsecases,
    this._journalUsecases,
    this._shopAndStorageUsecases,
  );
  Future<void> execute({
    required BuildContext context,
    required Event event,
    required int mainPlayerID,
    required EventStayDuration chosenEventStayDuration,
    required StoreroomItemPair? chosenGift,
    required double chosenMoneyGiftAmount,
    required String journalEntry,
    required String resultTitle,
    required String secondPersonResultDesc,
  }) async {
    //todo: move time forward

    //increase relationship w/ host, wellbeing and hunger
    await _personUsecases.eatUsecase.execute(
      personID: mainPlayerID,
      food: (Random().nextInt(30)), //1-30
    );

    _personUsecases.updateWellbeingStatsUsecase.execute(
      mainPersonID: mainPlayerID,
      change: Random().nextInt(20), //1-20
    );

    _relationshipUsecases.updateAnyRelationshipAmountUsecase.execute(
      personUsecases: _personUsecases,
      mainPersonID: mainPlayerID,
      relationshipPersonID: event.mainPersonID,
      relationshipToMainPerson: event.relationshipToMainPlayer,
      change: Random().nextInt(20) + 10, //10-20
    );

    //remove chosen gift from storage
    if (chosenGift != null && chosenGift.storeroomItem.id != null) {
      _shopAndStorageUsecases.useStoreroomItemUsecase.execute(
        storeroomItemID: chosenGift.storeroomItem.id!,
        personID: chosenGift.storeroomItem.personID,
      );
    }

    //remove chosen money gift from account
    _personUsecases.takeMoneyFromPlayerUsecase.execute(
      mainPlayerID: mainPlayerID,
      amountToTake: chosenMoneyGiftAmount.toInt(),
    );

    //log in journal
    _journalUsecases.addToJournalUsecase.execute(
      gameID: event.gameID,
      day: event.eventDay,
      mainPlayerID: mainPlayerID,
      entry: journalEntry,
    );

    //mark as performed
    _eventRepository.updateEvent(
      event.copyWith(
        performed: true,
      ),
    );

    //show result dialog
    ResultDialog.show(
      context: context,
      title: resultTitle,
      result: secondPersonResultDesc,
    );
  }
}
