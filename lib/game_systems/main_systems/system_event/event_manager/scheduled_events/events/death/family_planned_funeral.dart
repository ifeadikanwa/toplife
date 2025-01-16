import 'dart:math';

import 'package:toplife/core/dialogs/dialog_handler.dart';
import 'package:toplife/core/utils/money/get_currency_and_money_string.dart';
import 'package:toplife/core/utils/numbers/get_random_int_in_positive_range.dart';
import 'package:toplife/core/utils/words/sentence_util.dart';
import 'package:toplife/core/utils/chance.dart';
import 'package:toplife/game_systems/game_manager/action_runner/info_models/action_result.dart';
import 'package:toplife/game_systems/game_manager/action_runner/info_models/report.dart';
import 'package:toplife/game_systems/main_systems/system_age/life_stage.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_event/constants/funeral_type.dart';
import 'package:toplife/game_systems/main_systems/system_event/event_manager/event_scheduler/event_schedulers.dart';
import 'package:toplife/game_systems/main_systems/system_event/event_manager/scheduled_events/events/death/death_descriptions.dart';
import 'package:toplife/game_systems/main_systems/system_event/event_manager/scheduled_events/events/death/death_event.dart';
import 'package:toplife/game_systems/main_systems/system_location/countries/country.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_location/util/get_country_economy_adjusted_price.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/vital_status.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_person/util/get_fullname_string.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/model/info_models/person_relationship_pair.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/util/label/get_platonic_and_romantic_relationship_label_from_string.dart.dart';

class FamilyPlannedFuneral {
  final PersonUsecases _personUsecases;
  final RelationshipUsecases _relationshipUsecases;
  final EventSchedulers _eventScheduler;
  final AgeUsecases _ageUsecases;

  const FamilyPlannedFuneral(
    this._personUsecases,
    this._relationshipUsecases,
    this._eventScheduler,
    this._ageUsecases,
  );

  Future<ActionResult> run({
    required int mainPlayerID,
    required Event deathEvent,
    required String firstPersonEventDescription,
    required Person deadPerson,
    required Country playerCountry,
    required DialogHandler dialogHandler,
  }) async {
    final bool isBurial = Chance.getTrueOrFalse();

    final FuneralType chosenFuneralType =
        isBurial ? FuneralType.Burial : FuneralType.Cremation;

    //btw 20% - 70%
    //random number / 100
    final int percentageOfCost =
        (getRandomIntInPositiveRange(min: 20, max: 70) / 100).ceil();

    //adjust to dead person's economy (not the player's)
    final int adjustedContribution = getCountryEconomyAdjustedPrice(
          country: deadPerson.currentCountry,
          basePrice: (chosenFuneralType == FuneralType.Burial)
              ? FuneralType.Burial.basePrice
              : FuneralType.Cremation.basePrice,
        ) *
        percentageOfCost;

    //get formatted money string
    final String formattedContributionString = getCurrencyAndMoneyString(
      country: playerCountry.name,
      amount: adjustedContribution,
      adjustToEconomy: false,
    );

    final String firstPersonFuneralArrangementsDescription =
        "The family decided to hold a ${chosenFuneralType.name.toLowerCase()} funeral, because ${DeathDescriptions.getRandomFuneralArrangementReason(deadPerson.gender)}.";

    //collect player input
    final bool? playerWillContribute =
        await dialogHandler.showFamilyPlannedFuneralDialog(
      eventDescription: SentenceUtil.convertFromFirstPersonToSecondPerson(
        firstPersonSentence: firstPersonEventDescription,
      ),
      funeralArrangementsDescription: firstPersonFuneralArrangementsDescription,
      formattedAdjustedPlayerContribution: formattedContributionString,
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
      return (playerWillContribute)
          ? await agreeToContributeToFuneral(
              mainPlayerID: mainPlayerID,
              deathEvent: deathEvent,
              firstPersonEventDescription: firstPersonEventDescription,
              firstPersonFuneralArrangementsDescription:
                  firstPersonFuneralArrangementsDescription,
              firstPersonResultDesc: firstPersonResultDesc,
              deadPerson: deadPerson,
              contribution: adjustedContribution,
              formattedContributionString: formattedContributionString,
              chosenFuneralType: chosenFuneralType,
              dialogHandler: dialogHandler,
            )
          : await refuseToContributeToFuneral(
              mainPlayerID: mainPlayerID,
              deathEvent: deathEvent,
              firstPersonEventDescription: firstPersonEventDescription,
              firstPersonFuneralArrangementsDescription:
                  firstPersonFuneralArrangementsDescription,
              firstPersonResultDesc: firstPersonResultDesc,
              deadPerson: deadPerson,
              contribution: adjustedContribution,
              formattedContributionString: formattedContributionString,
              chosenFuneralType: chosenFuneralType,
              dialogHandler: dialogHandler,
            );
    }

    //if player did not choose an input
    return ActionResult.failedWithNoReportOrJournalEntry();
  }

  Future<ActionResult> agreeToContributeToFuneral({
    required int mainPlayerID,
    required Event deathEvent,
    required String firstPersonEventDescription,
    required String firstPersonFuneralArrangementsDescription,
    required String firstPersonResultDesc,
    required Person deadPerson,
    required int contribution,
    required String formattedContributionString,
    required FuneralType chosenFuneralType,
    required DialogHandler dialogHandler,
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
      journalActionDesc = "I contributed $formattedContributionString.";
      comment = DeathDescriptions.getRandomContributionPositiveComment(
        deadPerson.gender,
      );
    } else {
      resultActionDesc = "You do not have enough funds.";
      journalActionDesc =
          "I wanted to contribute $formattedContributionString but I didn't have enough money.";
      comment = DeathDescriptions.getRandomContributionNoFundsComment(
        deadPerson.gender,
      );
    }

    //set journal entry
    final String journalEntry =
        "$firstPersonEventDescription $firstPersonFuneralArrangementsDescription $journalActionDesc $firstPersonResultDesc";

    //set result report
    final String resultDesc =
        "$resultActionDesc\n$comment.\n${SentenceUtil.convertFromFirstPersonToSecondPerson(firstPersonSentence: firstPersonResultDesc)}";

    final Report resultReport = Report(
      dialog: dialogHandler.showResultDialog(
        title: DeathEvent.resultTitle,
        result: resultDesc,
      ),
    );

    return ActionResult.successWithReportJournalEntryButNoDuration(
      report: resultReport,
      journalEntry: journalEntry,
    );
  }

  Future<ActionResult> refuseToContributeToFuneral({
    required int mainPlayerID,
    required Event deathEvent,
    required String firstPersonEventDescription,
    required String firstPersonFuneralArrangementsDescription,
    required String firstPersonResultDesc,
    required Person deadPerson,
    required int contribution,
    required String formattedContributionString,
    required FuneralType chosenFuneralType,
    required DialogHandler dialogHandler,
  }) async {
    //get siblings:
    //reduce relationship with all of them
    //pick 1 sibling and say they gave the negative response
    //if no siblings, get a random pibling and reduce relationship and say they gave the negative response
    //result dialog with negative response
    //
    late final String resultComment;

    //get comment from siblings
    final List<PersonRelationshipPair> playerSiblingsRelationshipPairs =
        await _relationshipUsecases.getAllSiblingsUsecase.execute(
      personID: mainPlayerID,
      includeOnly: VitalStatus.living,
    );

    if (playerSiblingsRelationshipPairs.isNotEmpty) {
      //reduce relationship with all siblings
      for (var siblingRelationshipPair in playerSiblingsRelationshipPairs) {
        final int negativeRelationshipChange = -(getRandomIntInPositiveRange(
          min: 20,
          max: 40,
        ));
        await _relationshipUsecases.updateRelationshipLevelUsecase.execute(
          firstPersonID: siblingRelationshipPair.relationship.firstPersonId,
          secondPersonID: siblingRelationshipPair.relationship.secondPersonId,
          change: negativeRelationshipChange,
        );
      }

      //choose a random sibling
      final PersonRelationshipPair chosenSiblingRelationshipPair =
          playerSiblingsRelationshipPairs[Random().nextInt(
        playerSiblingsRelationshipPairs.length,
      )];

      final Relationship chosenSiblingRelationship =
          chosenSiblingRelationshipPair.relationship;

      final Person siblingPerson = chosenSiblingRelationshipPair.person;

      //get the specific relationship label
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

    //get comment from a relative
    else {
      //get all relatives
      final List<PersonRelationshipPair> allRelatives =
          await _relationshipUsecases.getAllRelativesUsecase.execute(
        personID: mainPlayerID,
        includeOnly: VitalStatus.living,
      );

      //filter for relatives that are at least teens
      final List<PersonRelationshipPair> ageAppropriateRelatives = allRelatives
          .where(
            (relativePair) =>
                _ageUsecases.checkIfPersonIsAtLeastThisAgeUsecase.execute(
              currentDay: deathEvent.eventDay,
              dayOfBirth: relativePair.person.dayOfBirth,
              age: LifeStage.teen,
            ),
          )
          .toList();

      if (ageAppropriateRelatives.isNotEmpty) {
        //choose a random relative
        final PersonRelationshipPair chosenRelativeRelationshipPair =
            ageAppropriateRelatives[Random().nextInt(
          ageAppropriateRelatives.length,
        )];

        final Person chosenRelativePerson =
            chosenRelativeRelationshipPair.person;

        final Relationship chosenRelativeRelationship =
            chosenRelativeRelationshipPair.relationship;

        //reduce relationship
        final int negativeRelationshipChange = -(getRandomIntInPositiveRange(
          min: 20,
          max: 40,
        ));

        await _relationshipUsecases.updateRelationshipLevelUsecase.execute(
          firstPersonID: chosenRelativeRelationship.firstPersonId,
          secondPersonID: chosenRelativeRelationship.secondPersonId,
          change: negativeRelationshipChange,
        );

        //get specific relationship label
        final String relativeRelationshipLabel =
            getPlatonicAndRomanticRelationshipLabelFromString(
          genderString: chosenRelativePerson.gender,
          platonicRelationshipTypeString:
              chosenRelativeRelationship.platonicRelationshipType,
          romanticRelationshipTypeString:
              chosenRelativeRelationship.romanticRelationshipType,
          previousFamilialRelationshipString:
              chosenRelativeRelationship.previousFamilialRelationship,
          isCoParent: chosenRelativeRelationship.isCoParent,
          activeRomance: chosenRelativeRelationship.activeRomance,
        );
        resultComment =
            "Your $relativeRelationshipLabel, ${getFullNameString(firstName: chosenRelativePerson.firstName, lastName: chosenRelativePerson.lastName)} ${DeathDescriptions.getRandomContributionNegativeComment()}";
      }

      //no age appropriate relative
      else {
        resultComment = "";
      }
    }

    //set journal entry
    const journalActionDesc = "I refused to contribute.";

    final String journalEntry =
        "$firstPersonEventDescription $firstPersonFuneralArrangementsDescription $journalActionDesc $firstPersonResultDesc";

    //set result report
    final String resultDesc =
        "$resultComment.\n${SentenceUtil.convertFromFirstPersonToSecondPerson(
      firstPersonSentence: firstPersonResultDesc,
    )}";

    final Report resultReport = Report(
      dialog: dialogHandler.showResultDialog(
        title: DeathEvent.resultTitle,
        result: resultDesc,
      ),
    );

    return ActionResult.successWithReportJournalEntryButNoDuration(
      report: resultReport,
      journalEntry: journalEntry,
    );
  }
}
