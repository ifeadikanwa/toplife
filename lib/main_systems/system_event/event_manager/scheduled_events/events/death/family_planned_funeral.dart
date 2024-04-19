import 'dart:math';

import 'package:toplife/core/dialogs/dialog_handler.dart';
import 'package:toplife/core/utils/numbers/get_random_int_in_positive_range.dart';
import 'package:toplife/core/utils/words/sentence_util.dart';
import 'package:toplife/core/utils/chance.dart';
import 'package:toplife/main_systems/system_event/constants/funeral_type.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_scheduler/event_schedulers.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/death/death_descriptions.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/death/death_event.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_location/countries/country.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_location/util/get_country_economy_adjusted_price.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_id_pair.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_person/util/get_fullname_string.dart';
import 'package:toplife/main_systems/system_person/util/get_unknown_id_from_person_id_pair.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';
import 'package:toplife/main_systems/system_relationship/util/check/check_if_platonic_relationship_type_contains.dart';
import 'package:toplife/main_systems/system_relationship/util/label/get_platonic_and_romantic_relationship_label_from_string.dart.dart';

class FamilyPlannedFuneral {
  final PersonUsecases _personUsecases;
  final RelationshipUsecases _relationshipUsecases;
  final EventSchedulers _eventScheduler;
  final JournalUsecases _journalUsecases;
  final DialogHandler _dialogHandler;

  const FamilyPlannedFuneral(
    this._personUsecases,
    this._relationshipUsecases,
    this._eventScheduler,
    this._journalUsecases,
    this._dialogHandler,
  );

  Future<void> run({
    required int mainPlayerID,
    required Event deathEvent,
    required String firstPersonEventDescription,
    required Person deadPerson,
    required Country playerCountry,
  }) async {
    final bool isBurial = Chance.getTrueOrFalse();

    final FuneralType chosenFuneralType =
        isBurial ? FuneralType.Burial : FuneralType.Cremation;

    //btw 20 - 70
    final int percentageOfCost = getRandomIntInPositiveRange(min: 20, max: 70);

    final int contribution = getCountryEconomyAdjustedPrice(
          country: deadPerson.currentCountry,
          basePrice: (chosenFuneralType == FuneralType.Burial)
              ? FuneralType.Burial.basePrice
              : FuneralType.Cremation.basePrice,
        ) *
        (percentageOfCost / 100).ceil();

    final String firstPersonFuneralArrangementsDescription =
        "The family decided to hold a ${chosenFuneralType.name.toLowerCase()} funeral, because ${DeathDescriptions.getRandomFuneralArrangementReason(deadPerson.gender)}.";

    //collect player input
    final bool? playerWillContribute =
        await _dialogHandler.showFamilyPlannedFuneralDialog(
      eventDescription: SentenceUtil.convertFromFirstPersonToSecondPerson(
        firstPersonSentence: firstPersonEventDescription,
      ),
      funeralArrangementsDescription: firstPersonFuneralArrangementsDescription,
      playerContribution: contribution,
      playerCurrency: playerCountry.currency,
    );

    if (playerWillContribute != null) {
      //schedule funeral
      final Event scheduledFuneral =
          await _eventScheduler.scheduleFuneral.execute(
        gameID: deathEvent.gameId,
        mainPlayerID: mainPlayerID,
        deadPersonID: deathEvent.mainPersonId,
        currentDay: deathEvent.eventDay,
      );

      final String firstPersonResultDesc =
          DeathEvent.getFirstPersonFuneralArrangementString(
        funeralDay: scheduledFuneral.eventDay,
        startTime: scheduledFuneral.startTime,
      );

      //run the corresponding function
      (playerWillContribute)
          ? await agreeToContributeToFuneral(
              mainPlayerID: mainPlayerID,
              deathEvent: deathEvent,
              firstPersonEventDescription: firstPersonEventDescription,
              firstPersonFuneralArrangementsDescription:
                  firstPersonFuneralArrangementsDescription,
              firstPersonResultDesc: firstPersonResultDesc,
              deadPerson: deadPerson,
              playerCountry: playerCountry,
              contribution: contribution,
              chosenFuneralType: chosenFuneralType,
            )
          : await refuseToContributeToFuneral(
              mainPlayerID: mainPlayerID,
              deathEvent: deathEvent,
              firstPersonEventDescription: firstPersonEventDescription,
              firstPersonFuneralArrangementsDescription:
                  firstPersonFuneralArrangementsDescription,
              firstPersonResultDesc: firstPersonResultDesc,
              deadPerson: deadPerson,
              playerCountry: playerCountry,
              contribution: contribution,
              chosenFuneralType: chosenFuneralType,
            );
    }
  }

  Future<void> agreeToContributeToFuneral({
    required int mainPlayerID,
    required Event deathEvent,
    required String firstPersonEventDescription,
    required String firstPersonFuneralArrangementsDescription,
    required String firstPersonResultDesc,
    required Person deadPerson,
    required Country playerCountry,
    required int contribution,
    required FuneralType chosenFuneralType,
  }) async {
    //check if they can afford it
    //if they can, in result dialog:
    //- positive response
    //else
    //- 50/50 chance of positive or negative response

    final bool playerCanAffordToContribute =
        await _personUsecases.takeMoneyFromPlayerUsecase.execute(
      mainPlayerID: mainPlayerID,
      baseAmountToTake: contribution,
      adjustToEconomy: false,
    );

    late final String resultActionDesc;
    late final String journalActionDesc;
    late final String comment;

    if (playerCanAffordToContribute) {
      resultActionDesc = "Your contribution has been recieved.";
      journalActionDesc =
          "I contributed ${playerCountry.currency}$contribution.";
      comment = DeathDescriptions.getRandomContributionPositiveComment(
        deadPerson.gender,
      );
    } else {
      resultActionDesc = "You do not have enough funds.";
      journalActionDesc =
          "I wanted to contribute ${playerCountry.currency}$contribution but I didn't have enough money.";
      comment = DeathDescriptions.getRandomContributionNoFundsComment(
        deadPerson.gender,
      );
    }

    //Log info in journal
    await _journalUsecases.addToJournalUsecase.execute(
      gameID: deathEvent.gameId,
      day: deathEvent.eventDay,
      mainPlayerID: mainPlayerID,
      entry:
          "$firstPersonEventDescription $firstPersonFuneralArrangementsDescription $journalActionDesc $firstPersonResultDesc",
    );

    //show dialog
    final String result =
        "$resultActionDesc\n$comment.\n${SentenceUtil.convertFromFirstPersonToSecondPerson(firstPersonSentence: firstPersonResultDesc)}";

    return _dialogHandler.showResultDialog(
      title: DeathEvent.resultTitle,
      result: result,
    );
  }

  Future<void> refuseToContributeToFuneral({
    required int mainPlayerID,
    required Event deathEvent,
    required String firstPersonEventDescription,
    required String firstPersonFuneralArrangementsDescription,
    required String firstPersonResultDesc,
    required Person deadPerson,
    required Country playerCountry,
    required int contribution,
    required FuneralType chosenFuneralType,
  }) async {
    //get siblings:
    //reduce relationship with all of them
    //pick 1 sibling and say they gave the negative response
    //if no siblings, get a random pibling and reduce relationship and say they gave the negative response
    //result dialog with negative response
    //
    late final String resultComment;

    //get comment from siblings
    final List<Relationship> playerSiblingsRelationships =
        await _relationshipUsecases.getAllSiblingsUsecase.execute(
      personID: mainPlayerID,
    );

    if (playerSiblingsRelationships.isNotEmpty) {
      //reduce relationship with siblings
      for (var siblingRelationship in playerSiblingsRelationships) {
        await _relationshipUsecases.updateRelationshipLevelUsecase.execute(
          firstPersonID: siblingRelationship.firstPersonId,
          secondPersonID: siblingRelationship.secondPersonId,
          change: -(getRandomIntInPositiveRange(
            min: 20,
            max: 40,
          )),
        );
      }

      final Relationship chosenSiblingRelationship =
          playerSiblingsRelationships[Random().nextInt(
        playerSiblingsRelationships.length,
      )];

      final int chosenSiblingID = getUnkownIdFromPersonIdPair(
        personIdPair: PersonIdPair(
          firstId: chosenSiblingRelationship.firstPersonId,
          secondId: chosenSiblingRelationship.secondPersonId,
        ),
        knownId: mainPlayerID,
      );

      final Person? siblingPerson =
          await _personUsecases.getPersonUsecase.execute(
        personID: chosenSiblingID,
      );

      if (siblingPerson != null) {
        final String siblingRelationshipLabel =
            getPlatonicAndRomanticRelationshipLabelFromString(
          genderString: siblingPerson.gender,
          platonicRelationshipTypeString:
              chosenSiblingRelationship.platonicRelationshipType,
          romanticRelationshipTypeString:
              chosenSiblingRelationship.romanticRelationshipType,
          previousFamilialRelationshipString:
              chosenSiblingRelationship.previousFamilialRelationship,
          isCoParent: chosenSiblingRelationship.isCoParent,
          activeRomance: chosenSiblingRelationship.activeRomance,
        );

        resultComment =
            "Your $siblingRelationshipLabel, ${getFullNameString(firstName: siblingPerson.firstName, lastName: siblingPerson.lastName)} ${DeathDescriptions.getRandomContributionNegativeComment()}";
      }
    }
    //get comment from a pibling
    else {
      final List<Relationship> allRelatives =
          await _relationshipUsecases.getAllRelativesUsecase.execute(
        personID: mainPlayerID,
      );

      final List<Relationship> piblings = allRelatives
          .where(
            (element) => checkIfPlatonicRelationshipTypeStringContains(
              element.platonicRelationshipType,
              PlatonicRelationshipType.pibling,
            ),
          )
          .toList();

      if (piblings.isNotEmpty) {
        final Relationship chosenPiblingRelationship =
            piblings[Random().nextInt(
          piblings.length,
        )];

        //reduce relationship
        await _relationshipUsecases.updateRelationshipLevelUsecase.execute(
          firstPersonID: chosenPiblingRelationship.firstPersonId,
          secondPersonID: chosenPiblingRelationship.secondPersonId,
          change: -(getRandomIntInPositiveRange(
            min: 20,
            max: 40,
          )),
        );
        //get pibling person
        final int chosenPiblingID = getUnkownIdFromPersonIdPair(
          personIdPair: PersonIdPair(
            firstId: chosenPiblingRelationship.firstPersonId,
            secondId: chosenPiblingRelationship.secondPersonId,
          ),
          knownId: mainPlayerID,
        );

        final Person? piblingPerson =
            await _personUsecases.getPersonUsecase.execute(
          personID: chosenPiblingID,
        );

        if (piblingPerson != null) {
          final String piblingRelationshipLabel =
              getPlatonicAndRomanticRelationshipLabelFromString(
            genderString: piblingPerson.gender,
            platonicRelationshipTypeString:
                chosenPiblingRelationship.platonicRelationshipType,
            romanticRelationshipTypeString:
                chosenPiblingRelationship.romanticRelationshipType,
            previousFamilialRelationshipString:
                chosenPiblingRelationship.previousFamilialRelationship,
            isCoParent: chosenPiblingRelationship.isCoParent,
            activeRomance: chosenPiblingRelationship.activeRomance,
          );
          resultComment =
              "Your $piblingRelationshipLabel, ${getFullNameString(firstName: piblingPerson.firstName, lastName: piblingPerson.lastName)} ${DeathDescriptions.getRandomContributionNegativeComment()}";
        } else {
          resultComment = "";
        }
      }
    }

    //Log info in journal
    const journalActionDesc = "I refused to contribute.";
    await _journalUsecases.addToJournalUsecase.execute(
      gameID: deathEvent.gameId,
      day: deathEvent.eventDay,
      mainPlayerID: mainPlayerID,
      entry:
          "$firstPersonEventDescription $firstPersonFuneralArrangementsDescription $journalActionDesc $firstPersonResultDesc",
    );

    //show dialog
    final String result =
        "$resultComment.\n${SentenceUtil.convertFromFirstPersonToSecondPerson(
      firstPersonSentence: firstPersonResultDesc,
    )}";

    return _dialogHandler.showResultDialog(
      title: DeathEvent.resultTitle,
      result: result,
    );
  }
}
